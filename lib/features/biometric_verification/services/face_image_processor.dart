import 'dart:typed_data';

import '../domain/entities/captured_face_frame.dart';

/// Crops (to the face bounding box + padding), corrects orientation,
/// resizes, and JPEG-compresses a captured frame — never uploads the raw
/// full-resolution photo. Runs the actual pixel work via `compute()` (see
/// [DefaultFaceImageProcessor]) to keep it off the UI thread.
abstract class FaceImageProcessor {
  Future<Uint8List> process(CapturedFaceFrame frame);
}
