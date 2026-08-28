/// Visit Schedules Feature
///
/// Manages viewing of agent's assigned visit schedules:
/// - Weekly schedule overview grouped by day
/// - Daily outlet list with scheduled times
/// - Sync schedules from backend
///
/// This is a read-only feature; schedules are created by admins via web interface.
library;

export 'domain/domain.dart';
export 'data/data.dart';
export 'providers/visit_schedule_providers.dart';
export 'presentation/presentation.dart';
