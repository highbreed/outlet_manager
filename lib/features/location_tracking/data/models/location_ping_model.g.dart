// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_ping_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationPingModelCollection on Isar {
  IsarCollection<LocationPingModel> get locationPingModels => this.collection();
}

const LocationPingModelSchema = CollectionSchema(
  name: r'LocationPingModel',
  id: -2599765933396936792,
  properties: {
    r'accuracyMeters': PropertySchema(
      id: 0,
      name: r'accuracyMeters',
      type: IsarType.double,
    ),
    r'altitudeMeters': PropertySchema(
      id: 1,
      name: r'altitudeMeters',
      type: IsarType.double,
    ),
    r'batteryLevel': PropertySchema(
      id: 2,
      name: r'batteryLevel',
      type: IsarType.long,
    ),
    r'headingDegrees': PropertySchema(
      id: 3,
      name: r'headingDegrees',
      type: IsarType.double,
    ),
    r'isCharging': PropertySchema(
      id: 4,
      name: r'isCharging',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 5,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'localId': PropertySchema(id: 6, name: r'localId', type: IsarType.string),
    r'longitude': PropertySchema(
      id: 7,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'networkType': PropertySchema(
      id: 8,
      name: r'networkType',
      type: IsarType.string,
    ),
    r'nextPingSeconds': PropertySchema(
      id: 9,
      name: r'nextPingSeconds',
      type: IsarType.long,
    ),
    r'pingSource': PropertySchema(
      id: 10,
      name: r'pingSource',
      type: IsarType.byte,
      enumMap: _LocationPingModelpingSourceEnumValueMap,
    ),
    r'recordedAt': PropertySchema(
      id: 11,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'serverId': PropertySchema(id: 12, name: r'serverId', type: IsarType.long),
    r'speedMps': PropertySchema(
      id: 13,
      name: r'speedMps',
      type: IsarType.double,
    ),
    r'syncState': PropertySchema(
      id: 14,
      name: r'syncState',
      type: IsarType.byte,
      enumMap: _LocationPingModelsyncStateEnumValueMap,
    ),
    r'syncedAt': PropertySchema(
      id: 15,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _locationPingModelEstimateSize,
  serialize: _locationPingModelSerialize,
  deserialize: _locationPingModelDeserialize,
  deserializeProp: _locationPingModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'localId': IndexSchema(
      id: 1199848425898359622,
      name: r'localId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'localId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'recordedAt': IndexSchema(
      id: -5046025352082009396,
      name: r'recordedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recordedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'syncState': IndexSchema(
      id: -413052077849439895,
      name: r'syncState',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncState',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _locationPingModelGetId,
  getLinks: _locationPingModelGetLinks,
  attach: _locationPingModelAttach,
  version: '3.3.0-dev.1',
);

int _locationPingModelEstimateSize(
  LocationPingModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.networkType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _locationPingModelSerialize(
  LocationPingModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracyMeters);
  writer.writeDouble(offsets[1], object.altitudeMeters);
  writer.writeLong(offsets[2], object.batteryLevel);
  writer.writeDouble(offsets[3], object.headingDegrees);
  writer.writeBool(offsets[4], object.isCharging);
  writer.writeDouble(offsets[5], object.latitude);
  writer.writeString(offsets[6], object.localId);
  writer.writeDouble(offsets[7], object.longitude);
  writer.writeString(offsets[8], object.networkType);
  writer.writeLong(offsets[9], object.nextPingSeconds);
  writer.writeByte(offsets[10], object.pingSource.index);
  writer.writeDateTime(offsets[11], object.recordedAt);
  writer.writeLong(offsets[12], object.serverId);
  writer.writeDouble(offsets[13], object.speedMps);
  writer.writeByte(offsets[14], object.syncState.index);
  writer.writeDateTime(offsets[15], object.syncedAt);
}

LocationPingModel _locationPingModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationPingModel();
  object.accuracyMeters = reader.readDouble(offsets[0]);
  object.altitudeMeters = reader.readDoubleOrNull(offsets[1]);
  object.batteryLevel = reader.readLongOrNull(offsets[2]);
  object.headingDegrees = reader.readDoubleOrNull(offsets[3]);
  object.id = id;
  object.isCharging = reader.readBoolOrNull(offsets[4]);
  object.latitude = reader.readDouble(offsets[5]);
  object.localId = reader.readString(offsets[6]);
  object.longitude = reader.readDouble(offsets[7]);
  object.networkType = reader.readStringOrNull(offsets[8]);
  object.nextPingSeconds = reader.readLongOrNull(offsets[9]);
  object.pingSource =
      _LocationPingModelpingSourceValueEnumMap[reader.readByteOrNull(
        offsets[10],
      )] ??
      PingSourceModel.foreground;
  object.recordedAt = reader.readDateTime(offsets[11]);
  object.serverId = reader.readLongOrNull(offsets[12]);
  object.speedMps = reader.readDoubleOrNull(offsets[13]);
  object.syncState =
      _LocationPingModelsyncStateValueEnumMap[reader.readByteOrNull(
        offsets[14],
      )] ??
      LocationPingSyncStateModel.pending;
  object.syncedAt = reader.readDateTimeOrNull(offsets[15]);
  return object;
}

P _locationPingModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (_LocationPingModelpingSourceValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              PingSourceModel.foreground)
          as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (_LocationPingModelsyncStateValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              LocationPingSyncStateModel.pending)
          as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocationPingModelpingSourceEnumValueMap = {
  'foreground': 0,
  'background': 1,
  'geofenceEvent': 2,
  'manual': 3,
};
const _LocationPingModelpingSourceValueEnumMap = {
  0: PingSourceModel.foreground,
  1: PingSourceModel.background,
  2: PingSourceModel.geofenceEvent,
  3: PingSourceModel.manual,
};
const _LocationPingModelsyncStateEnumValueMap = {
  'pending': 0,
  'syncing': 1,
  'synced': 2,
  'failed': 3,
};
const _LocationPingModelsyncStateValueEnumMap = {
  0: LocationPingSyncStateModel.pending,
  1: LocationPingSyncStateModel.syncing,
  2: LocationPingSyncStateModel.synced,
  3: LocationPingSyncStateModel.failed,
};

Id _locationPingModelGetId(LocationPingModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _locationPingModelGetLinks(
  LocationPingModel object,
) {
  return [];
}

void _locationPingModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  LocationPingModel object,
) {
  object.id = id;
}

extension LocationPingModelByIndex on IsarCollection<LocationPingModel> {
  Future<LocationPingModel?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  LocationPingModel? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<LocationPingModel?>> getAllByLocalId(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<LocationPingModel?> getAllByLocalIdSync(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'localId', values);
  }

  Future<int> deleteAllByLocalId(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'localId', values);
  }

  int deleteAllByLocalIdSync(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'localId', values);
  }

  Future<Id> putByLocalId(LocationPingModel object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(LocationPingModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<LocationPingModel> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(
    List<LocationPingModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }
}

extension LocationPingModelQueryWhereSort
    on QueryBuilder<LocationPingModel, LocationPingModel, QWhere> {
  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhere>
  anyRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recordedAt'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhere>
  anySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncState'),
      );
    });
  }
}

extension LocationPingModelQueryWhere
    on QueryBuilder<LocationPingModel, LocationPingModel, QWhereClause> {
  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  localIdNotEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localId',
                lower: [],
                upper: [localId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localId',
                lower: [localId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localId',
                lower: [localId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localId',
                lower: [],
                upper: [localId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  recordedAtEqualTo(DateTime recordedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recordedAt', value: [recordedAt]),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  recordedAtNotEqualTo(DateTime recordedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [],
                upper: [recordedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [recordedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [recordedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [],
                upper: [recordedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  recordedAtGreaterThan(DateTime recordedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordedAt',
          lower: [recordedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  recordedAtLessThan(DateTime recordedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordedAt',
          lower: [],
          upper: [recordedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  recordedAtBetween(
    DateTime lowerRecordedAt,
    DateTime upperRecordedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordedAt',
          lower: [lowerRecordedAt],
          includeLower: includeLower,
          upper: [upperRecordedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  syncStateEqualTo(LocationPingSyncStateModel syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncState', value: [syncState]),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  syncStateNotEqualTo(LocationPingSyncStateModel syncState) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState',
                lower: [],
                upper: [syncState],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState',
                lower: [syncState],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState',
                lower: [syncState],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState',
                lower: [],
                upper: [syncState],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  syncStateGreaterThan(
    LocationPingSyncStateModel syncState, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncState',
          lower: [syncState],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  syncStateLessThan(
    LocationPingSyncStateModel syncState, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncState',
          lower: [],
          upper: [syncState],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterWhereClause>
  syncStateBetween(
    LocationPingSyncStateModel lowerSyncState,
    LocationPingSyncStateModel upperSyncState, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncState',
          lower: [lowerSyncState],
          includeLower: includeLower,
          upper: [upperSyncState],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LocationPingModelQueryFilter
    on QueryBuilder<LocationPingModel, LocationPingModel, QFilterCondition> {
  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  accuracyMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  accuracyMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  accuracyMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  accuracyMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accuracyMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  altitudeMetersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'altitudeMeters'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  altitudeMetersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'altitudeMeters'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  altitudeMetersEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'altitudeMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  altitudeMetersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'altitudeMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  altitudeMetersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'altitudeMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  altitudeMetersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'altitudeMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  batteryLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'batteryLevel'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  batteryLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'batteryLevel'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  batteryLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'batteryLevel', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  batteryLevelGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'batteryLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  batteryLevelLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'batteryLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  batteryLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'batteryLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  headingDegreesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'headingDegrees'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  headingDegreesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'headingDegrees'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  headingDegreesEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'headingDegrees',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  headingDegreesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'headingDegrees',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  headingDegreesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'headingDegrees',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  headingDegreesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'headingDegrees',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  idGreaterThan(Id? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  idLessThan(Id? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  isChargingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'isCharging'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  isChargingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'isCharging'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  isChargingEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCharging', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  latitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'latitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  longitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'longitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'networkType'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'networkType'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'networkType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'networkType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'networkType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'networkType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'networkType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'networkType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'networkType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'networkType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'networkType', value: ''),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  networkTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'networkType', value: ''),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  nextPingSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextPingSeconds'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  nextPingSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextPingSeconds'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  nextPingSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextPingSeconds', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  nextPingSecondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextPingSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  nextPingSecondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextPingSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  nextPingSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextPingSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  pingSourceEqualTo(PingSourceModel value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pingSource', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  pingSourceGreaterThan(PingSourceModel value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pingSource',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  pingSourceLessThan(PingSourceModel value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pingSource',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  pingSourceBetween(
    PingSourceModel lower,
    PingSourceModel upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pingSource',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordedAt', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  recordedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  recordedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  recordedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  serverIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  serverIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  serverIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  speedMpsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'speedMps'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  speedMpsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'speedMps'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  speedMpsEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speedMps',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  speedMpsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speedMps',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  speedMpsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speedMps',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  speedMpsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speedMps',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncStateEqualTo(LocationPingSyncStateModel value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncStateGreaterThan(
    LocationPingSyncStateModel value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncState',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncStateLessThan(LocationPingSyncStateModel value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncState',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncStateBetween(
    LocationPingSyncStateModel lower,
    LocationPingSyncStateModel upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncState',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterFilterCondition>
  syncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LocationPingModelQueryObject
    on QueryBuilder<LocationPingModel, LocationPingModel, QFilterCondition> {}

extension LocationPingModelQueryLinks
    on QueryBuilder<LocationPingModel, LocationPingModel, QFilterCondition> {}

extension LocationPingModelQuerySortBy
    on QueryBuilder<LocationPingModel, LocationPingModel, QSortBy> {
  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByAltitudeMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByAltitudeMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByBatteryLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batteryLevel', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByBatteryLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batteryLevel', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByHeadingDegrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDegrees', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByHeadingDegreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDegrees', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByIsCharging() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCharging', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByIsChargingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCharging', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByNetworkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkType', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByNetworkTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkType', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByNextPingSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPingSeconds', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByNextPingSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPingSeconds', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByPingSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingSource', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByPingSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingSource', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortBySpeedMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortBySpeedMpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }
}

extension LocationPingModelQuerySortThenBy
    on QueryBuilder<LocationPingModel, LocationPingModel, QSortThenBy> {
  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByAltitudeMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByAltitudeMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeMeters', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByBatteryLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batteryLevel', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByBatteryLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batteryLevel', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByHeadingDegrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDegrees', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByHeadingDegreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDegrees', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByIsCharging() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCharging', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByIsChargingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCharging', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByNetworkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkType', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByNetworkTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkType', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByNextPingSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPingSeconds', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByNextPingSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextPingSeconds', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByPingSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingSource', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByPingSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingSource', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenBySpeedMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenBySpeedMpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QAfterSortBy>
  thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }
}

extension LocationPingModelQueryWhereDistinct
    on QueryBuilder<LocationPingModel, LocationPingModel, QDistinct> {
  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracyMeters');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByAltitudeMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altitudeMeters');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByBatteryLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batteryLevel');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByHeadingDegrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'headingDegrees');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByIsCharging() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCharging');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByNetworkType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'networkType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByNextPingSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextPingSeconds');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByPingSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pingSource');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctBySpeedMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speedMps');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingModel, QDistinct>
  distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }
}

extension LocationPingModelQueryProperty
    on QueryBuilder<LocationPingModel, LocationPingModel, QQueryProperty> {
  QueryBuilder<LocationPingModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocationPingModel, double, QQueryOperations>
  accuracyMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracyMeters');
    });
  }

  QueryBuilder<LocationPingModel, double?, QQueryOperations>
  altitudeMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altitudeMeters');
    });
  }

  QueryBuilder<LocationPingModel, int?, QQueryOperations>
  batteryLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batteryLevel');
    });
  }

  QueryBuilder<LocationPingModel, double?, QQueryOperations>
  headingDegreesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'headingDegrees');
    });
  }

  QueryBuilder<LocationPingModel, bool?, QQueryOperations>
  isChargingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCharging');
    });
  }

  QueryBuilder<LocationPingModel, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<LocationPingModel, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<LocationPingModel, double, QQueryOperations>
  longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<LocationPingModel, String?, QQueryOperations>
  networkTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'networkType');
    });
  }

  QueryBuilder<LocationPingModel, int?, QQueryOperations>
  nextPingSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextPingSeconds');
    });
  }

  QueryBuilder<LocationPingModel, PingSourceModel, QQueryOperations>
  pingSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pingSource');
    });
  }

  QueryBuilder<LocationPingModel, DateTime, QQueryOperations>
  recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<LocationPingModel, int?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<LocationPingModel, double?, QQueryOperations>
  speedMpsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speedMps');
    });
  }

  QueryBuilder<LocationPingModel, LocationPingSyncStateModel, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<LocationPingModel, DateTime?, QQueryOperations>
  syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }
}
