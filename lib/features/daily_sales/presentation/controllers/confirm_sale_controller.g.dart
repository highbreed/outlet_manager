// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_sale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.

@ProviderFor(ConfirmSaleController)
const confirmSaleControllerProvider = ConfirmSaleControllerFamily._();

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.
final class ConfirmSaleControllerProvider
    extends $AsyncNotifierProvider<ConfirmSaleController, ConfirmSaleState> {
  /// Loads a pending sale and collects the serial numbers required to
  /// confirm it — exactly `quantity` distinct serials per item.
  const ConfirmSaleControllerProvider._({
    required ConfirmSaleControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'confirmSaleControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$confirmSaleControllerHash();

  @override
  String toString() {
    return r'confirmSaleControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConfirmSaleController create() => ConfirmSaleController();

  @override
  bool operator ==(Object other) {
    return other is ConfirmSaleControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$confirmSaleControllerHash() =>
    r'6abb54afa70fccec1c2db583245e2fa69f1ff0c0';

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.

final class ConfirmSaleControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ConfirmSaleController,
          AsyncValue<ConfirmSaleState>,
          ConfirmSaleState,
          FutureOr<ConfirmSaleState>,
          int
        > {
  const ConfirmSaleControllerFamily._()
    : super(
        retry: null,
        name: r'confirmSaleControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads a pending sale and collects the serial numbers required to
  /// confirm it — exactly `quantity` distinct serials per item.

  ConfirmSaleControllerProvider call(int saleId) =>
      ConfirmSaleControllerProvider._(argument: saleId, from: this);

  @override
  String toString() => r'confirmSaleControllerProvider';
}

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.

abstract class _$ConfirmSaleController
    extends $AsyncNotifier<ConfirmSaleState> {
  late final _$args = ref.$arg as int;
  int get saleId => _$args;

  FutureOr<ConfirmSaleState> build(int saleId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<ConfirmSaleState>, ConfirmSaleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ConfirmSaleState>, ConfirmSaleState>,
              AsyncValue<ConfirmSaleState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
