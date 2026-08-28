// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClockInSessionModelCollection on Isar {
  IsarCollection<ClockInSessionModel> get clockInSessionModels =>
      this.collection();
}

const ClockInSessionModelSchema = CollectionSchema(
  name: r'ClockInSessionModel',
  id: 309172354130026673,
  properties: {
    r'allocatedMinutes': PropertySchema(
      id: 0,
      name: r'allocatedMinutes',
      type: IsarType.long,
    ),
    r'autoClockoutGraceMinutes': PropertySchema(
      id: 1,
      name: r'autoClockoutGraceMinutes',
      type: IsarType.long,
    ),
    r'clockInAccuracy': PropertySchema(
      id: 2,
      name: r'clockInAccuracy',
      type: IsarType.double,
    ),
    r'clockInLatitude': PropertySchema(
      id: 3,
      name: r'clockInLatitude',
      type: IsarType.double,
    ),
    r'clockInLongitude': PropertySchema(
      id: 4,
      name: r'clockInLongitude',
      type: IsarType.double,
    ),
    r'clockOutAccuracy': PropertySchema(
      id: 5,
      name: r'clockOutAccuracy',
      type: IsarType.double,
    ),
    r'clockOutLatitude': PropertySchema(
      id: 6,
      name: r'clockOutLatitude',
      type: IsarType.double,
    ),
    r'clockOutLongitude': PropertySchema(
      id: 7,
      name: r'clockOutLongitude',
      type: IsarType.double,
    ),
    r'clockOutReason': PropertySchema(
      id: 8,
      name: r'clockOutReason',
      type: IsarType.string,
      enumMap: _ClockInSessionModelclockOutReasonEnumValueMap,
    ),
    r'clockedInAt': PropertySchema(
      id: 9,
      name: r'clockedInAt',
      type: IsarType.dateTime,
    ),
    r'clockedOutAt': PropertySchema(
      id: 10,
      name: r'clockedOutAt',
      type: IsarType.dateTime,
    ),
    r'confirmedExitAt': PropertySchema(
      id: 11,
      name: r'confirmedExitAt',
      type: IsarType.dateTime,
    ),
    r'consecutiveInsideReadings': PropertySchema(
      id: 12,
      name: r'consecutiveInsideReadings',
      type: IsarType.long,
    ),
    r'consecutiveOutsideReadings': PropertySchema(
      id: 13,
      name: r'consecutiveOutsideReadings',
      type: IsarType.long,
    ),
    r'firstOutsideReadingAt': PropertySchema(
      id: 14,
      name: r'firstOutsideReadingAt',
      type: IsarType.dateTime,
    ),
    r'geofenceRadiusMeters': PropertySchema(
      id: 15,
      name: r'geofenceRadiusMeters',
      type: IsarType.double,
    ),
    r'hasOrder': PropertySchema(id: 16, name: r'hasOrder', type: IsarType.bool),
    r'isDeviation': PropertySchema(
      id: 17,
      name: r'isDeviation',
      type: IsarType.bool,
    ),
    r'localId': PropertySchema(id: 18, name: r'localId', type: IsarType.string),
    r'outletCode': PropertySchema(
      id: 19,
      name: r'outletCode',
      type: IsarType.string,
    ),
    r'outletId': PropertySchema(
      id: 20,
      name: r'outletId',
      type: IsarType.string,
    ),
    r'outletName': PropertySchema(
      id: 21,
      name: r'outletName',
      type: IsarType.string,
    ),
    r'routeCovered': PropertySchema(
      id: 22,
      name: r'routeCovered',
      type: IsarType.string,
    ),
    r'routeId': PropertySchema(id: 23, name: r'routeId', type: IsarType.string),
    r'serverId': PropertySchema(
      id: 24,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 25,
      name: r'status',
      type: IsarType.string,
      enumMap: _ClockInSessionModelstatusEnumValueMap,
    ),
    r'syncState': PropertySchema(
      id: 26,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _ClockInSessionModelsyncStateEnumValueMap,
    ),
    r'syncedAt': PropertySchema(
      id: 27,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'transportExpense': PropertySchema(
      id: 28,
      name: r'transportExpense',
      type: IsarType.double,
    ),
  },

  estimateSize: _clockInSessionModelEstimateSize,
  serialize: _clockInSessionModelSerialize,
  deserialize: _clockInSessionModelDeserialize,
  deserializeProp: _clockInSessionModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'localId': IndexSchema(
      id: 1199848425898359622,
      name: r'localId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'localId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'outletId': IndexSchema(
      id: -1197630030247531768,
      name: r'outletId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'outletId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'clockedInAt': IndexSchema(
      id: -4658244192392729689,
      name: r'clockedInAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'clockedInAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _clockInSessionModelGetId,
  getLinks: _clockInSessionModelGetLinks,
  attach: _clockInSessionModelAttach,
  version: '3.3.0-dev.1',
);

int _clockInSessionModelEstimateSize(
  ClockInSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clockOutReason;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.outletCode.length * 3;
  bytesCount += 3 + object.outletId.length * 3;
  bytesCount += 3 + object.outletName.length * 3;
  {
    final value = object.routeCovered;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.routeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.syncState.name.length * 3;
  return bytesCount;
}

void _clockInSessionModelSerialize(
  ClockInSessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.allocatedMinutes);
  writer.writeLong(offsets[1], object.autoClockoutGraceMinutes);
  writer.writeDouble(offsets[2], object.clockInAccuracy);
  writer.writeDouble(offsets[3], object.clockInLatitude);
  writer.writeDouble(offsets[4], object.clockInLongitude);
  writer.writeDouble(offsets[5], object.clockOutAccuracy);
  writer.writeDouble(offsets[6], object.clockOutLatitude);
  writer.writeDouble(offsets[7], object.clockOutLongitude);
  writer.writeString(offsets[8], object.clockOutReason?.name);
  writer.writeDateTime(offsets[9], object.clockedInAt);
  writer.writeDateTime(offsets[10], object.clockedOutAt);
  writer.writeDateTime(offsets[11], object.confirmedExitAt);
  writer.writeLong(offsets[12], object.consecutiveInsideReadings);
  writer.writeLong(offsets[13], object.consecutiveOutsideReadings);
  writer.writeDateTime(offsets[14], object.firstOutsideReadingAt);
  writer.writeDouble(offsets[15], object.geofenceRadiusMeters);
  writer.writeBool(offsets[16], object.hasOrder);
  writer.writeBool(offsets[17], object.isDeviation);
  writer.writeString(offsets[18], object.localId);
  writer.writeString(offsets[19], object.outletCode);
  writer.writeString(offsets[20], object.outletId);
  writer.writeString(offsets[21], object.outletName);
  writer.writeString(offsets[22], object.routeCovered);
  writer.writeString(offsets[23], object.routeId);
  writer.writeString(offsets[24], object.serverId);
  writer.writeString(offsets[25], object.status.name);
  writer.writeString(offsets[26], object.syncState.name);
  writer.writeDateTime(offsets[27], object.syncedAt);
  writer.writeDouble(offsets[28], object.transportExpense);
}

ClockInSessionModel _clockInSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClockInSessionModel();
  object.allocatedMinutes = reader.readLong(offsets[0]);
  object.autoClockoutGraceMinutes = reader.readLong(offsets[1]);
  object.clockInAccuracy = reader.readDouble(offsets[2]);
  object.clockInLatitude = reader.readDouble(offsets[3]);
  object.clockInLongitude = reader.readDouble(offsets[4]);
  object.clockOutAccuracy = reader.readDoubleOrNull(offsets[5]);
  object.clockOutLatitude = reader.readDoubleOrNull(offsets[6]);
  object.clockOutLongitude = reader.readDoubleOrNull(offsets[7]);
  object.clockOutReason =
      _ClockInSessionModelclockOutReasonValueEnumMap[reader.readStringOrNull(
        offsets[8],
      )];
  object.clockedInAt = reader.readDateTime(offsets[9]);
  object.clockedOutAt = reader.readDateTimeOrNull(offsets[10]);
  object.confirmedExitAt = reader.readDateTimeOrNull(offsets[11]);
  object.consecutiveInsideReadings = reader.readLong(offsets[12]);
  object.consecutiveOutsideReadings = reader.readLong(offsets[13]);
  object.firstOutsideReadingAt = reader.readDateTimeOrNull(offsets[14]);
  object.geofenceRadiusMeters = reader.readDouble(offsets[15]);
  object.hasOrder = reader.readBoolOrNull(offsets[16]);
  object.id = id;
  object.isDeviation = reader.readBool(offsets[17]);
  object.localId = reader.readString(offsets[18]);
  object.outletCode = reader.readString(offsets[19]);
  object.outletId = reader.readString(offsets[20]);
  object.outletName = reader.readString(offsets[21]);
  object.routeCovered = reader.readStringOrNull(offsets[22]);
  object.routeId = reader.readStringOrNull(offsets[23]);
  object.serverId = reader.readStringOrNull(offsets[24]);
  object.status =
      _ClockInSessionModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[25],
      )] ??
      ClockInStatus.active;
  object.syncState =
      _ClockInSessionModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[26],
      )] ??
      SyncState.localOnly;
  object.syncedAt = reader.readDateTimeOrNull(offsets[27]);
  object.transportExpense = reader.readDoubleOrNull(offsets[28]);
  return object;
}

P _clockInSessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (_ClockInSessionModelclockOutReasonValueEnumMap[reader
              .readStringOrNull(offset)])
          as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readBoolOrNull(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (_ClockInSessionModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ClockInStatus.active)
          as P;
    case 26:
      return (_ClockInSessionModelsyncStateValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SyncState.localOnly)
          as P;
    case 27:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 28:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ClockInSessionModelclockOutReasonEnumValueMap = {
  r'manual': r'manual',
  r'geofenceExit': r'geofenceExit',
  r'forcedTimeout': r'forcedTimeout',
  r'serverAutoClose': r'serverAutoClose',
  r'routeDeactivation': r'routeDeactivation',
};
const _ClockInSessionModelclockOutReasonValueEnumMap = {
  r'manual': ClockOutReason.manual,
  r'geofenceExit': ClockOutReason.geofenceExit,
  r'forcedTimeout': ClockOutReason.forcedTimeout,
  r'serverAutoClose': ClockOutReason.serverAutoClose,
  r'routeDeactivation': ClockOutReason.routeDeactivation,
};
const _ClockInSessionModelstatusEnumValueMap = {
  r'active': r'active',
  r'completed': r'completed',
  r'autoClockOut': r'autoClockOut',
};
const _ClockInSessionModelstatusValueEnumMap = {
  r'active': ClockInStatus.active,
  r'completed': ClockInStatus.completed,
  r'autoClockOut': ClockInStatus.autoClockOut,
};
const _ClockInSessionModelsyncStateEnumValueMap = {
  r'localOnly': r'localOnly',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'syncFailed': r'syncFailed',
  r'needsAttention': r'needsAttention',
};
const _ClockInSessionModelsyncStateValueEnumMap = {
  r'localOnly': SyncState.localOnly,
  r'syncing': SyncState.syncing,
  r'synced': SyncState.synced,
  r'syncFailed': SyncState.syncFailed,
  r'needsAttention': SyncState.needsAttention,
};

Id _clockInSessionModelGetId(ClockInSessionModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _clockInSessionModelGetLinks(
  ClockInSessionModel object,
) {
  return [];
}

void _clockInSessionModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ClockInSessionModel object,
) {
  object.id = id;
}

extension ClockInSessionModelQueryWhereSort
    on QueryBuilder<ClockInSessionModel, ClockInSessionModel, QWhere> {
  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhere>
  anyClockedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'clockedInAt'),
      );
    });
  }
}

extension ClockInSessionModelQueryWhere
    on QueryBuilder<ClockInSessionModel, ClockInSessionModel, QWhereClause> {
  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  outletIdEqualTo(String outletId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'outletId', value: [outletId]),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  outletIdNotEqualTo(String outletId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [],
                upper: [outletId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [outletId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [outletId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [],
                upper: [outletId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  clockedInAtEqualTo(DateTime clockedInAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'clockedInAt',
          value: [clockedInAt],
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  clockedInAtNotEqualTo(DateTime clockedInAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clockedInAt',
                lower: [],
                upper: [clockedInAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clockedInAt',
                lower: [clockedInAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clockedInAt',
                lower: [clockedInAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clockedInAt',
                lower: [],
                upper: [clockedInAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  clockedInAtGreaterThan(DateTime clockedInAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'clockedInAt',
          lower: [clockedInAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  clockedInAtLessThan(DateTime clockedInAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'clockedInAt',
          lower: [],
          upper: [clockedInAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterWhereClause>
  clockedInAtBetween(
    DateTime lowerClockedInAt,
    DateTime upperClockedInAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'clockedInAt',
          lower: [lowerClockedInAt],
          includeLower: includeLower,
          upper: [upperClockedInAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ClockInSessionModelQueryFilter
    on
        QueryBuilder<
          ClockInSessionModel,
          ClockInSessionModel,
          QFilterCondition
        > {
  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  allocatedMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'allocatedMinutes', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  allocatedMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'allocatedMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  allocatedMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'allocatedMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  allocatedMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'allocatedMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  autoClockoutGraceMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'autoClockoutGraceMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  autoClockoutGraceMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'autoClockoutGraceMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  autoClockoutGraceMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'autoClockoutGraceMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  autoClockoutGraceMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'autoClockoutGraceMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInAccuracyEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInAccuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInAccuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInAccuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInAccuracy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLatitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLatitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLatitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLatitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInLatitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLongitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLongitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLongitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockInLongitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInLongitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutAccuracyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutAccuracy'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutAccuracyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutAccuracy'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutAccuracyEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutAccuracyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutAccuracyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutAccuracyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutAccuracy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutLatitude'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutLatitude'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLatitudeEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutLatitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutLongitude'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutLongitude'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLongitudeEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutLongitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutReason'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutReason'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonEqualTo(ClockOutReason? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonGreaterThan(
    ClockOutReason? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonLessThan(
    ClockOutReason? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonBetween(
    ClockOutReason? lower,
    ClockOutReason? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutReason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clockOutReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clockOutReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clockOutReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clockOutReason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockOutReason', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockOutReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'clockOutReason', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedInAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockedInAt', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedInAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockedInAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedInAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockedInAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedInAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockedInAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedOutAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockedOutAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedOutAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockedOutAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedOutAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockedOutAt', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedOutAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockedOutAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedOutAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockedOutAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  clockedOutAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockedOutAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  confirmedExitAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'confirmedExitAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  confirmedExitAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'confirmedExitAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  confirmedExitAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'confirmedExitAt', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  confirmedExitAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'confirmedExitAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  confirmedExitAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'confirmedExitAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  confirmedExitAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'confirmedExitAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveInsideReadingsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'consecutiveInsideReadings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveInsideReadingsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consecutiveInsideReadings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveInsideReadingsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consecutiveInsideReadings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveInsideReadingsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consecutiveInsideReadings',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveOutsideReadingsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'consecutiveOutsideReadings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveOutsideReadingsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consecutiveOutsideReadings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveOutsideReadingsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consecutiveOutsideReadings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  consecutiveOutsideReadingsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consecutiveOutsideReadings',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  firstOutsideReadingAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'firstOutsideReadingAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  firstOutsideReadingAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'firstOutsideReadingAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  firstOutsideReadingAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'firstOutsideReadingAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  firstOutsideReadingAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstOutsideReadingAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  firstOutsideReadingAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstOutsideReadingAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  firstOutsideReadingAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstOutsideReadingAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  geofenceRadiusMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'geofenceRadiusMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  geofenceRadiusMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'geofenceRadiusMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  geofenceRadiusMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'geofenceRadiusMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  geofenceRadiusMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'geofenceRadiusMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  hasOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hasOrder'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  hasOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hasOrder'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  hasOrderEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasOrder', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  isDeviationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeviation', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  outletNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'routeCovered'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'routeCovered'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'routeCovered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'routeCovered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'routeCovered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'routeCovered',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'routeCovered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'routeCovered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'routeCovered',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'routeCovered',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'routeCovered', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeCoveredIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'routeCovered', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'routeId'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'routeId'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'routeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'routeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'routeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'routeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'routeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'routeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'routeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'routeId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'routeId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  routeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'routeId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'serverId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusEqualTo(ClockInStatus value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusGreaterThan(
    ClockInStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusLessThan(
    ClockInStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusBetween(
    ClockInStatus lower,
    ClockInStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateEqualTo(SyncState value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'syncState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateGreaterThan(
    SyncState value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateLessThan(
    SyncState value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateBetween(
    SyncState lower,
    SyncState upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncState',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'syncState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'syncState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'syncState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'syncState',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
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

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  transportExpenseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'transportExpense'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  transportExpenseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'transportExpense'),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  transportExpenseEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'transportExpense',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  transportExpenseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'transportExpense',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  transportExpenseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'transportExpense',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterFilterCondition>
  transportExpenseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'transportExpense',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension ClockInSessionModelQueryObject
    on
        QueryBuilder<
          ClockInSessionModel,
          ClockInSessionModel,
          QFilterCondition
        > {}

extension ClockInSessionModelQueryLinks
    on
        QueryBuilder<
          ClockInSessionModel,
          ClockInSessionModel,
          QFilterCondition
        > {}

extension ClockInSessionModelQuerySortBy
    on QueryBuilder<ClockInSessionModel, ClockInSessionModel, QSortBy> {
  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByAllocatedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByAutoClockoutGraceMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoClockoutGraceMinutes', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByAutoClockoutGraceMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoClockoutGraceMinutes', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockInAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracy', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockInAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracy', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockInLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockInLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockInLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockInLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracy', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracy', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutReason', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockOutReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutReason', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedInAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockedInAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedInAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedOutAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByClockedOutAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedOutAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByConfirmedExitAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmedExitAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByConfirmedExitAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmedExitAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByConsecutiveInsideReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveInsideReadings', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByConsecutiveInsideReadingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveInsideReadings', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByConsecutiveOutsideReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveOutsideReadings', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByConsecutiveOutsideReadingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveOutsideReadings', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByFirstOutsideReadingAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOutsideReadingAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByFirstOutsideReadingAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOutsideReadingAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByGeofenceRadiusMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByGeofenceRadiusMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByHasOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOrder', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByHasOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOrder', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByIsDeviation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeviation', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByIsDeviationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeviation', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByRouteCovered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeCovered', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByRouteCoveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeCovered', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByRouteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByRouteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByTransportExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportExpense', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  sortByTransportExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportExpense', Sort.desc);
    });
  }
}

extension ClockInSessionModelQuerySortThenBy
    on QueryBuilder<ClockInSessionModel, ClockInSessionModel, QSortThenBy> {
  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByAllocatedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByAutoClockoutGraceMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoClockoutGraceMinutes', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByAutoClockoutGraceMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoClockoutGraceMinutes', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockInAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracy', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockInAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracy', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockInLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockInLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockInLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockInLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracy', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracy', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutReason', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockOutReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutReason', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedInAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockedInAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedInAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedOutAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByClockedOutAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockedOutAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByConfirmedExitAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmedExitAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByConfirmedExitAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmedExitAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByConsecutiveInsideReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveInsideReadings', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByConsecutiveInsideReadingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveInsideReadings', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByConsecutiveOutsideReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveOutsideReadings', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByConsecutiveOutsideReadingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveOutsideReadings', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByFirstOutsideReadingAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOutsideReadingAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByFirstOutsideReadingAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOutsideReadingAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByGeofenceRadiusMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByGeofenceRadiusMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByHasOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOrder', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByHasOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOrder', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByIsDeviation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeviation', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByIsDeviationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeviation', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByRouteCovered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeCovered', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByRouteCoveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeCovered', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByRouteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByRouteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByTransportExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportExpense', Sort.asc);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QAfterSortBy>
  thenByTransportExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportExpense', Sort.desc);
    });
  }
}

extension ClockInSessionModelQueryWhereDistinct
    on QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct> {
  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allocatedMinutes');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByAutoClockoutGraceMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoClockoutGraceMinutes');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockInAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInAccuracy');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockInLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInLatitude');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockInLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInLongitude');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockOutAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutAccuracy');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockOutLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutLatitude');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockOutLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutLongitude');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockOutReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'clockOutReason',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockedInAt');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByClockedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockedOutAt');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByConfirmedExitAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confirmedExitAt');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByConsecutiveInsideReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consecutiveInsideReadings');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByConsecutiveOutsideReadings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consecutiveOutsideReadings');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByFirstOutsideReadingAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstOutsideReadingAt');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByGeofenceRadiusMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geofenceRadiusMeters');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByHasOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasOrder');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByIsDeviation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeviation');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByOutletCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByOutletId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByOutletName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByRouteCovered({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeCovered', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByRouteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInSessionModel, QDistinct>
  distinctByTransportExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transportExpense');
    });
  }
}

extension ClockInSessionModelQueryProperty
    on QueryBuilder<ClockInSessionModel, ClockInSessionModel, QQueryProperty> {
  QueryBuilder<ClockInSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClockInSessionModel, int, QQueryOperations>
  allocatedMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allocatedMinutes');
    });
  }

  QueryBuilder<ClockInSessionModel, int, QQueryOperations>
  autoClockoutGraceMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoClockoutGraceMinutes');
    });
  }

  QueryBuilder<ClockInSessionModel, double, QQueryOperations>
  clockInAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInAccuracy');
    });
  }

  QueryBuilder<ClockInSessionModel, double, QQueryOperations>
  clockInLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInLatitude');
    });
  }

  QueryBuilder<ClockInSessionModel, double, QQueryOperations>
  clockInLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInLongitude');
    });
  }

  QueryBuilder<ClockInSessionModel, double?, QQueryOperations>
  clockOutAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutAccuracy');
    });
  }

  QueryBuilder<ClockInSessionModel, double?, QQueryOperations>
  clockOutLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutLatitude');
    });
  }

  QueryBuilder<ClockInSessionModel, double?, QQueryOperations>
  clockOutLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutLongitude');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockOutReason?, QQueryOperations>
  clockOutReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutReason');
    });
  }

  QueryBuilder<ClockInSessionModel, DateTime, QQueryOperations>
  clockedInAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockedInAt');
    });
  }

  QueryBuilder<ClockInSessionModel, DateTime?, QQueryOperations>
  clockedOutAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockedOutAt');
    });
  }

  QueryBuilder<ClockInSessionModel, DateTime?, QQueryOperations>
  confirmedExitAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confirmedExitAt');
    });
  }

  QueryBuilder<ClockInSessionModel, int, QQueryOperations>
  consecutiveInsideReadingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consecutiveInsideReadings');
    });
  }

  QueryBuilder<ClockInSessionModel, int, QQueryOperations>
  consecutiveOutsideReadingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consecutiveOutsideReadings');
    });
  }

  QueryBuilder<ClockInSessionModel, DateTime?, QQueryOperations>
  firstOutsideReadingAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstOutsideReadingAt');
    });
  }

  QueryBuilder<ClockInSessionModel, double, QQueryOperations>
  geofenceRadiusMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geofenceRadiusMeters');
    });
  }

  QueryBuilder<ClockInSessionModel, bool?, QQueryOperations>
  hasOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasOrder');
    });
  }

  QueryBuilder<ClockInSessionModel, bool, QQueryOperations>
  isDeviationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeviation');
    });
  }

  QueryBuilder<ClockInSessionModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<ClockInSessionModel, String, QQueryOperations>
  outletCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletCode');
    });
  }

  QueryBuilder<ClockInSessionModel, String, QQueryOperations>
  outletIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletId');
    });
  }

  QueryBuilder<ClockInSessionModel, String, QQueryOperations>
  outletNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletName');
    });
  }

  QueryBuilder<ClockInSessionModel, String?, QQueryOperations>
  routeCoveredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeCovered');
    });
  }

  QueryBuilder<ClockInSessionModel, String?, QQueryOperations>
  routeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeId');
    });
  }

  QueryBuilder<ClockInSessionModel, String?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<ClockInSessionModel, ClockInStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ClockInSessionModel, SyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<ClockInSessionModel, DateTime?, QQueryOperations>
  syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<ClockInSessionModel, double?, QQueryOperations>
  transportExpenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transportExpense');
    });
  }
}
