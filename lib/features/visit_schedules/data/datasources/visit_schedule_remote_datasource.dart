import 'package:dio/dio.dart';

/// Remote data source for visit schedule operations.
///
/// Connects to the backend API at `/api/v1/visits/schedules`.
abstract class VisitScheduleRemoteDataSource {
  /// Fetch all schedules for the current agent
  /// GET /schedules
  Future<List<ScheduleResponse>> getSchedules();

  /// Fetch week schedule for current authenticated agent grouped by day
  /// GET /schedules/me/week
  Future<WeekScheduleResponse> getMyWeekSchedule({DateTime? effectiveDate});
}

/// Implementation of [VisitScheduleRemoteDataSource] using Dio.
class VisitScheduleRemoteDataSourceImpl
    implements VisitScheduleRemoteDataSource {
  final Dio _dio;

  // Note: apiBaseUrl already includes /api/v1
  static const String _basePath = '/visits/schedules';

  VisitScheduleRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<ScheduleResponse>> getSchedules() async {
    final response = await _dio.get(_basePath);
    final data = response.data;

    if (data['success'] == true && data['data'] is List) {
      return (data['data'] as List)
          .map(
            (item) => ScheduleResponse.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }

    return [];
  }

  @override
  Future<WeekScheduleResponse> getMyWeekSchedule({
    DateTime? effectiveDate,
  }) async {
    final queryParams = <String, dynamic>{};
    if (effectiveDate != null) {
      queryParams['effective_date'] = effectiveDate.toIso8601String().split(
        'T',
      )[0];
    }

    final response = await _dio.get(
      '$_basePath/me/week',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    final data = response.data;

    if (data['success'] == true && data['data'] is Map) {
      return WeekScheduleResponse.fromJson(
        data['data'] as Map<String, dynamic>,
      );
    }

    // Return empty week schedule
    return WeekScheduleResponse.empty();
  }
}

/// Response model for a single schedule item from API
class ScheduleResponse {
  final int id;
  final int salesAgentId;
  final int customerId;
  final String cardCode;
  final int dayOfWeek;
  final String? scheduledClockIn;
  final String? scheduledClockOut;
  final int visitPriority;
  final int visitOrder;
  final int visitDurationMins;
  final bool isActive;
  final DateTime effectiveFrom;
  final DateTime? effectiveTo;
  final String? agentName;
  final String? agentCode;
  final String customerName;
  final double? latitude;
  final double? longitude;
  final String? address;

  ScheduleResponse({
    required this.id,
    required this.salesAgentId,
    required this.customerId,
    required this.cardCode,
    required this.dayOfWeek,
    this.scheduledClockIn,
    this.scheduledClockOut,
    required this.visitPriority,
    required this.visitOrder,
    required this.visitDurationMins,
    required this.isActive,
    required this.effectiveFrom,
    this.effectiveTo,
    this.agentName,
    this.agentCode,
    required this.customerName,
    this.latitude,
    this.longitude,
    this.address,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleResponse(
      id: json['id'] as int,
      salesAgentId: json['sales_agent_id'] as int,
      customerId: json['customer_id'] as int,
      cardCode: json['card_code'] as String,
      dayOfWeek: json['day_of_week'] as int,
      scheduledClockIn: json['scheduled_clock_in'] as String?,
      scheduledClockOut: json['scheduled_clock_out'] as String?,
      visitPriority: json['visit_priority'] as int? ?? 2,
      visitOrder: json['visit_order'] as int? ?? 1,
      visitDurationMins: json['visit_duration_mins'] as int? ?? 60,
      isActive: json['is_active'] as bool? ?? true,
      effectiveFrom: DateTime.parse(json['effective_from'] as String),
      effectiveTo: json['effective_to'] != null
          ? DateTime.parse(json['effective_to'] as String)
          : null,
      agentName: json['agent_name'] as String?,
      agentCode: json['agent_code'] as String?,
      customerName: json['customer_name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
    );
  }
}

/// Response model for week schedule grouped by day
class WeekScheduleResponse {
  final List<DayScheduleItem> monday;
  final List<DayScheduleItem> tuesday;
  final List<DayScheduleItem> wednesday;
  final List<DayScheduleItem> thursday;
  final List<DayScheduleItem> friday;
  final List<DayScheduleItem> saturday;
  final List<DayScheduleItem> sunday;

  WeekScheduleResponse({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory WeekScheduleResponse.empty() {
    return WeekScheduleResponse(
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
      saturday: [],
      sunday: [],
    );
  }

  factory WeekScheduleResponse.fromJson(Map<String, dynamic> json) {
    return WeekScheduleResponse(
      monday: _parseDay(json['monday']),
      tuesday: _parseDay(json['tuesday']),
      wednesday: _parseDay(json['wednesday']),
      thursday: _parseDay(json['thursday']),
      friday: _parseDay(json['friday']),
      saturday: _parseDay(json['saturday']),
      sunday: _parseDay(json['sunday']),
    );
  }

  static List<DayScheduleItem> _parseDay(dynamic data) {
    if (data is! List) return [];
    return data
        .map((item) => DayScheduleItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get schedules for a specific day (0=Monday, 6=Sunday)
  List<DayScheduleItem> forDay(int dayOfWeek) {
    switch (dayOfWeek) {
      case 0:
        return monday;
      case 1:
        return tuesday;
      case 2:
        return wednesday;
      case 3:
        return thursday;
      case 4:
        return friday;
      case 5:
        return saturday;
      case 6:
        return sunday;
      default:
        return [];
    }
  }

  /// Get all schedules as a flat list with day info
  List<({int dayOfWeek, DayScheduleItem item})> get allSchedules {
    final result = <({int dayOfWeek, DayScheduleItem item})>[];
    for (var i = 0; i < 7; i++) {
      for (final item in forDay(i)) {
        result.add((dayOfWeek: i, item: item));
      }
    }
    return result;
  }
}

/// Individual schedule item within a day
class DayScheduleItem {
  final int id;
  final int customerId;
  final String cardCode;
  final String? scheduledClockIn;
  final String? scheduledClockOut;
  final int visitOrder;
  final int visitPriority;
  final int visitDurationMins;
  final String customerName;
  final double? latitude;
  final double? longitude;
  final String? address;
  final bool isActive;
  final DateTime? effectiveFrom;
  final DateTime? effectiveTo;

  DayScheduleItem({
    required this.id,
    required this.customerId,
    required this.cardCode,
    this.scheduledClockIn,
    this.scheduledClockOut,
    required this.visitOrder,
    required this.visitPriority,
    required this.visitDurationMins,
    required this.customerName,
    this.latitude,
    this.longitude,
    this.address,
    this.isActive = true,
    this.effectiveFrom,
    this.effectiveTo,
  });

  factory DayScheduleItem.fromJson(Map<String, dynamic> json) {
    return DayScheduleItem(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      cardCode: json['card_code'] as String,
      scheduledClockIn: json['scheduled_clock_in'] as String?,
      scheduledClockOut: json['scheduled_clock_out'] as String?,
      visitOrder: json['visit_order'] as int? ?? 1,
      visitPriority: json['visit_priority'] as int? ?? 2,
      visitDurationMins: json['visit_duration_mins'] as int? ?? 60,
      customerName: json['customer_name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      effectiveFrom: json['effective_from'] != null
          ? DateTime.parse(json['effective_from'] as String)
          : null,
      effectiveTo: json['effective_to'] != null
          ? DateTime.parse(json['effective_to'] as String)
          : null,
    );
  }
}
