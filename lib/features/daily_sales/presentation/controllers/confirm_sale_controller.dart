import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../providers/usecase_providers.dart';

part 'confirm_sale_controller.g.dart';

/// State for confirming a pending sale: the sale itself plus the serials
/// scanned so far for each item, keyed by item id, plus the OTP/proof-of-
/// purchase steps required to finalize once every item is serialized.
class ConfirmSaleState {
  final DailySale sale;
  final Map<int, List<String>> scannedSerials;
  final bool isSubmitting;
  final String? error;
  final DailySale? confirmedSale;

  final bool isSendingOtp;
  final String? otpMessage;
  final int? otpExpiresInMinutes;
  final bool isVerifyingOtp;
  final bool otpVerified;
  final String? otpCode;
  final File? proofOfPurchase;

  const ConfirmSaleState({
    required this.sale,
    required this.scannedSerials,
    this.isSubmitting = false,
    this.error,
    this.confirmedSale,
    this.isSendingOtp = false,
    this.otpMessage,
    this.otpExpiresInMinutes,
    this.isVerifyingOtp = false,
    this.otpVerified = false,
    this.otpCode,
    this.proofOfPurchase,
  });

  List<String> serialsFor(int itemId) => scannedSerials[itemId] ?? const [];

  bool isItemComplete(DailySaleItem item) =>
      serialsFor(item.id).length == item.quantity;

  /// Every item fully serialized — gates opening the finalize sheet.
  bool get canSubmit =>
      !isSubmitting && sale.items.every(isItemComplete);

  /// OTP verified and a proof-of-purchase photo attached — gates the
  /// finalize sheet's Submit button.
  bool get canFinalize =>
      !isSubmitting && otpVerified && otpCode != null && proofOfPurchase != null;

  ConfirmSaleState copyWith({
    Map<int, List<String>>? scannedSerials,
    bool? isSubmitting,
    String? error,
    bool clearError = false,
    DailySale? confirmedSale,
    bool? isSendingOtp,
    String? otpMessage,
    int? otpExpiresInMinutes,
    bool? isVerifyingOtp,
    bool? otpVerified,
    String? otpCode,
    bool clearOtpCode = false,
    File? proofOfPurchase,
  }) {
    return ConfirmSaleState(
      sale: sale,
      scannedSerials: scannedSerials ?? this.scannedSerials,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: clearError ? null : (error ?? this.error),
      confirmedSale: confirmedSale ?? this.confirmedSale,
      isSendingOtp: isSendingOtp ?? this.isSendingOtp,
      otpMessage: otpMessage ?? this.otpMessage,
      otpExpiresInMinutes: otpExpiresInMinutes ?? this.otpExpiresInMinutes,
      isVerifyingOtp: isVerifyingOtp ?? this.isVerifyingOtp,
      otpVerified: otpVerified ?? this.otpVerified,
      otpCode: clearOtpCode ? null : (otpCode ?? this.otpCode),
      proofOfPurchase: proofOfPurchase ?? this.proofOfPurchase,
    );
  }
}

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.
@riverpod
class ConfirmSaleController extends _$ConfirmSaleController {
  @override
  Future<ConfirmSaleState> build(int saleId) async {
    final usecase = await ref.watch(getDailySaleProvider.future);
    final result = await usecase(saleId);

    return result.fold((failure) => throw failure, (sale) {
      return ConfirmSaleState(
        sale: sale,
        scannedSerials: {for (final item in sale.items) item.id: <String>[]},
      );
    });
  }

  /// Returns an error message if the serial can't be added, else null.
  String? addSerial(int itemId, String rawSerial) {
    final current = state.valueOrNull;
    if (current == null) return null;

    final serial = rawSerial.trim();
    if (serial.isEmpty) return 'Serial number cannot be empty';

    final item = current.sale.items.firstWhere((i) => i.id == itemId);
    final existing = current.serialsFor(itemId);

    if (existing.length >= item.quantity) {
      return 'Already scanned ${item.quantity} of ${item.quantity} for this item';
    }

    final allScanned = current.scannedSerials.values.expand((s) => s);
    if (allScanned.contains(serial)) {
      return 'Serial "$serial" was already scanned for this sale';
    }

    final updated = Map<int, List<String>>.from(current.scannedSerials);
    updated[itemId] = [...existing, serial];
    state = AsyncData(current.copyWith(scannedSerials: updated, clearError: true));
    return null;
  }

  void removeSerial(int itemId, String serial) {
    final current = state.valueOrNull;
    if (current == null) return;

    final updated = Map<int, List<String>>.from(current.scannedSerials);
    updated[itemId] = [...current.serialsFor(itemId)]..remove(serial);
    state = AsyncData(current.copyWith(scannedSerials: updated));
  }

  /// Sends (or resends) the customer OTP. A resend invalidates any
  /// previously verified code, since the old code is no longer the live
  /// one on the server.
  Future<void> requestOtp() async {
    final current = state.valueOrNull;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        isSendingOtp: true,
        clearError: true,
        otpVerified: false,
        clearOtpCode: true,
      ),
    );

    final usecase = await ref.read(requestDailySaleOtpProvider.future);
    final result = await usecase(saleId);

    result.fold(
      (failure) {
        state = AsyncData(
          current.copyWith(isSendingOtp: false, error: failure.displayMessage),
        );
      },
      (otp) {
        state = AsyncData(
          current.copyWith(
            isSendingOtp: false,
            otpMessage: otp.message,
            otpExpiresInMinutes: otp.expiresInMinutes,
          ),
        );
      },
    );
  }

  /// Precheck of the entered code before the photo step unlocks. The final
  /// `confirm` call re-validates the code server-side regardless.
  Future<void> verifyOtp(String code) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final trimmed = code.trim();
    if (trimmed.isEmpty) {
      state = AsyncData(current.copyWith(error: 'Enter the code sent to the customer'));
      return;
    }

    state = AsyncData(
      current.copyWith(isVerifyingOtp: true, clearError: true),
    );

    final usecase = await ref.read(verifyDailySaleOtpProvider.future);
    final result = await usecase(
      VerifyDailySaleOtpParams(saleId: saleId, otpCode: trimmed),
    );

    result.fold(
      (failure) {
        state = AsyncData(
          current.copyWith(
            isVerifyingOtp: false,
            otpVerified: false,
            error: failure.displayMessage,
          ),
        );
      },
      (_) {
        state = AsyncData(
          current.copyWith(
            isVerifyingOtp: false,
            otpVerified: true,
            otpCode: trimmed,
          ),
        );
      },
    );
  }

  void setProofOfPurchase(File file) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData(current.copyWith(proofOfPurchase: file));
  }

  Future<bool> submit() async {
    final current = state.valueOrNull;
    if (current == null || !current.canSubmit || !current.canFinalize) {
      return false;
    }

    state = AsyncData(current.copyWith(isSubmitting: true, clearError: true));

    final usecase = await ref.read(confirmDailySaleProvider.future);
    final result = await usecase(
      ConfirmDailySaleParams(
        saleId: saleId,
        items: [
          for (final entry in current.scannedSerials.entries)
            (itemId: entry.key, serialNumbers: entry.value),
        ],
        otpCode: current.otpCode!,
        proofOfPurchase: current.proofOfPurchase!,
      ),
    );

    return result.fold(
      (failure) {
        state = AsyncData(
          current.copyWith(isSubmitting: false, error: failure.displayMessage),
        );
        return false;
      },
      (confirmed) {
        state = AsyncData(
          current.copyWith(isSubmitting: false, confirmedSale: confirmed),
        );
        return true;
      },
    );
  }
}
