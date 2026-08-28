import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/theme/colors.dart';

/// Result from barcode scanner
class BarcodeScanResult {
  final String barcode;
  final BarcodeFormat format;
  final DateTime scannedAt;

  const BarcodeScanResult({
    required this.barcode,
    required this.format,
    required this.scannedAt,
  });
}

/// Full-screen barcode scanner with camera preview
class BarcodeScannerScreen extends StatefulWidget {
  /// Title shown in the app bar
  final String title;

  /// Whether to return immediately after first scan or allow multiple scans
  final bool singleScan;

  /// Allowed barcode formats (null = all formats)
  final List<BarcodeFormat>? formats;

  /// Optional hint text shown above the scan area
  final String? hintText;

  const BarcodeScannerScreen({
    super.key,
    this.title = 'Scan Barcode',
    this.singleScan = true,
    this.formats,
    this.hintText,
  });

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  MobileScannerController? _controller;
  bool _isProcessing = false;
  bool _torchEnabled = false;
  String? _lastScannedCode;
  final List<BarcodeScanResult> _scannedCodes = [];

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
      formats: widget.formats ?? const [],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isProcessing) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final barcode = barcodes.first;
    final code = barcode.rawValue;

    if (code == null || code.isEmpty) return;

    // Prevent duplicate scans of the same code
    if (code == _lastScannedCode) return;

    setState(() {
      _isProcessing = true;
      _lastScannedCode = code;
    });

    // Haptic feedback on successful scan
    HapticFeedback.mediumImpact();

    final result = BarcodeScanResult(
      barcode: code,
      format: barcode.format,
      scannedAt: DateTime.now(),
    );

    if (widget.singleScan) {
      // Return immediately with the result
      Navigator.of(context).pop(result);
    } else {
      // Add to list and allow more scans
      setState(() {
        _scannedCodes.add(result);
        _isProcessing = false;
      });

      // Reset last scanned code after a delay to allow rescanning
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _lastScannedCode = null);
        }
      });
    }
  }

  void _toggleTorch() async {
    await _controller?.toggleTorch();
    setState(() => _torchEnabled = !_torchEnabled);
  }

  void _switchCamera() async {
    await _controller?.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scanAreaSize = size.width * 0.7;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(widget.title),
        actions: [
          // Torch toggle
          IconButton(
            icon: Icon(
              _torchEnabled ? Icons.flash_on : Icons.flash_off,
              color: _torchEnabled ? Colors.yellow : Colors.white,
            ),
            onPressed: _toggleTorch,
            tooltip: 'Toggle flashlight',
          ),
          // Camera switch
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: _switchCamera,
            tooltip: 'Switch camera',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera preview
          if (_controller != null)
            MobileScanner(
              controller: _controller!,
              onDetect: _onDetect,
              errorBuilder: (context, error) {
                return _buildErrorWidget(error);
              },
            ),

          // Scan overlay
          _ScanOverlay(
            scanAreaSize: scanAreaSize,
            hintText: widget.hintText ?? 'Position barcode within the frame',
          ),

          // Multi-scan results (if not single scan mode)
          if (!widget.singleScan && _scannedCodes.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _ScannedCodesList(
                codes: _scannedCodes,
                onDone: () => Navigator.of(context).pop(_scannedCodes),
                onRemove: (index) {
                  setState(() => _scannedCodes.removeAt(index));
                },
              ),
            ),

          // Processing indicator
          if (_isProcessing && widget.singleScan)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'Processing...',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(MobileScannerException error) {
    String message;
    IconData icon;

    switch (error.errorCode) {
      case MobileScannerErrorCode.permissionDenied:
        message =
            'Camera permission denied.\nPlease enable camera access in settings.';
        icon = Icons.no_photography;
        break;
      case MobileScannerErrorCode.unsupported:
        message = 'Camera not supported on this device.';
        icon = Icons.videocam_off;
        break;
      default:
        message =
            'Error initializing camera:\n${error.errorDetails?.message ?? "Unknown error"}';
        icon = Icons.error_outline;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: Colors.white54),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

/// Overlay with scan area cutout
class _ScanOverlay extends StatelessWidget {
  final double scanAreaSize;
  final String hintText;

  const _ScanOverlay({required this.scanAreaSize, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dark overlay with cutout
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  backgroundBlendMode: BlendMode.dstOut,
                ),
              ),
              Center(
                child: Container(
                  width: scanAreaSize,
                  height: scanAreaSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Corner brackets
        Center(
          child: SizedBox(
            width: scanAreaSize,
            height: scanAreaSize,
            child: CustomPaint(painter: _CornersPainter()),
          ),
        ),

        // Hint text
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: 0,
          right: 0,
          child: Text(
            hintText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Scan line animation
        Center(
          child: SizedBox(
            width: scanAreaSize - 20,
            height: scanAreaSize,
            child: const _ScanLineAnimation(),
          ),
        ),
      ],
    );
  }
}

/// Animated scan line
class _ScanLineAnimation extends StatefulWidget {
  const _ScanLineAnimation();

  @override
  State<_ScanLineAnimation> createState() => _ScanLineAnimationState();
}

class _ScanLineAnimationState extends State<_ScanLineAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Align(
          alignment: Alignment(0, -1 + 2 * _controller.value),
          child: Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  kSecondaryColor.withValues(alpha: 0.8),
                  kSecondaryColor,
                  kSecondaryColor.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Paints corner brackets
class _CornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kSecondaryColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLength = 30.0;
    const radius = 12.0;

    // Top-left
    canvas.drawPath(
      Path()
        ..moveTo(0, cornerLength)
        ..lineTo(0, radius)
        ..arcToPoint(
          const Offset(radius, 0),
          radius: const Radius.circular(radius),
        )
        ..lineTo(cornerLength, 0),
      paint,
    );

    // Top-right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerLength, 0)
        ..lineTo(size.width - radius, 0)
        ..arcToPoint(
          Offset(size.width, radius),
          radius: const Radius.circular(radius),
        )
        ..lineTo(size.width, cornerLength),
      paint,
    );

    // Bottom-left
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - cornerLength)
        ..lineTo(0, size.height - radius)
        ..arcToPoint(
          Offset(radius, size.height),
          radius: const Radius.circular(radius),
        )
        ..lineTo(cornerLength, size.height),
      paint,
    );

    // Bottom-right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerLength, size.height)
        ..lineTo(size.width - radius, size.height)
        ..arcToPoint(
          Offset(size.width, size.height - radius),
          radius: const Radius.circular(radius),
        )
        ..lineTo(size.width, size.height - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// List of scanned codes for multi-scan mode
class _ScannedCodesList extends StatelessWidget {
  final List<BarcodeScanResult> codes;
  final VoidCallback onDone;
  final void Function(int index) onRemove;

  const _ScannedCodesList({
    required this.codes,
    required this.onDone,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 250),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.qr_code, color: kSuccessColor),
                const SizedBox(width: 8),
                Text(
                  '${codes.length} code(s) scanned',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: onDone,
                  style: FilledButton.styleFrom(
                    backgroundColor: kTextDark,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // List
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: codes.length,
              itemBuilder: (context, index) {
                final code = codes[index];
                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    radius: 16,
                    child: Text('${index + 1}'),
                  ),
                  title: Text(
                    code.barcode,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                  subtitle: Text(code.format.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => onRemove(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
