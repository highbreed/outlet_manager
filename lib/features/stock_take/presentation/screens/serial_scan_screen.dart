import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';
import 'barcode_scanner_screen.dart';

/// Screen to scan/enter serial numbers for an item
class SerialScanScreen extends ConsumerStatefulWidget {
  final String sessionLocalId;
  final String itemLocalId;
  final String? itemName;
  final String? brandName;
  final String? category;
  final String? modelNumber;
  final int? minStockLevel;
  final int? maxStockLevel;
  final bool readOnly;

  const SerialScanScreen({
    super.key,
    required this.sessionLocalId,
    required this.itemLocalId,
    this.itemName,
    this.brandName,
    this.category,
    this.modelNumber,
    this.minStockLevel,
    this.maxStockLevel,
    this.readOnly = false,
  });

  @override
  ConsumerState<SerialScanScreen> createState() => _SerialScanScreenState();
}

class _SerialScanScreenState extends ConsumerState<SerialScanScreen> {
  final _serialController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isAdding = false;
  String? _validationMessage;
  bool _isValidationSuccess = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      ref
          .read(
            serialScanControllerProvider(
              widget.sessionLocalId,
              widget.itemLocalId,
            ).notifier,
          )
          .loadSerials();
    });
  }

  @override
  void dispose() {
    _serialController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serialState = ref.watch(
      serialScanControllerProvider(widget.sessionLocalId, widget.itemLocalId),
    );
    final serials = serialState.scannedSerials;
    final maxLevel = widget.maxStockLevel;
    final minLevel = widget.minStockLevel;

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          // The session screen's item list is refreshed here rather than by
          // the caller: some navigation paths to this screen (e.g. from the
          // Add Product flow) use pushReplacement, which resolves the
          // caller's awaited push before scanning even starts, so a
          // caller-side reload-on-return can't be relied on.
          ref
              .read(stockTakeSessionControllerProvider.notifier)
              .loadSessionItems(widget.sessionLocalId);
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: kBackground,
          body: Column(
            children: [
              _SerialHeader(
                itemName: widget.itemName ?? 'Scan Serials',
                subtitle: widget.brandName != null && widget.category != null
                    ? '${widget.brandName} · ${widget.category}'
                    : widget.brandName,
                validCount: serials.length,
                minLevel: minLevel,
                maxLevel: maxLevel,
                modelNumber: widget
                    .modelNumber, // You can pass the model number if available
              ),

              Expanded(
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      if (widget.readOnly)
                        const _Banner(
                          icon: Icons.visibility,
                          message: 'View only',
                          bg: kSecondaryLightColor,
                          fg: kSecondaryColor,
                        ),

                      if (serialState.errorMessage != null)
                        _Banner(
                          icon: Icons.error_outline,
                          message: serialState.errorMessage!,
                          bg: kRedColor.withValues(alpha: 0.08),
                          fg: kRedColor,
                          onDismiss: () => ref
                              .read(
                                serialScanControllerProvider(
                                  widget.sessionLocalId,
                                  widget.itemLocalId,
                                ).notifier,
                              )
                              .clearError(),
                        ),

                      if (_validationMessage != null)
                        _Banner(
                          icon: _isValidationSuccess
                              ? Icons.check_circle
                              : Icons.warning_amber,
                          message: _validationMessage!,
                          bg: _isValidationSuccess ? kSuccessBg : kWarningBg,
                          fg: _isValidationSuccess
                              ? kSuccessText
                              : kWarningText,
                        ),

                      if (!widget.readOnly)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: _isAdding || serialState.isLoading
                                    ? null
                                    : _openCameraScanner,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 22,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kTextDark,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white70,
                                        size: 26,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Scan with camera',
                                        style: TextStyle(
                                          color: kTextLight,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 46,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kPrimaryLightColor,
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(color: kBorderColor),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.qr_code_scanner,
                                            size: 15,
                                            color: kTextFaint,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: TextField(
                                              controller: _serialController,
                                              focusNode: _focusNode,
                                              enabled:
                                                  !_isAdding &&
                                                  !serialState.isLoading,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                              decoration: const InputDecoration(
                                                hintText:
                                                    'Or type serial manually',
                                                hintStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: kTextFaint,
                                                ),
                                                border: InputBorder.none,
                                                isDense: true,
                                                contentPadding: EdgeInsets.zero,
                                              ),
                                              textCapitalization:
                                                  TextCapitalization.characters,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.allow(
                                                  RegExp(r'[A-Za-z0-9]'),
                                                ),
                                                UpperCaseTextFormatter(),
                                              ],
                                              onSubmitted: (_) => _addSerial(),
                                              onChanged: (_) => setState(
                                                () => _validationMessage = null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: _isAdding || serialState.isLoading
                                        ? null
                                        : _addSerial,
                                    child: Container(
                                      height: 46,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kTextDark,
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: _isAdding
                                          ? const SizedBox(
                                              width: 16,
                                              height: 16,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: kTextLight,
                                              ),
                                            )
                                          : const Text(
                                              'Add',
                                              style: TextStyle(
                                                color: kTextLight,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      Expanded(
                        child: serialState.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : serials.isEmpty
                            ? _buildEmptyState()
                            : _buildSerialsList(serials),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                        child: PrimaryButton(
                          label: widget.readOnly
                              ? 'Close'
                              : "Done · ${serials.length} serials",
                          onPressed: !serialState.isLoading
                              ? () => Navigator.pop(context)
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.qr_code_scanner, size: 48, color: kTextFaint),
            SizedBox(height: 14),
            Text(
              'Ready to Scan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 6),
            Text(
              'Enter serial numbers manually or use the scanner',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSerialsList(List<SerialNumberEntry> serials) {
    final reversedSerials = serials.reversed.toList();

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 8),
      itemCount: reversedSerials.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              'SCANNED THIS SESSION',
              style: TextStyle(
                fontSize: 11,
                color: kTextFaint,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          );
        }

        final serial = reversedSerials[index - 1];
        final displayIndex = serials.length - (index - 1);

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kBorderColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$displayIndex. ${serial.displaySerial}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(Icons.check_circle, color: kSuccessText, size: 15),
                if (!widget.readOnly) ...[
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _showDeleteDialog(serial),
                    child: const Icon(
                      Icons.delete_outline,
                      color: kTextFaint,
                      size: 16,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openCameraScanner() async {
    final result = await Navigator.of(context).push<BarcodeScanResult>(
      MaterialPageRoute(
        builder: (context) => const BarcodeScannerScreen(
          title: 'Scan Serial Number',
          hintText: 'Position serial number barcode within the frame',
        ),
      ),
    );

    if (result == null || !mounted) return;

    HapticFeedback.mediumImpact();

    final scannedCode = _normalizeBarcode(result.barcode).toUpperCase();
    _serialController.text = scannedCode;

    await _addSerial();
  }

  Future<void> _addSerial() async {
    final rawInput = _serialController.text;
    final serialNumber = _normalizeBarcode(rawInput).toUpperCase();

    if (serialNumber != rawInput.trim().toUpperCase()) {
      _serialController.text = serialNumber;
    }

    if (serialNumber.isEmpty) {
      setState(() {
        _validationMessage = 'Please enter a serial number';
        _isValidationSuccess = false;
      });
      return;
    }

    if (_isLikelyUrl(serialNumber)) {
      setState(() {
        _validationMessage = 'URLs or links are not valid serial numbers';
        _isValidationSuccess = false;
      });
      return;
    }

    if (RegExp(r'^\d+$').hasMatch(serialNumber)) {
      setState(() {
        _validationMessage = 'Serial number cannot be all digits';
        _isValidationSuccess = false;
      });
      return;
    }

    final isMikaBrand =
        widget.brandName?.toLowerCase().contains('mika') ?? false;
    if (isMikaBrand && serialNumber.length < 10) {
      setState(() {
        _validationMessage =
            'Mika serial numbers must be at least 10 characters';
        _isValidationSuccess = false;
      });
      return;
    }

    if (serialNumber.length < 6 || serialNumber.length > 50) {
      setState(() {
        _validationMessage = 'Serial number must be 6–50 characters';
        _isValidationSuccess = false;
      });
      return;
    }

    if (_isRepetitivePattern(serialNumber)) {
      setState(() {
        _validationMessage = 'Serial number cannot be repetitive characters';
        _isValidationSuccess = false;
      });
      return;
    }

    final existingSerials = ref
        .read(
          serialScanControllerProvider(
            widget.sessionLocalId,
            widget.itemLocalId,
          ),
        )
        .scannedSerials;

    if (existingSerials.any((s) => s.serialNumberNorm == serialNumber)) {
      setState(() {
        _validationMessage = 'Serial already scanned';
        _isValidationSuccess = false;
      });
      HapticFeedback.heavyImpact();
      return;
    }

    setState(() {
      _isAdding = true;
      _validationMessage = null;
    });

    try {
      final validation = await ref
          .read(
            serialScanControllerProvider(
              widget.sessionLocalId,
              widget.itemLocalId,
            ).notifier,
          )
          .validateSerial(serialNumber);

      if (validation != null) {
        if (validation.isValid) {
          final result = await ref
              .read(
                serialScanControllerProvider(
                  widget.sessionLocalId,
                  widget.itemLocalId,
                ).notifier,
              )
              .addSerial(serialNumber);

          if (result != null && mounted) {
            _serialController.clear();
            _focusNode.requestFocus();
            setState(() {
              _validationMessage = 'Serial added successfully';
              _isValidationSuccess = true;
            });
            HapticFeedback.lightImpact();
          }
        } else {
          if (mounted) {
            setState(() {
              _validationMessage =
                  validation.message ?? 'Invalid serial number';
              _isValidationSuccess = false;
            });
            HapticFeedback.heavyImpact();
          }
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _validationMessage = 'Error: $e';
          _isValidationSuccess = false;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isAdding = false);
      }
    }
  }

  void _showDeleteDialog(SerialNumberEntry serial) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Serial?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Serial: ${serial.displaySerial}'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Reason for deletion (required)',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final reason = reasonController.text.trim();
              if (reason.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please provide a reason')),
                );
                return;
              }
              Navigator.pop(dialogContext);
              _deleteSerial(serial, reason);
            },
            style: FilledButton.styleFrom(backgroundColor: kRedColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteSerial(SerialNumberEntry serial, String reason) async {
    await ref
        .read(
          serialScanControllerProvider(
            widget.sessionLocalId,
            widget.itemLocalId,
          ).notifier,
        )
        .deleteSerial(serial.localId, reason);

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Serial deleted')));
    }
  }

  String _normalizeBarcode(String raw) {
    final trimmed = raw.trim();

    final semicolonIdx = trimmed.indexOf(';');
    if (semicolonIdx != -1 && semicolonIdx < trimmed.length - 1) {
      return trimmed.substring(semicolonIdx + 1).trim();
    }

    final colonIdx = trimmed.indexOf(':');
    if (colonIdx > 0 && colonIdx < trimmed.length - 1) {
      final prefix = trimmed.substring(0, colonIdx);
      if (!prefix.contains('.') && !prefix.contains('/')) {
        return trimmed.substring(colonIdx + 1).trim();
      }
    }

    return trimmed;
  }

  bool _isLikelyUrl(String input) {
    final lowerInput = input.toLowerCase();

    if (lowerInput.startsWith('http') ||
        lowerInput.startsWith('www') ||
        lowerInput.startsWith('ftp')) {
      return true;
    }

    final urlPattern = RegExp(
      r'^[a-z0-9]+([\-\.][a-z0-9]+)*\.[a-z]{2,}(\/.*)?$',
      caseSensitive: false,
    );
    if (urlPattern.hasMatch(input)) {
      return true;
    }

    return false;
  }

  bool _isRepetitivePattern(String input) {
    if (input.length < 3) return false;

    final firstChar = input[0];
    if (input.split('').every((c) => c == firstChar)) {
      return true;
    }

    for (
      int patternLength = 1;
      patternLength <= input.length ~/ 3;
      patternLength++
    ) {
      final pattern = input.substring(0, patternLength);
      final repeated = pattern * (input.length ~/ patternLength + 1);
      if (repeated.startsWith(input)) {
        if (patternLength < 3) {
          return true;
        }
      }
    }

    return false;
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────

class _SerialHeader extends StatelessWidget {
  final String itemName;
  final String? subtitle;
  final String? modelNumber;
  final int validCount;
  final int? minLevel;
  final int? maxLevel;

  const _SerialHeader({
    required this.itemName,
    required this.subtitle,
    required this.validCount,
    required this.minLevel,
    required this.maxLevel,
    required this.modelNumber,
  });

  @override
  Widget build(BuildContext context) {
    final showBar = maxLevel != null && maxLevel! > 0;
    final fillFraction = showBar
        ? (validCount / maxLevel!).clamp(0.0, 1.0)
        : 0.0;
    final minFraction = showBar && minLevel != null
        ? (minLevel! / maxLevel!).clamp(0.0, 1.0)
        : 0.0;
    final topInset = MediaQuery.paddingOf(context).top;

    return Container(
      width: double.infinity,
      color: kTextDark,
      padding: EdgeInsets.fromLTRB(20, topInset + 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back,
                  color: kTextLight,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: const TextStyle(
                        color: kTextLight,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (modelNumber != null)
                      Text(
                        modelNumber!,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                        ),
                      ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (showBar) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 12,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 6,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      Container(
                        height: 6,
                        width: width * fillFraction,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      Positioned(
                        left: (width * minFraction).clamp(0.0, width - 1.5),
                        child: Container(
                          width: 1.5,
                          height: 12,
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 6),
          ] else
            const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                showBar ? 'Min $minLevel · Max $maxLevel' : ' ',
                style: const TextStyle(color: Colors.white54, fontSize: 11),
              ),
              Text(
                '$validCount valid serials',
                style: const TextStyle(
                  color: kTextLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color bg;
  final Color fg;
  final VoidCallback? onDismiss;

  const _Banner({
    required this.icon,
    required this.message,
    required this.bg,
    required this.fg,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: bg,
      child: Row(
        children: [
          Icon(icon, color: fg, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: fg,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (onDismiss != null)
            GestureDetector(
              onTap: onDismiss,
              child: Icon(Icons.close, color: fg, size: 16),
            ),
        ],
      ),
    );
  }
}

/// Text input formatter that converts text to uppercase
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
