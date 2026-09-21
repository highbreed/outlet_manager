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

# --target-platform excludes the 32-bit armeabi-v7a (and x86) native builds.
# isar_community's bundled libmdbx crashes with SIGABRT on armeabi-v7a in
# production (debug assertions left enabled in its "release" native build -
# see isar-community/isar-community#33) - confirmed via Play Console
# (split_config.armeabi_v7a.apk!libisar.so, isar_key_add_long_list_hash) and
# Sentry (a Samsung SM-A135F crash whose abort() address falls in the
# 32-bit libc mapping range, despite that device's chipset being
# 64-bit-capable - Play was serving it the 32-bit split unnecessarily). The
# proper fix is an isar_community 3.3.2 upgrade, currently blocked on an
# unresolvable freezed/riverpod/build-tooling version conflict (see the
# migration plan). Restricting to 64-bit targets forces Play to serve
# arm64-v8a to any 64-bit-capable device instead, sidestepping the crash
# without that migration - remove this once the isar upgrade lands.
flutter build appbundle --release \
  --target-platform android-arm64,android-x64 \
  --dart-define=APP_REGION="$REGION" \
  --dart-define=APP_ENV=prod

dart run sentry_dart_plugin

echo "Done. Bundle: build/app/outputs/bundle/release/app-release.aab"
