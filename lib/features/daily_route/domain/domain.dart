/// Domain Layer - Daily Route Feature
///
/// Contains business logic entities, repository interfaces, and use cases.
/// This layer is independent of external frameworks and data sources.
library;

// Entities
export 'entities/daily_route.dart';
export 'entities/outlet_visit.dart';
export 'entities/geofence_override_request.dart';
export 'entities/skip_reason.dart';
export 'entities/day_status.dart';
export 'entities/lunch_break.dart';

// Repositories
export 'repositories/daily_route_repository.dart';
export 'repositories/outlet_visit_repository.dart';

// Use Cases
export 'usecases/usecases.dart';
