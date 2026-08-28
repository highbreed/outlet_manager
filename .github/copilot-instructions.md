# Copilot Instructions for outlet_manager

## Project Overview
This is a Flutter multi-platform application targeting iOS, Android, Web, Linux, macOS, and Windows. The project is currently in its initial scaffold state with a single entry point at [lib/main.dart](../lib/main.dart).

## Development Environment
- **SDK**: Dart ^3.10.1 (Flutter stable channel)
- **Linting**: Uses `flutter_lints: ^6.0.0` with rules defined in [analysis_options.yaml](../analysis_options.yaml)
- **Package Manager**: Flutter pub (see [pubspec.yaml](../pubspec.yaml))

## Key Commands
```bash
# Get dependencies
flutter pub get

# Run on connected device/simulator
flutter run

# Run tests
flutter test

# Analyze code for issues
flutter analyze

# Build for specific platforms
flutter build apk          # Android
flutter build ios          # iOS
flutter build web          # Web
flutter build macos        # macOS
flutter build windows      # Windows
flutter build linux        # Linux
```

## Project Structure
- `lib/` - All Dart application code (currently only contains main.dart)
- `test/` - Widget and unit tests
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/` - Platform-specific code
- `pubspec.yaml` - Dependencies and asset configuration
- `analysis_options.yaml` - Linter rules and analysis configuration

## Code Conventions
- **State Management**: Currently uses StatefulWidget with setState() (see [lib/main.dart](../lib/main.dart))
- **Widget Keys**: Use const constructors with `super.key` for all widgets
- **Immutability**: Widget fields are marked `final`
- **Naming**: Private class members prefixed with underscore (e.g., `_counter`, `_incrementCounter`)
- **Testing**: Widget tests use `WidgetTester` from `flutter_test` package (see [test/widget_test.dart](../test/widget_test.dart))

## Hot Reload vs Hot Restart
- **Hot Reload** (r): Fast refresh preserving app state - use for most code changes
- **Hot Restart** (R): Full restart with state reset - required for:
  - Changes to `main()` function
  - Changes to global variables or const values
  - Adding/removing dependencies

## Testing Guidelines
- Widget tests should use `pumpWidget()` to build widgets
- Use `expect()` with finders like `find.text()`, `find.byIcon()`, `find.byType()`
- Call `tester.pump()` after interactions (tap, scroll) to trigger frame updates
- See example counter test in [test/widget_test.dart](../test/widget_test.dart)

## Adding Dependencies
1. Add to `pubspec.yaml` under `dependencies:` or `dev_dependencies:`
2. Run `flutter pub get` to fetch
3. Import in Dart files: `import 'package:package_name/package_name.dart';`

## Asset Management
Assets are configured in `pubspec.yaml` under the `flutter:` section. Uncomment the `assets:` section and add paths to include images, fonts, or other files in the app bundle.
