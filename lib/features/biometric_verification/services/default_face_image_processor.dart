import 'dart:developer' as developer;
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show compute;
import 'package:image/image.dart' as img;

import '../domain/config/biometric_config.dart';
import '../domain/entities/captured_face_frame.dart';
import 'face_image_processor.dart';

class _ProcessParams {
  final Uint8List sourceBytes;
  final double boundingBoxLeft;
  final double boundingBoxTop;
  final double boundingBoxWidth;
  final double boundingBoxHeight;
  final int rotationDegrees;
  final double cropPaddingRatio;
  final int targetOutputLongSidePx;
  final int captureJpegQuality;

  const _ProcessParams({
    required this.sourceBytes,
    required this.boundingBoxLeft,
    required this.boundingBoxTop,
    required this.boundingBoxWidth,
    required this.boundingBoxHeight,
    required this.rotationDegrees,
    required this.cropPaddingRatio,
    required this.targetOutputLongSidePx,
    required this.captureJpegQuality,
  });
}

/// `image`-package-backed implementation:
/// decode -> crop (bbox + padding, in the ORIGINAL frame's orientation,
/// since [CapturedFaceFrame.pose]'s bounding box was measured against
/// that orientation) -> rotate (cheaper once the image is already small)
/// -> resize -> JPEG encode. Everything after decode runs on a small,
/// already-cropped image, keeping the expensive full-frame work minimal.
///
/// Deliberately does NOT step down JPEG quality to force a byte ceiling —
/// see [BiometricConfig]'s doc comment. [idealMaxOutputBytes]/
/// [acceptableMaxOutputBytes] are logged for later tuning, never
/// re-encoded against.
class DefaultFaceImageProcessor implements FaceImageProcessor {
  final BiometricConfig config;

  DefaultFaceImageProcessor({this.config = const BiometricConfig()});

  @override
  Future<Uint8List> process(CapturedFaceFrame frame) async {
    final result = await compute(
      _processInIsolate,
      _ProcessParams(
        sourceBytes: frame.bytes,
        boundingBoxLeft: frame.pose.boundingBoxLeft,
        boundingBoxTop: frame.pose.boundingBoxTop,
        boundingBoxWidth: frame.pose.boundingBoxWidth,
        boundingBoxHeight: frame.pose.boundingBoxHeight,
        rotationDegrees: frame.rotationDegrees,
        cropPaddingRatio: config.cropPaddingRatio,
        targetOutputLongSidePx: config.targetOutputLongSidePx,
        captureJpegQuality: config.captureJpegQuality,
      ),
    );

    if (result.length > config.acceptableMaxOutputBytes) {
      developer.log(
        '[DefaultFaceImageProcessor] output ${result.length} bytes exceeds '
        'acceptableMaxOutputBytes (${config.acceptableMaxOutputBytes}) — '
        'logged for tuning, not re-encoded.',
        name: 'DefaultFaceImageProcessor',
      );
    }
    return result;
  }
}

Uint8List _processInIsolate(_ProcessParams params) {
  final decoded = img.decodeImage(params.sourceBytes);
  if (decoded == null) {
    throw const FormatException('Could not decode captured frame');
  }

  // Padded crop rect, centered on the detected face's bounding box,
  // clamped to the source image's bounds.
  final padX = params.boundingBoxWidth * params.cropPaddingRatio;
  final padY = params.boundingBoxHeight * params.cropPaddingRatio;
  final cropLeft = (params.boundingBoxLeft - padX).clamp(0, decoded.width.toDouble());
  final cropTop = (params.boundingBoxTop - padY).clamp(0, decoded.height.toDouble());
  final cropRight = (params.boundingBoxLeft + params.boundingBoxWidth + padX)
      .clamp(0, decoded.width.toDouble());
  final cropBottom = (params.boundingBoxTop + params.boundingBoxHeight + padY)
      .clamp(0, decoded.height.toDouble());
  final cropWidth = (cropRight - cropLeft).clamp(1, decoded.width.toDouble());
  final cropHeight = (cropBottom - cropTop).clamp(1, decoded.height.toDouble());

  var processed = img.copyCrop(
    decoded,
    x: cropLeft.round(),
    y: cropTop.round(),
    width: cropWidth.round(),
    height: cropHeight.round(),
  );

  if (params.rotationDegrees % 360 != 0) {
    processed = img.copyRotate(processed, angle: params.rotationDegrees);
  }

  final longSide = processed.width >= processed.height ? processed.width : processed.height;
  if (longSide > params.targetOutputLongSidePx) {
    processed = processed.width >= processed.height
        ? img.copyResize(processed, width: params.targetOutputLongSidePx)
        : img.copyResize(processed, height: params.targetOutputLongSidePx);
  }

  return img.encodeJpg(processed, quality: params.captureJpegQuality);
}
