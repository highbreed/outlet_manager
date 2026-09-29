#!/usr/bin/env bash
# Builds the release app bundle and uploads debug symbols/source maps to
# Sentry, so crash stack traces for release builds are readable instead of
# raw memory offsets. Run this instead of a bare `flutter build appbundle`
# before uploading to the Play Store.
#
# Usage: scripts/release_appbundle.sh [ke|rw]   (defaults to ke)
set -euo pipefail

cd "$(dirname "$0")/.."

REGION="${1:-ke}"
case "$REGION" in
  ke|rw) ;;
  *)
    echo "Unknown region '$REGION' (expected: ke, rw)" >&2
    exit 1
    ;;
esac

# NOTE: this used to pass --target-platform android-arm64,android-x64 to
# exclude the 32-bit armeabi-v7a native build, working around a crash in
# isar_community's bundled libmdbx on armeabi-v7a (debug assertions left
# enabled in its "release" native build - isar-community/isar-community#33).
# That excluded genuinely 32-bit-only devices (confirmed on a real Samsung
# SM-A135F: no arm64-v8a fallback exists for a device with no 64-bit ABI at
# all, so it couldn't launch the app whatsoever) - a materially worse
# outcome than the crash it was working around. The isar_community 3.3.2
# upgrade (see the migration plan) fixes the underlying bug directly,
# confirmed live on that same SM-A135F: fresh install, reached the isar
# database-open step that used to crash, zero errors. Restriction removed -
# all ABIs build normally now.
flutter build appbundle --release \
  --dart-define=APP_REGION="$REGION" \
  --dart-define=APP_ENV=prod

dart run sentry_dart_plugin

echo "Done. Bundle: build/app/outputs/bundle/release/app-release.aab"
