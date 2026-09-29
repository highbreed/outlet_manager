import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/entities/mapping_sample.dart';

/// Plots the actual captured samples for this session — spec §26/§78's
/// "reasonable enhancement" over the original static placeholder. Never
/// the authoritative footprint (the backend computes that from the same
/// samples) and never drawn as a closed polygon/boundary shape, only an
/// open polyline of where the device has actually been.
///
/// Projected with a flat equirectangular approximation relative to the
/// FIRST sample (fine at outlet scale, a few hundred meters at most) —
/// no map SDK, matching the discovery doc's "not required for V1" call.
class MappingTrailPainter extends CustomPainter {
  final List<MappingSample> samples;

  const MappingTrailPainter({required this.samples});

  static const _metersPerDegreeLat = 111320.0;
  static const _padding = 24.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (samples.isEmpty) return;

    if (samples.length == 1) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        4,
        Paint()..color = Colors.white70,
      );
      return;
    }

    final origin = samples.first;
    final metersPerDegreeLng =
        _metersPerDegreeLat * cos(origin.latitude * pi / 180);

    final meterPoints = samples
        .map(
          (s) => Offset(
            (s.longitude - origin.longitude) * metersPerDegreeLng,
            (s.latitude - origin.latitude) * _metersPerDegreeLat,
          ),
        )
        .toList();

    var minX = meterPoints.first.dx;
    var maxX = meterPoints.first.dx;
    var minY = meterPoints.first.dy;
    var maxY = meterPoints.first.dy;
    for (final p in meterPoints) {
      if (p.dx < minX) minX = p.dx;
      if (p.dx > maxX) maxX = p.dx;
      if (p.dy < minY) minY = p.dy;
      if (p.dy > maxY) maxY = p.dy;
    }
    final spanX = maxX - minX;
    final spanY = maxY - minY;

    final availableW = max(size.width - _padding * 2, 1.0);
    final availableH = max(size.height - _padding * 2, 1.0);

    // Degenerate span (still standing near the first fix) — draw at a
    // fixed, readable scale rather than dividing by ~zero.
    final scale = (spanX < 1 && spanY < 1)
        ? 1.0
        : [
            if (spanX >= 1) availableW / spanX,
            if (spanY >= 1) availableH / spanY,
          ].reduce(min);

    final centerMeters = Offset((minX + maxX) / 2, (minY + maxY) / 2);
    final canvasCenter = Offset(size.width / 2, size.height / 2);

    Offset toScreen(Offset meters) {
      final delta = meters - centerMeters;
      // Flip Y — latitude increases north, canvas Y increases downward.
      return canvasCenter + Offset(delta.dx * scale, -delta.dy * scale);
    }

    final screenPoints = meterPoints.map(toScreen).toList();

    final path = Path()..moveTo(screenPoints.first.dx, screenPoints.first.dy);
    for (final p in screenPoints.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.greenAccent.withValues(alpha: 0.85)
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // Start marker (dim) and current-position marker (bright), so the
    // direction of travel is legible at a glance.
    canvas.drawCircle(screenPoints.first, 4, Paint()..color = Colors.white38);
    canvas.drawCircle(screenPoints.last, 5, Paint()..color = Colors.greenAccent);
  }

  @override
  bool shouldRepaint(covariant MappingTrailPainter oldDelegate) =>
      oldDelegate.samples.length != samples.length;
}
