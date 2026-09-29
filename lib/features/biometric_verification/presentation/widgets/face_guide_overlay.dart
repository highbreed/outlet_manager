import 'package:flutter/material.dart';

/// Oval face-position guide drawn over the camera preview. [aligned]
/// changes its color — but per the Phase 4 plan's accessibility
/// requirement, color is never the ONLY signal; callers pair this with
/// text instructions (see [LivenessInstructionBanner]).
class FaceGuideOverlay extends StatelessWidget {
  final bool aligned;

  const FaceGuideOverlay({super.key, this.aligned = false});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FaceGuidePainter(aligned: aligned),
      child: const SizedBox.expand(),
    );
  }
}

class _FaceGuidePainter extends CustomPainter {
  final bool aligned;

  _FaceGuidePainter({required this.aligned});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.4);
    final ovalWidth = size.width * 0.7;
    final ovalHeight = ovalWidth * 1.3;
    final rect = Rect.fromCenter(center: center, width: ovalWidth, height: ovalHeight);

    final overlayPaint = Paint()..color = Colors.black.withValues(alpha: 0.5);
    final fullPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final ovalPath = Path()..addOval(rect);
    final cutoutPath = Path.combine(PathOperation.difference, fullPath, ovalPath);
    canvas.drawPath(cutoutPath, overlayPaint);

    final borderPaint = Paint()
      ..color = aligned ? Colors.greenAccent : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawOval(rect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _FaceGuidePainter oldDelegate) => oldDelegate.aligned != aligned;
}
