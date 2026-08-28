// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_schedule_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$visitScheduleLocalDataSourceHash() =>
    r'96afc9ab0edb6d0cee1fd788ec5243fedffc849e';

/// See also [visitScheduleLocalDataSource].
@ProviderFor(visitScheduleLocalDataSource)
final visitScheduleLocalDataSourceProvider =
    AutoDisposeProvider<VisitScheduleLocalDataSource>.internal(
      visitScheduleLocalDataSource,
      name: r'visitScheduleLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$visitScheduleLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisitScheduleLocalDataSourceRef =
    AutoDisposeProviderRef<VisitScheduleLocalDataSource>;
String _$visitScheduleRemoteDataSourceHash() =>
    r'cff6f0b2cbd12933767efdebfec7883240ab40f6';

/// See also [visitScheduleRemoteDataSource].
@ProviderFor(visitScheduleRemoteDataSource)
final visitScheduleRemoteDataSourceProvider =
    AutoDisposeProvider<VisitScheduleRemoteDataSource>.internal(
      visitScheduleRemoteDataSource,
      name: r'visitScheduleRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$visitScheduleRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisitScheduleRemoteDataSourceRef =
    AutoDisposeProviderRef<VisitScheduleRemoteDataSource>;
String _$visitScheduleRepositoryHash() =>
    r'07a1d12d8afe06d586929929dfea0de1d0d674c7';

/// See also [visitScheduleRepository].
@ProviderFor(visitScheduleRepository)
final visitScheduleRepositoryProvider =
    AutoDisposeProvider<VisitScheduleRepository>.internal(
      visitScheduleRepository,
      name: r'visitScheduleRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$visitScheduleRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisitScheduleRepositoryRef =
    AutoDisposeProviderRef<VisitScheduleRepository>;
String _$getAllSchedulesUseCaseHash() =>
    r'5eceabba38085edc9f1a27feb45e55fc7dd2f5b1';

/// See also [getAllSchedulesUseCase].
@ProviderFor(getAllSchedulesUseCase)
final getAllSchedulesUseCaseProvider =
    AutoDisposeProvider<GetAllSchedulesUseCase>.internal(
      getAllSchedulesUseCase,
      name: r'getAllSchedulesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getAllSchedulesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllSchedulesUseCaseRef =
    AutoDisposeProviderRef<GetAllSchedulesUseCase>;
String _$getSchedulesForDayUseCaseHash() =>
    r'c2474696b967ced6f8e197a0c606f445b33cd4ca';

/// See also [getSchedulesForDayUseCase].
@ProviderFor(getSchedulesForDayUseCase)
final getSchedulesForDayUseCaseProvider =
    AutoDisposeProvider<GetSchedulesForDayUseCase>.internal(
      getSchedulesForDayUseCase,
      name: r'getSchedulesForDayUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getSchedulesForDayUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSchedulesForDayUseCaseRef =
    AutoDisposeProviderRef<GetSchedulesForDayUseCase>;
String _$syncSchedulesUseCaseHash() =>
    r'e734caa0a663450d24a2668a03e9f411d7184491';

/// See also [syncSchedulesUseCase].
@ProviderFor(syncSchedulesUseCase)
final syncSchedulesUseCaseProvider =
    AutoDisposeProvider<SyncSchedulesUseCase>.internal(
      syncSchedulesUseCase,
      name: r'syncSchedulesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$syncSchedulesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SyncSchedulesUseCaseRef = AutoDisposeProviderRef<SyncSchedulesUseCase>;
String _$schedulesForDayHash() => r'89cab4489287a22262f0b60a6a285d2df80d301c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provides schedules for a specific day
///
/// Copied from [schedulesForDay].
@ProviderFor(schedulesForDay)
const schedulesForDayProvider = SchedulesForDayFamily();

/// Provides schedules for a specific day
///
/// Copied from [schedulesForDay].
class SchedulesForDayFamily extends Family<AsyncValue<List<VisitSchedule>>> {
  /// Provides schedules for a specific day
  ///
  /// Copied from [schedulesForDay].
  const SchedulesForDayFamily();

  /// Provides schedules for a specific day
  ///
  /// Copied from [schedulesForDay].
  SchedulesForDayProvider call(int dayOfWeek) {
    return SchedulesForDayProvider(dayOfWeek);
  }

  @override
  SchedulesForDayProvider getProviderOverride(
    covariant SchedulesForDayProvider provider,
  ) {
    return call(provider.dayOfWeek);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'schedulesForDayProvider';
}

/// Provides schedules for a specific day
///
/// Copied from [schedulesForDay].
class SchedulesForDayProvider
    extends AutoDisposeFutureProvider<List<VisitSchedule>> {
  /// Provides schedules for a specific day
  ///
  /// Copied from [schedulesForDay].
  SchedulesForDayProvider(int dayOfWeek)
    : this._internal(
        (ref) => schedulesForDay(ref as SchedulesForDayRef, dayOfWeek),
        from: schedulesForDayProvider,
        name: r'schedulesForDayProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$schedulesForDayHash,
        dependencies: SchedulesForDayFamily._dependencies,
        allTransitiveDependencies:
            SchedulesForDayFamily._allTransitiveDependencies,
        dayOfWeek: dayOfWeek,
      );

  SchedulesForDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dayOfWeek,
  }) : super.internal();

  final int dayOfWeek;

  @override
  Override overrideWith(
    FutureOr<List<VisitSchedule>> Function(SchedulesForDayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SchedulesForDayProvider._internal(
        (ref) => create(ref as SchedulesForDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dayOfWeek: dayOfWeek,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VisitSchedule>> createElement() {
    return _SchedulesForDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SchedulesForDayProvider && other.dayOfWeek == dayOfWeek;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dayOfWeek.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SchedulesForDayRef on AutoDisposeFutureProviderRef<List<VisitSchedule>> {
  /// The parameter `dayOfWeek` of this provider.
  int get dayOfWeek;
}

class _SchedulesForDayProviderElement
    extends AutoDisposeFutureProviderElement<List<VisitSchedule>>
    with SchedulesForDayRef {
  _SchedulesForDayProviderElement(super.provider);

  @override
  int get dayOfWeek => (origin as SchedulesForDayProvider).dayOfWeek;
}

String _$todaysSchedulesHash() => r'82517dd9ca5ca9394506ab0d9cbbe88046961d15';

/// Provides today's schedules
///
/// Copied from [todaysSchedules].
@ProviderFor(todaysSchedules)
final todaysSchedulesProvider =
    AutoDisposeFutureProvider<List<VisitSchedule>>.internal(
      todaysSchedules,
      name: r'todaysSchedulesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todaysSchedulesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodaysSchedulesRef = AutoDisposeFutureProviderRef<List<VisitSchedule>>;
String _$schedulesGroupedByDayHash() =>
    r'3d311903003c65db854cc5216b7a6253036697a9';

/// Provides schedules grouped by day of week
///
/// Copied from [schedulesGroupedByDay].
@ProviderFor(schedulesGroupedByDay)
final schedulesGroupedByDayProvider =
    AutoDisposeProvider<Map<int, List<VisitSchedule>>>.internal(
      schedulesGroupedByDay,
      name: r'schedulesGroupedByDayProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$schedulesGroupedByDayHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SchedulesGroupedByDayRef =
    AutoDisposeProviderRef<Map<int, List<VisitSchedule>>>;
String _$scheduleCountsByDayHash() =>
    r'6ea062986f107991de8963b48b13a26ebc6be384';

/// Provides schedule counts per day
///
/// Copied from [scheduleCountsByDay].
@ProviderFor(scheduleCountsByDay)
final scheduleCountsByDayProvider = AutoDisposeProvider<Map<int, int>>.internal(
  scheduleCountsByDay,
  name: r'scheduleCountsByDayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleCountsByDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ScheduleCountsByDayRef = AutoDisposeProviderRef<Map<int, int>>;
String _$weeklyOutletCountHash() => r'5a3fe461392cef9b0c3fd1e40c7b3a8857a6e361';

/// Provides total outlet count for the week
///
/// Copied from [weeklyOutletCount].
@ProviderFor(weeklyOutletCount)
final weeklyOutletCountProvider = AutoDisposeProvider<int>.internal(
  weeklyOutletCount,
  name: r'weeklyOutletCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weeklyOutletCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeeklyOutletCountRef = AutoDisposeProviderRef<int>;
String _$watchAllSchedulesHash() => r'2846bc6c5a948dc37c427d72e12aeb228f346484';

/// Stream provider for watching schedules
///
/// Copied from [watchAllSchedules].
@ProviderFor(watchAllSchedules)
final watchAllSchedulesProvider =
    AutoDisposeStreamProvider<List<VisitSchedule>>.internal(
      watchAllSchedules,
      name: r'watchAllSchedulesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchAllSchedulesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllSchedulesRef =
    AutoDisposeStreamProviderRef<List<VisitSchedule>>;
String _$watchSchedulesForDayHash() =>
    r'469e1c83234bb8374830fe0a38f55e0c4afbb10e';

/// Stream provider for watching schedules for a specific day
///
/// Copied from [watchSchedulesForDay].
@ProviderFor(watchSchedulesForDay)
const watchSchedulesForDayProvider = WatchSchedulesForDayFamily();

/// Stream provider for watching schedules for a specific day
///
/// Copied from [watchSchedulesForDay].
class WatchSchedulesForDayFamily
    extends Family<AsyncValue<List<VisitSchedule>>> {
  /// Stream provider for watching schedules for a specific day
  ///
  /// Copied from [watchSchedulesForDay].
  const WatchSchedulesForDayFamily();

  /// Stream provider for watching schedules for a specific day
  ///
  /// Copied from [watchSchedulesForDay].
  WatchSchedulesForDayProvider call(int dayOfWeek) {
    return WatchSchedulesForDayProvider(dayOfWeek);
  }

  @override
  WatchSchedulesForDayProvider getProviderOverride(
    covariant WatchSchedulesForDayProvider provider,
  ) {
    return call(provider.dayOfWeek);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchSchedulesForDayProvider';
}

/// Stream provider for watching schedules for a specific day
///
/// Copied from [watchSchedulesForDay].
class WatchSchedulesForDayProvider
    extends AutoDisposeStreamProvider<List<VisitSchedule>> {
  /// Stream provider for watching schedules for a specific day
  ///
  /// Copied from [watchSchedulesForDay].
  WatchSchedulesForDayProvider(int dayOfWeek)
    : this._internal(
        (ref) =>
            watchSchedulesForDay(ref as WatchSchedulesForDayRef, dayOfWeek),
        from: watchSchedulesForDayProvider,
        name: r'watchSchedulesForDayProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$watchSchedulesForDayHash,
        dependencies: WatchSchedulesForDayFamily._dependencies,
        allTransitiveDependencies:
            WatchSchedulesForDayFamily._allTransitiveDependencies,
        dayOfWeek: dayOfWeek,
      );

  WatchSchedulesForDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dayOfWeek,
  }) : super.internal();

  final int dayOfWeek;

  @override
  Override overrideWith(
    Stream<List<VisitSchedule>> Function(WatchSchedulesForDayRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSchedulesForDayProvider._internal(
        (ref) => create(ref as WatchSchedulesForDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dayOfWeek: dayOfWeek,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<VisitSchedule>> createElement() {
    return _WatchSchedulesForDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSchedulesForDayProvider &&
        other.dayOfWeek == dayOfWeek;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dayOfWeek.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSchedulesForDayRef
    on AutoDisposeStreamProviderRef<List<VisitSchedule>> {
  /// The parameter `dayOfWeek` of this provider.
  int get dayOfWeek;
}

class _WatchSchedulesForDayProviderElement
    extends AutoDisposeStreamProviderElement<List<VisitSchedule>>
    with WatchSchedulesForDayRef {
  _WatchSchedulesForDayProviderElement(super.provider);

  @override
  int get dayOfWeek => (origin as WatchSchedulesForDayProvider).dayOfWeek;
}

String _$allSchedulesNotifierHash() =>
    r'6994bec9a2f67718208a5532a3ffbb618d5ae256';

/// Provides all visit schedules, grouped by day of week
///
/// Copied from [AllSchedulesNotifier].
@ProviderFor(AllSchedulesNotifier)
final allSchedulesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AllSchedulesNotifier,
      List<VisitSchedule>
    >.internal(
      AllSchedulesNotifier.new,
      name: r'allSchedulesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allSchedulesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AllSchedulesNotifier = AutoDisposeAsyncNotifier<List<VisitSchedule>>;
String _$scheduleSyncControllerHash() =>
    r'5159a8d012f951d4637f0424b2936d4e42491db7';

/// Manages schedule sync state
///
/// Copied from [ScheduleSyncController].
@ProviderFor(ScheduleSyncController)
final scheduleSyncControllerProvider =
    AutoDisposeNotifierProvider<
      ScheduleSyncController,
      AsyncValue<DateTime?>
    >.internal(
      ScheduleSyncController.new,
      name: r'scheduleSyncControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$scheduleSyncControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ScheduleSyncController = AutoDisposeNotifier<AsyncValue<DateTime?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
