import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/datasources/daily_route_remote_datasource.dart';
import '../../domain/entities/daily_route.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

/// Screen for activating the daily route.
///
/// Shows when no route exists for today or route is pending.
/// If route is already activated/in_progress, redirects to visit list.
class RouteActivationScreen extends ConsumerWidget {
  const RouteActivationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaysRouteAsync = ref.watch(todaysRouteProvider);
    final activationState = ref.watch(routeActivationNotifierProvider);

    return todaysRouteAsync.when(
      loading: () => const AppScaffold(
        title: 'Daily Route',
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => _buildActivationUI(context, ref, activationState),
      data: (routeWithVisits) {
        // If route exists and is active/in_progress, redirect to visits
        if (routeWithVisits != null) {
          final status = routeWithVisits.route.status;
          if (status == DailyRouteStatus.activated ||
              status == DailyRouteStatus.inProgress) {
            // Use post-frame callback to avoid build-time navigation
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                context.go('/daily-route/visits');
              }
            });
            return const AppScaffold(
              title: 'Daily Route',
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }

        // Show activation UI for pending/no route
        return _buildActivationUI(context, ref, activationState);
      },
    );
  }

  Widget _buildActivationUI(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<DailyRoute?> activationState,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final mutedColor = textColor.withValues(alpha: 0.6);

    // Check for pending routes from previous dates
    final pendingRoutesAsync = ref.watch(pendingRoutesToCloseProvider);

    // Full scheduled-outlets list for today — same data Home previews (and
    // caps at 3) via dayStatusPollProvider; this screen is where "+N more"
    // sends the agent to see the rest.
    final scheduledStops =
        ref.watch(dayStatusPollProvider).valueOrNull?.scheduledStops ??
        const [];

    return AppScaffold(
      title: 'Start Your Day',
      showBottomNav: true,
      currentNavIndex: 1,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 48,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Illustration / Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: isDark
                          ? kSecondaryColor.withValues(alpha: 0.2)
                          : kSecondaryLightColor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(
                      Icons.route,
                      size: 64,
                      color: isDark ? kSecondaryLightColor : kSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Ready to Start?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    'Activate your route to see today\'s scheduled visits and start your workday.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: mutedColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatDate(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                      color: mutedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Full scheduled-outlets list (no cap, unlike Home's
                  // preview) — this is where Home's "+N more" leads to.
                  if (scheduledStops.isNotEmpty) ...[
                    ScheduledOutletsCard(stops: scheduledStops),
                    const SizedBox(height: 24),
                  ],

                  // Pending routes warning (proactive check)
                  pendingRoutesAsync.when(
                    data: (pendingRoutes) {
                      if (pendingRoutes.isNotEmpty) {
                        return Column(
                          children: [
                            _buildPendingRoutesWarning(
                              context,
                              ref,
                              pendingRoutes,
                            ),
                            const SizedBox(height: 24),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, _) => const SizedBox.shrink(),
                  ),

                  // Error message (from activation attempt)
                  if (activationState.hasError) ...[
                    _buildErrorUI(context, activationState.error),
                    const SizedBox(height: 24),
                  ],

                  // Activate button
                  PrimaryButton(
                    label: 'Activate Route',
                    trailingIcon: Icons.arrow_forward,
                    isLoading: activationState.isLoading,
                    onPressed: () => _activateRoute(context, ref),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPendingRoutesWarning(
    BuildContext context,
    WidgetRef ref,
    List<PendingRouteResponse> pendingRoutes,
  ) {
    final route = pendingRoutes.first; // Show the first pending route

    return AppCard(
      borderColor: kWarningColor.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: kWarningText,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Unclosed Route Found',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kWarningText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'You have an unclosed route from ${_formatDate(DateTime.parse(route.routeDate))}',
                      style: const TextStyle(fontSize: 14, color: kTextMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SecondaryButton(
            label: 'Close Previous Route',
            leadingIcon: Icons.close_fullscreen,
            onPressed: () => _navigateToCloseRoute(context, ref),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorUI(BuildContext context, Object? error) {
    // Check if error is RouteBlockedFailure
    if (error is RouteBlockedFailure) {
      return AppCard(
        borderColor: kWarningColor.withValues(alpha: 0.4),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: kWarningText,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Previous Route Not Closed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'You must close your route from ${_formatDate(error.blockedRouteDate)} before starting a new one.',
                        style: const TextStyle(fontSize: 14, color: kTextMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SecondaryButton(
              label: 'Close Previous Route',
              leadingIcon: Icons.close_fullscreen,
              onPressed: () => context.push('/daily-route/close'),
            ),
          ],
        ),
      );
    }

    // Generic error
    return AppCard(
      borderColor: kRedColor.withValues(alpha: 0.4),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kRedColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _getErrorMessage(error),
              style: const TextStyle(color: kRedColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Close Route screen lists the outlets that weren't visited and owns the
  // skip-reason + close flow itself — this is just a plain navigation.
  void _navigateToCloseRoute(BuildContext context, WidgetRef ref) {
    context.push('/daily-route/close');
  }

  Future<void> _activateRoute(BuildContext context, WidgetRef ref) async {
    await ref.read(routeActivationNotifierProvider.notifier).activate();

    // Check result after activation
    final state = ref.read(routeActivationNotifierProvider);
    if (state.hasValue && state.value != null && context.mounted) {
      // Navigate to visit list
      context.go('/daily-route/visits');
    }
  }

  String _formatDate(DateTime date) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final dayName = days[date.weekday - 1];
    final monthName = months[date.month - 1];
    return '$dayName, $monthName ${date.day}, ${date.year}';
  }

  String _getErrorMessage(Object? error) {
    if (error == null) return 'An unknown error occurred';
    return error.toString();
  }
}
