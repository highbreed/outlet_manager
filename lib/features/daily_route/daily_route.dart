/// Daily Route Feature
///
/// Manages the daily route lifecycle for sales agents:
/// - Route activation (generate visits from schedule)
/// - Visit clock-in/out with geofence validation
/// - Route closing and summary
/// - Geofence override requests
///
/// This is the core feature for agent field operations.
library;

export 'domain/domain.dart';
export 'data/data.dart';
export 'providers/daily_route_providers.dart';
export 'presentation/presentation.dart';
