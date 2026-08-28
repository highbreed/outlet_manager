/// Data Layer - Daily Route Feature
///
/// Contains Isar models, data sources, and repository implementations.
library;

// Models (Isar collections)
export 'models/daily_route_model.dart'
    show DailyRouteModel, DailyRouteStatusModel;
export 'models/outlet_visit_model.dart'
    show OutletVisitModel, VisitStatusModel, VisitTypeModel;
export 'models/geofence_override_model.dart'
    show GeofenceOverrideModel, GeofenceOverrideStatusModel;

// Note: SyncStateModel is defined in each model file.
// Import from daily_route_model.dart to use.

// Data Sources
export 'datasources/daily_route_local_datasource.dart'
    hide
        OutletVisitModel,
        VisitStatusModel,
        GeofenceOverrideModel,
        GeofenceOverrideStatusModel;
export 'datasources/daily_route_remote_datasource.dart';

// Repository Implementations
export 'repositories/daily_route_repository_impl.dart';
export 'repositories/outlet_visit_repository_impl.dart';
