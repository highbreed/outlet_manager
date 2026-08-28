import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../location/location.dart';
import 'location_tracking_providers.dart';
import '../../features/auth/auth.dart';
import '../../features/clock_in/clock_in.dart';
import '../../features/daily_route/daily_route.dart';
import '../../features/screens/screens.dart';
import '../../features/complaints/complaints.dart';
import '../../features/products/products.dart';
import '../../features/sales_order/sales_order.dart';
import '../../features/sales_performance/sales_performance.dart';
import '../../features/stock_take/stock_take.dart';
import '../../features/daily_sales/daily_sales.dart';
import '../../features/replenishment/replenishment.dart';
import '../../features/shelf_share/shelf_share.dart';
import '../../features/facings_count/facings_count.dart';
import '../../features/visit_schedules/visit_schedules.dart';

/// Lets [GoRouter] re-run its `redirect` callback whenever
/// [locationPermissionStatusProvider] emits, without rebuilding the whole
/// [GoRouter] instance (go_router removed its built-in
/// `GoRouterRefreshStream` helper in newer versions).
///
/// Without this, `redirect` only reads that provider via `ref.read`
/// (intentionally, to avoid recreating the router on every 5-second
/// permission poll). That means the very first check — which is always
/// `AsyncLoading` for one tick — leaves the user stranded on `/splash`:
/// nothing tells GoRouter to look again once the real status arrives.
/// Notifying on every emission fixes that stranding while still avoiding a
/// full router rebuild.
class _LocationPermissionRefreshListenable extends ChangeNotifier {
  _LocationPermissionRefreshListenable(Ref ref) {
    ref.listen(locationPermissionStatusProvider, (previous, next) {
      notifyListeners();
    });
    // Also refresh on auth changes. Auth state must NOT be `ref.watch`ed at
    // the provider level below: that would rebuild this Provider itself,
    // recreating a brand-new GoRouter (with `initialLocation: '/splash'`)
    // and wiping out the navigation stack — e.g. bouncing a user mid
    // forgot-password flow back to splash/home. Routing it through this
    // ChangeNotifier lets `redirect` re-run in place instead.
    ref.listen(authControllerProvider, (previous, next) {
      notifyListeners();
    });
  }
}

/// Global router provider for the application
/// Handles navigation and authentication-based redirects
final routerProvider = Provider<GoRouter>((ref) {
  final refreshListenable = _LocationPermissionRefreshListenable(ref);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: false,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      // Read auth/location permission inside redirect (don't watch at
      // provider level, or every emission recreates the GoRouter instance).
      final authState = ref.read(authControllerProvider);
      final locationPermissionStatus = ref.read(
        locationPermissionStatusProvider,
      );

      // Get current state values
      final isLoggedIn = authState is Authenticated;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/splash';
      final isLocationPermission =
          state.matchedLocation == '/location-permission';
      final isForgotPassword = state.matchedLocation.startsWith(
        '/forgot-password',
      );
      final isChangePassword = state.matchedLocation == '/change-password';

      developer.log(
        '🔄 Router Redirect - Location: ${state.matchedLocation}, '
        'Auth: ${authState.runtimeType}, '
        'Permission: $locationPermissionStatus',
        name: 'Router',
      );

      // Allow splash screen during initial/authenticating states
      if (authState is AuthInitial || authState is Authenticating) {
        developer.log(
          '📱 Auth initializing, staying on splash',
          name: 'Router',
        );
        return isSplash ? null : '/splash';
      }

      // Redirect to login if not authenticated (unless on login or forgot password)
      if (!isLoggedIn && !isLoggingIn && !isForgotPassword) {
        developer.log('🔐 Not logged in, redirecting to login', name: 'Router');
        return '/login';
      }

      // If on login or forgot password flow and not logged in, stay there
      if (!isLoggedIn && (isLoggingIn || isForgotPassword)) {
        developer.log(
          '🔑 On login/forgot password flow, staying',
          name: 'Router',
        );
        return null;
      }

      // If logged in, check location permission status
      if (isLoggedIn) {
        // Password-change gate takes priority over everything else below:
        // the backend 403s every endpoint (including location tracking)
        // for a gated user, so there's no point routing them anywhere else
        // first. No exceptions/allowlist to maintain per-screen — this one
        // check covers the whole app.
        // authState is already promoted to Authenticated here, since
        // isLoggedIn (= authState is Authenticated) gated this whole block.
        final mustChangePassword = authState.user.mustChangePassword;
        if (mustChangePassword) {
          developer.log(
            '🔒 Password change required, redirecting',
            name: 'Router',
          );
          return isChangePassword ? null : '/change-password';
        }

        // Extract the actual permission value from AsyncValue
        final permissionValue = locationPermissionStatus.whenOrNull(
          data: (status) => status,
        );

        developer.log(
          '🔍 Debug - AsyncValue: $locationPermissionStatus, Extracted: $permissionValue',
          name: 'Router',
        );

        // If permission status not yet checked (null or loading), stay on current route
        if (permissionValue == null) {
          developer.log(
            '⏳ Permission not checked yet, staying on ${isSplash || isLoggingIn ? "current" : "splash"}',
            name: 'Router',
          );
          // Stay on splash/login until permission is checked
          return (isSplash || isLoggingIn) ? null : '/splash';
        }

        // Permission checked - redirect based on status
        if (permissionValue != LocationPermissionStatus.granted) {
          developer.log(
            '📍 Permission not granted ($permissionValue), '
            'going to permission screen',
            name: 'Router',
          );
          // Not granted, go to permission screen
          return isLocationPermission ? null : '/location-permission';
        }

        // Permission granted - if on login/splash, go to home
        if (isSplash || isLoggingIn) {
          developer.log('✅ Permission granted, going to home', name: 'Router');
          return '/';
        }
      }

      developer.log('➡️ No redirect needed', name: 'Router');
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/forgot-password/verify-otp',
        builder: (context, state) {
          final email = state.extra as String;
          return VerifyOtpScreen(email: email);
        },
      ),
      GoRoute(
        path: '/forgot-password/reset',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ResetPasswordScreen(
            email: data['email'] as String,
            resetToken: data['resetToken'] as String,
          );
        },
      ),
      GoRoute(
        path: '/change-password',
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: '/location-permission',
        builder: (context, state) => const LocationPermissionScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/tasks', builder: (context, state) => const TasksScreen()),
      GoRoute(path: '/menu', builder: (context, state) => const MenuScreen()),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/help',
        builder: (context, state) => const HelpCenterScreen(),
      ),

      // ===== Daily Route Feature Routes =====
      GoRoute(
        path: '/daily-route',
        builder: (context, state) => const RouteActivationScreen(),
      ),
      GoRoute(
        path: '/daily-route/visits',
        builder: (context, state) => const VisitListScreen(),
      ),
      GoRoute(
        path: '/daily-route/visit/:visitLocalId',
        builder: (context, state) {
          final visitLocalId = state.pathParameters['visitLocalId']!;
          return VisitDetailScreen(visitLocalId: visitLocalId);
        },
      ),
      GoRoute(
        path: '/daily-route/visit/:visitLocalId/active',
        builder: (context, state) {
          final visitLocalId = state.pathParameters['visitLocalId']!;
          return ActiveVisitScreen(visitLocalId: visitLocalId);
        },
      ),
      GoRoute(
        path: '/daily-route/visit/:visitLocalId/override',
        builder: (context, state) {
          final visitLocalId = state.pathParameters['visitLocalId']!;
          return GeofenceOverrideRequestScreen(visitLocalId: visitLocalId);
        },
      ),
      GoRoute(
        path: '/daily-route/visit/:visitLocalId/complete',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return VisitCompleteScreen(
            outletName: extra?['outletName'] as String? ?? 'Outlet',
            durationLabel: extra?['duration'] as String? ?? '',
          );
        },
      ),
      GoRoute(
        path: '/daily-route/skipped',
        builder: (context, state) => const SkippedOutletsScreen(),
      ),
      GoRoute(
        path: '/daily-route/close',
        builder: (context, state) => const RouteCloseScreen(),
      ),
      GoRoute(
        path: '/daily-route/close/summary',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return RouteClosedSummaryScreen(
            completed: extra?['completed'] as int? ?? 0,
            skipped: extra?['skipped'] as int? ?? 0,
            missed: extra?['missed'] as int? ?? 0,
          );
        },
      ),

      // ===== Visit Schedules Feature Routes =====
      GoRoute(
        path: '/schedules',
        builder: (context, state) => const ScheduleListScreen(),
      ),

      // ===== Clock-In Feature Routes (Legacy) =====
      GoRoute(
        path: '/clock-in',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          // All parameters required from outlet selection
          return ClockInScreen(
            outletId: extra?['outletId'] as String? ?? '',
            outletName: extra?['outletName'] as String? ?? 'Unknown Outlet',
            outletCode: extra?['outletCode'] as String? ?? '',
            allocatedMinutes: extra?['allocatedMinutes'] as int? ?? 60,
            outletLatitude: extra?['outletLatitude'] as double? ?? 0.0,
            outletLongitude: extra?['outletLongitude'] as double? ?? 0.0,
            geofenceRadius: extra?['geofenceRadius'] as double? ?? 200.0,
            isDeviation: extra?['isDeviation'] as bool? ?? false,
            routeId: extra?['routeId'] as String?,
            visitLocalId: extra?['visitLocalId'] as String?,
          );
        },
      ),
      GoRoute(
        path: '/clock-in/active',
        builder: (context, state) => const ActiveSessionScreen(),
      ),
      GoRoute(
        path: '/clock-in/history',
        builder: (context, state) => const SessionHistoryScreen(),
      ),

      // ===== Stock Take Feature Routes =====
      GoRoute(
        path: '/stock-take',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return StockTakeHomeScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerCode: extra?['customerCode'] as String? ?? '',
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
            visitLocalId: extra?['visitLocalId'] as String?,
            visitServerId: extra?['visitServerId'] as int?,
          );
        },
      ),
      GoRoute(
        path: '/stock-take/start',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return StartSessionScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
            visitLocalId: extra?['visitLocalId'] as String?,
            visitServerId: extra?['visitServerId'] as int?,
          );
        },
      ),
      GoRoute(
        path: '/stock-take/session/:sessionLocalId',
        builder: (context, state) {
          final sessionLocalId = state.pathParameters['sessionLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return StockTakeSessionScreen(
            sessionLocalId: sessionLocalId,
            customerId: extra?['customerId'] as int?,
            visitLocalId: extra?['visitLocalId'] as String?,
            warehouseId: extra?['warehouseId'] as int?,
            warehouseName: extra?['warehouseName'] as String?,
            readOnly: extra?['readOnly'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/stock-take/session/:sessionLocalId/add-product',
        builder: (context, state) {
          final sessionLocalId = state.pathParameters['sessionLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return AddProductScreen(
            sessionLocalId: sessionLocalId,
            customerId: extra?['customerId'] as int? ?? 0,
          );
        },
      ),
      GoRoute(
        path: '/stock-take/session/:sessionLocalId/item/:itemLocalId',
        builder: (context, state) {
          final sessionLocalId = state.pathParameters['sessionLocalId']!;
          final itemLocalId = state.pathParameters['itemLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return SerialScanScreen(
            sessionLocalId: sessionLocalId,
            itemLocalId: itemLocalId,
            itemName: extra?['itemName'] as String?,
            brandName: extra?['brandName'] as String?,
            category: extra?['category'] as String?,
            modelNumber: extra?['modelNumber'] as String?,
            minStockLevel: extra?['minStockLevel'] as int?,
            maxStockLevel: extra?['maxStockLevel'] as int?,
            readOnly: extra?['readOnly'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/stock-take/history',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return StockTakeHistoryScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
          );
        },
      ),
      GoRoute(
        path: '/stock-take/proposed-order/:visitId',
        builder: (context, state) {
          final visitId = int.parse(state.pathParameters['visitId']!);
          final extra = state.extra as Map<String, dynamic>?;
          return ProposedOrderDetailScreen(
            visitId: visitId,
            quotationNumber: extra?['quotationNumber'] as String?,
          );
        },
      ),
      GoRoute(
        path: '/stock-take/order/:visitId',
        builder: (context, state) {
          final visitId = int.parse(state.pathParameters['visitId']!);
          return OrderGenerationScreen(visitId: visitId);
        },
      ),

      // ===== Daily Sales Feature Routes =====
      GoRoute(
        path: '/daily-sales',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return DailySalesHomeScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerCode: extra?['customerCode'] as String? ?? '',
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
            visitLocalId: extra?['visitLocalId'] as String?,
            visitServerId: extra?['visitServerId'] as int?,
          );
        },
      ),
      GoRoute(
        path: '/daily-sales/register',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return RegisterSaleScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
            customerCode: extra?['customerCode'] as String?,
          );
        },
      ),
      GoRoute(
        path: '/daily-sales/reorder',
        builder: (context, state) => const ReplenishmentListScreen(),
      ),
      GoRoute(
        path: '/daily-sales/:id',
        builder: (context, state) {
          final saleId = int.parse(state.pathParameters['id']!);
          return SaleDetailScreen(saleId: saleId);
        },
      ),
      GoRoute(
        path: '/daily-sales/:id/confirm',
        builder: (context, state) {
          final saleId = int.parse(state.pathParameters['id']!);
          return ConfirmSaleScreen(saleId: saleId);
        },
      ),

      // ===== Shelf Share Feature Routes =====
      GoRoute(
        path: '/shelf-share',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return ShelfShareHomeScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerCode: extra?['customerCode'] as String? ?? '',
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
            visitLocalId: extra?['visitLocalId'] as String?,
            visitServerId: extra?['visitServerId'] as int?,
          );
        },
      ),
      GoRoute(
        path: '/shelf-share/session/:sessionLocalId',
        builder: (context, state) {
          final sessionLocalId = state.pathParameters['sessionLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return ShelfShareSessionScreen(
            sessionLocalId: sessionLocalId,
            readOnly: extra?['readOnly'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/shelf-share/session/:sessionLocalId/select-groups',
        builder: (context, state) {
          final sessionLocalId = state.pathParameters['sessionLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return ItemGroupSelectionScreen(
            sessionLocalId: sessionLocalId,
            existingGroupIds:
                (extra?['existingGroupIds'] as List<dynamic>?)?.cast<int>() ??
                [],
          );
        },
      ),
      GoRoute(
        path: '/shelf-share/session/:sessionLocalId/brand-entry',
        builder: (context, state) {
          final sessionLocalId = state.pathParameters['sessionLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return BrandEntryScreen(
            sessionLocalId: sessionLocalId,
            itemGroupId: extra?['itemGroupId'] as int? ?? 0,
            itemGroupName: extra?['itemGroupName'] as String? ?? 'Item Group',
            readOnly: extra?['readOnly'] as bool? ?? false,
          );
        },
      ),

      // ===== Horizontal Facings Count Feature Routes =====
      GoRoute(
        path: '/facings',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return FacingsHomeScreen(
            customerId: extra?['customerId'] as int? ?? 0,
            customerCode: extra?['customerCode'] as String? ?? '',
            customerName:
                extra?['customerName'] as String? ?? 'Unknown Customer',
            visitLocalId: extra?['visitLocalId'] as String?,
            visitServerId: extra?['visitServerId'] as int?,
          );
        },
      ),
      GoRoute(
        path: '/facings/count/:countLocalId',
        builder: (context, state) {
          final countLocalId = state.pathParameters['countLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return FacingsCountScreen(
            countLocalId: countLocalId,
            readOnly: extra?['readOnly'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/facings/count/:countLocalId/select-groups',
        builder: (context, state) {
          final countLocalId = state.pathParameters['countLocalId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return FacingsItemGroupSelectionScreen(
            countLocalId: countLocalId,
            existingGroupIds:
                (extra?['existingGroupIds'] as List<dynamic>?)?.cast<int>() ??
                [],
          );
        },
      ),

      // ===== Sales Order Feature Routes =====
      GoRoute(
        path: '/sales-orders',
        builder: (context, state) => const SalesOrderHomeScreen(),
      ),
      GoRoute(
        path: '/sales-orders/customers',
        builder: (context, state) {
          final kindParam = state.uri.queryParameters['kind'] ?? 'order';
          final kind = kindParam == 'quotation'
              ? SalesDocumentKind.quotation
              : SalesDocumentKind.order;
          return SelectCustomerScreen(kind: kind);
        },
      ),
      GoRoute(
        path: '/sales-orders/create',
        builder: (context, state) {
          final kindParam = state.uri.queryParameters['kind'] ?? 'order';
          final customerId =
              int.tryParse(state.uri.queryParameters['customerId'] ?? '') ?? 0;
          final kind = kindParam == 'quotation'
              ? SalesDocumentKind.quotation
              : SalesDocumentKind.order;
          final initialItems =
              (state.extra as List<OrderLineItem>?) ?? const [];
          return CreateOrderScreen(
            kind: kind,
            customerId: customerId,
            initialItems: initialItems,
          );
        },
      ),
      GoRoute(
        path: '/sales-orders/order/:localId',
        builder: (context, state) {
          final localId = state.pathParameters['localId']!;
          return OrderDetailScreen(localId: localId);
        },
      ),
      GoRoute(
        path: '/sales-orders/quotation/:localId',
        builder: (context, state) {
          final localId = state.pathParameters['localId']!;
          return QuotationDetailScreen(localId: localId);
        },
      ),
      GoRoute(
        path: '/sales-orders/quotation/:localId/convert',
        builder: (context, state) {
          final localId = state.pathParameters['localId']!;
          return ConvertQuotationScreen(localId: localId);
        },
      ),

      // ===== Products Feature Routes =====
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: '/products/detail/:code',
        builder: (context, state) {
          final code = state.pathParameters['code']!;
          final product = state.extra;
          // Normal case: `extra` survived the push (in-session navigation).
          if (product is Product && product.code == code) {
            return ProductDetailScreen(product: product);
          }
          // `extra` was lost — e.g. go_router had to restore navigation
          // state after the OS reclaimed the app in the background (extra
          // isn't a JSON primitive so it can't survive that restore).
          // Re-resolve the product by its code instead of silently
          // dropping the user back to the catalogue list.
          return ProductDetailResolverScreen(code: code);
        },
      ),

      // ===== Sales Performance Feature Routes =====
      GoRoute(
        path: '/sales-performance',
        builder: (context, state) => const SalesPerformanceScreen(),
      ),

      // ===== After Sales Feature Routes =====
      GoRoute(
        path: '/after-sales',
        builder: (context, state) => const ComplaintsHomeScreen(),
      ),
      GoRoute(
        path: '/after-sales/register',
        builder: (context, state) => const RegisterComplaintScreen(),
      ),
      GoRoute(
        path: '/after-sales/:complaintNo',
        builder: (context, state) {
          final complaintNo = state.pathParameters['complaintNo']!;
          return ComplaintDetailScreen(complaintNo: complaintNo);
        },
      ),

      // Coming soon placeholder route
      GoRoute(
        path: '/coming-soon',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return ComingSoonScreen(
            featureName: extra?['featureName'] as String? ?? 'Feature',
            featureIcon:
                extra?['featureIcon'] as IconData? ?? Icons.construction,
          );
        },
      ),
      // Placeholder routes for bottom nav items
      GoRoute(
        path: '/outlets',
        redirect: (context, state) =>
            '/daily-route', // Unified with daily route
      ),
      GoRoute(
        path: '/map',
        builder: (context, state) =>
            const HomeScreen(), // TODO: Create MapScreen
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) =>
            const HomeScreen(), // TODO: Create ProfileScreen
      ),
    ],
  );
});
