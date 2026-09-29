// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sale_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches a single sale by id, for the sale detail screen.

@ProviderFor(dailySaleDetail)
const dailySaleDetailProvider = DailySaleDetailFamily._();

/// Fetches a single sale by id, for the sale detail screen.

final class DailySaleDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<DailySale>,
          DailySale,
          FutureOr<DailySale>
        >
    with $FutureModifier<DailySale>, $FutureProvider<DailySale> {
  /// Fetches a single sale by id, for the sale detail screen.
  const DailySaleDetailProvider._({
    required DailySaleDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'dailySaleDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dailySaleDetailHash();

  @override
  String toString() {
    return r'dailySaleDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DailySale> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DailySale> create(Ref ref) {
    final argument = this.argument as int;
    return dailySaleDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DailySaleDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dailySaleDetailHash() => r'70cacf5f78a80e81c85ddf71e2032f5894060f26';

/// Fetches a single sale by id, for the sale detail screen.

final class DailySaleDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DailySale>, int> {
  const DailySaleDetailFamily._()
    : super(
        retry: null,
        name: r'dailySaleDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Fetches a single sale by id, for the sale detail screen.

  DailySaleDetailProvider call(int saleId) =>
      DailySaleDetailProvider._(argument: saleId, from: this);

  @override
  String toString() => r'dailySaleDetailProvider';
}
