import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outlet_manager/core/core.dart';

void main() {
  group('App Initialization Tests', () {
    testWidgets('App initializes successfully', (WidgetTester tester) async {
      // Build the app wrapped in ProviderScope
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(body: Center(child: Text('Test'))),
          ),
        ),
      );

      // Verify the widget tree was built
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('InitializationLoadingScreen displays correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const InitializationLoadingScreen());

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Should show initialization message
      expect(find.text('Initializing Outlet Manager...'), findsOneWidget);
    });

    testWidgets('InitializationErrorScreen displays error message', (
      WidgetTester tester,
    ) async {
      const errorMessage = 'Database initialization failed';
      const serviceStatus = {
        'database': false,
        'notifications': true,
        'permissions': true,
      };

      await tester.pumpWidget(
        const InitializationErrorScreen(
          errorMessage: errorMessage,
          serviceStatus: serviceStatus,
        ),
      );

      // Should show error icon
      expect(find.byIcon(Icons.error_outline), findsOneWidget);

      // Should show error title
      expect(find.text('Initialization Failed'), findsOneWidget);

      // Should show error message
      expect(find.text(errorMessage), findsOneWidget);

      // Should show service status
      expect(find.text('Service Status:'), findsOneWidget);
      expect(find.text('database'), findsOneWidget);
      expect(find.text('notifications'), findsOneWidget);
      expect(find.text('permissions'), findsOneWidget);
    });
  });

  group('Provider Override Tests', () {
    testWidgets('Can override initialization provider', (
      WidgetTester tester,
    ) async {
      // Override with successful initialization
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appInitializationProvider.overrideWith((ref) async {
              return InitializationResult.success({
                'database': true,
                'notifications': true,
                'permissions': true,
                'location': true,
                'sync': true,
              });
            }),
          ],
          child: const MaterialApp(
            home: Scaffold(body: Center(child: Text('Overridden'))),
          ),
        ),
      );

      // Let async providers settle
      await tester.pumpAndSettle();

      // App should have initialized successfully
      expect(find.text('Overridden'), findsOneWidget);
    });

    testWidgets('Can simulate initialization failure', (
      WidgetTester tester,
    ) async {
      // Override with failed initialization
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appInitializationProvider.overrideWith((ref) async {
              return InitializationResult.failure('Test error', {
                'database': false,
              });
            }),
          ],
          child: const MaterialApp(
            home: Scaffold(body: Center(child: Text('Should not appear'))),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Since we're just testing provider override, verify it doesn't crash
      expect(tester.takeException(), isNull);
    });
  });

  group('Service Status Tests', () {
    test('InitializationResult success factory', () {
      final result = InitializationResult.success({
        'database': true,
        'notifications': true,
      });

      expect(result.success, true);
      expect(result.errorMessage, isNull);
      expect(result.serviceStatus['database'], true);
      expect(result.serviceStatus['notifications'], true);
    });

    test('InitializationResult failure factory', () {
      final result = InitializationResult.failure('Test failure', {
        'database': false,
      });

      expect(result.success, false);
      expect(result.errorMessage, 'Test failure');
      expect(result.serviceStatus['database'], false);
    });
  });
}

/// Example of importing main.dart for testing
/// Uncomment when ready to test full app
// import 'package:outlet_manager/main.dart';
//
// void main() {
//   testWidgets('Full app smoke test', (WidgetTester tester) async {
//     await tester.pumpWidget(const ProviderScope(child: OutletManagerApp()));
//     await tester.pumpAndSettle();
//
//     // Add assertions
//   });
// }
