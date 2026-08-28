// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_route_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyRouteModelCollection on Isar {
  IsarCollection<DailyRouteModel> get dailyRouteModels => this.collection();
}

const DailyRouteModelSchema = CollectionSchema(
  name: r'DailyRouteModel',
  id: 7553044550662417432,
  properties: {
    r'activatedAt': PropertySchema(
      id: 0,
      name: r'activatedAt',
      type: IsarType.dateTime,
    ),
    r'closedAt': PropertySchema(
      id: 1,
      name: r'closedAt',
      type: IsarType.dateTime,
    ),
    r'closedByUserId': PropertySchema(
      id: 2,
      name: r'closedByUserId',
      type: IsarType.string,
    ),
    r'closingNotes': PropertySchema(
      id: 3,
      name: r'closingNotes',
      type: IsarType.string,
    ),
    r'completedCount': PropertySchema(
      id: 4,
      name: r'completedCount',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dayOfWeek': PropertySchema(
      id: 6,
      name: r'dayOfWeek',
      type: IsarType.long,
    ),
    r'firstClockInAt': PropertySchema(
      id: 7,
      name: r'firstClockInAt',
      type: IsarType.dateTime,
    ),
    r'forceCloseReason': PropertySchema(
      id: 8,
      name: r'forceCloseReason',
      type: IsarType.string,
    ),
    r'forceClosed': PropertySchema(
      id: 9,
      name: r'forceClosed',
      type: IsarType.bool,
    ),
    r'forceClosedAt': PropertySchema(
      id: 10,
      name: r'forceClosedAt',
      type: IsarType.dateTime,
    ),
    r'forceClosedByUserId': PropertySchema(
      id: 11,
      name: r'forceClosedByUserId',
      type: IsarType.string,
    ),
    r'inProgressCount': PropertySchema(
      id: 12,
      name: r'inProgressCount',
      type: IsarType.long,
    ),
    r'lastClockOutAt': PropertySchema(
      id: 13,
      name: r'lastClockOutAt',
      type: IsarType.dateTime,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 14,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 15, name: r'localId', type: IsarType.string),
    r'routeDate': PropertySchema(
      id: 16,
      name: r'routeDate',
      type: IsarType.dateTime,
    ),
    r'salesAgentId': PropertySchema(
      id: 17,
      name: r'salesAgentId',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 18,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'skippedCount': PropertySchema(
      id: 19,
      name: r'skippedCount',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 20,
      name: r'status',
      type: IsarType.string,
      enumMap: _DailyRouteModelstatusEnumValueMap,
    ),
    r'syncError': PropertySchema(
      id: 21,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 22,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _DailyRouteModelsyncStateEnumValueMap,
    ),
    r'totalScheduled': PropertySchema(
      id: 23,
      name: r'totalScheduled',
      type: IsarType.long,
    ),
    r'totalVisitTimeMins': PropertySchema(
      id: 24,
      name: r'totalVisitTimeMins',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 25,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _dailyRouteModelEstimateSize,
  serialize: _dailyRouteModelSerialize,
  deserialize: _dailyRouteModelDeserialize,
  deserializeProp: _dailyRouteModelDeserializeProp,
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
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'salesAgentId': IndexSchema(
      id: 2602633652681520462,
      name: r'salesAgentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'salesAgentId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'routeDate': IndexSchema(
      id: 2155691950905415970,
      name: r'routeDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'routeDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _dailyRouteModelGetId,
  getLinks: _dailyRouteModelGetLinks,
  attach: _dailyRouteModelAttach,
  version: '3.3.0-dev.1',
);

int _dailyRouteModelEstimateSize(
  DailyRouteModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.closedByUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closingNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.forceCloseReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.forceClosedByUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.salesAgentId.length * 3;
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.syncError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncState.name.length * 3;
  return bytesCount;
}

void _dailyRouteModelSerialize(
  DailyRouteModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.activatedAt);
  writer.writeDateTime(offsets[1], object.closedAt);
  writer.writeString(offsets[2], object.closedByUserId);
  writer.writeString(offsets[3], object.closingNotes);
  writer.writeLong(offsets[4], object.completedCount);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeLong(offsets[6], object.dayOfWeek);
  writer.writeDateTime(offsets[7], object.firstClockInAt);
  writer.writeString(offsets[8], object.forceCloseReason);
  writer.writeBool(offsets[9], object.forceClosed);
  writer.writeDateTime(offsets[10], object.forceClosedAt);
  writer.writeString(offsets[11], object.forceClosedByUserId);
  writer.writeLong(offsets[12], object.inProgressCount);
  writer.writeDateTime(offsets[13], object.lastClockOutAt);
  writer.writeDateTime(offsets[14], object.lastSyncedAt);
  writer.writeString(offsets[15], object.localId);
  writer.writeDateTime(offsets[16], object.routeDate);
  writer.writeString(offsets[17], object.salesAgentId);
  writer.writeString(offsets[18], object.serverId);
  writer.writeLong(offsets[19], object.skippedCount);
  writer.writeString(offsets[20], object.status.name);
  writer.writeString(offsets[21], object.syncError);
  writer.writeString(offsets[22], object.syncState.name);
  writer.writeLong(offsets[23], object.totalScheduled);
  writer.writeLong(offsets[24], object.totalVisitTimeMins);
  writer.writeDateTime(offsets[25], object.updatedAt);
}

DailyRouteModel _dailyRouteModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyRouteModel();
  object.activatedAt = reader.readDateTimeOrNull(offsets[0]);
  object.closedAt = reader.readDateTimeOrNull(offsets[1]);
  object.closedByUserId = reader.readStringOrNull(offsets[2]);
  object.closingNotes = reader.readStringOrNull(offsets[3]);
  object.completedCount = reader.readLong(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.dayOfWeek = reader.readLong(offsets[6]);
  object.firstClockInAt = reader.readDateTimeOrNull(offsets[7]);
  object.forceCloseReason = reader.readStringOrNull(offsets[8]);
  object.forceClosed = reader.readBool(offsets[9]);
  object.forceClosedAt = reader.readDateTimeOrNull(offsets[10]);
  object.forceClosedByUserId = reader.readStringOrNull(offsets[11]);
  object.id = id;
  object.inProgressCount = reader.readLong(offsets[12]);
  object.lastClockOutAt = reader.readDateTimeOrNull(offsets[13]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[14]);
  object.localId = reader.readString(offsets[15]);
  object.routeDate = reader.readDateTime(offsets[16]);
  object.salesAgentId = reader.readString(offsets[17]);
  object.serverId = reader.readStringOrNull(offsets[18]);
  object.skippedCount = reader.readLong(offsets[19]);
  object.status =
      _DailyRouteModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[20],
      )] ??
      DailyRouteStatusModel.pending;
  object.syncError = reader.readStringOrNull(offsets[21]);
  object.syncState =
      _DailyRouteModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[22],
      )] ??
      SyncStateModel.localOnly;
  object.totalScheduled = reader.readLong(offsets[23]);
  object.totalVisitTimeMins = reader.readLong(offsets[24]);
  object.updatedAt = reader.readDateTime(offsets[25]);
  return object;
}

P _dailyRouteModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (_DailyRouteModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              DailyRouteStatusModel.pending)
          as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (_DailyRouteModelsyncStateValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SyncStateModel.localOnly)
          as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DailyRouteModelstatusEnumValueMap = {
  r'pending': r'pending',
  r'activated': r'activated',
  r'inProgress': r'inProgress',
  r'closed': r'closed',
  r'forceClosed': r'forceClosed',
};
const _DailyRouteModelstatusValueEnumMap = {
  r'pending': DailyRouteStatusModel.pending,
  r'activated': DailyRouteStatusModel.activated,
  r'inProgress': DailyRouteStatusModel.inProgress,
  r'closed': DailyRouteStatusModel.closed,
  r'forceClosed': DailyRouteStatusModel.forceClosed,
};
const _DailyRouteModelsyncStateEnumValueMap = {
  r'localOnly': r'localOnly',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'syncFailed': r'syncFailed',
  r'needsAttention': r'needsAttention',
};
const _DailyRouteModelsyncStateValueEnumMap = {
  r'localOnly': SyncStateModel.localOnly,
  r'syncing': SyncStateModel.syncing,
  r'synced': SyncStateModel.synced,
  r'syncFailed': SyncStateModel.syncFailed,
  r'needsAttention': SyncStateModel.needsAttention,
};

Id _dailyRouteModelGetId(DailyRouteModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _dailyRouteModelGetLinks(DailyRouteModel object) {
  return [];
}

void _dailyRouteModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  DailyRouteModel object,
) {
  object.id = id;
}

extension DailyRouteModelByIndex on IsarCollection<DailyRouteModel> {
  Future<DailyRouteModel?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  DailyRouteModel? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<DailyRouteModel?>> getAllByLocalId(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<DailyRouteModel?> getAllByLocalIdSync(List<String> localIdValues) {
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

  Future<Id> putByLocalId(DailyRouteModel object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(DailyRouteModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<DailyRouteModel> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(
    List<DailyRouteModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }
}

extension DailyRouteModelQueryWhereSort
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QWhere> {
  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhere> anyRouteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'routeDate'),
      );
    });
  }
}

extension DailyRouteModelQueryWhere
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QWhereClause> {
  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  serverIdNotEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [],
                upper: [serverId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [serverId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [serverId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [],
                upper: [serverId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  salesAgentIdEqualTo(String salesAgentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'salesAgentId',
          value: [salesAgentId],
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  salesAgentIdNotEqualTo(String salesAgentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentId',
                lower: [],
                upper: [salesAgentId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentId',
                lower: [salesAgentId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentId',
                lower: [salesAgentId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentId',
                lower: [],
                upper: [salesAgentId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  routeDateEqualTo(DateTime routeDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'routeDate', value: [routeDate]),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  routeDateNotEqualTo(DateTime routeDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeDate',
                lower: [],
                upper: [routeDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeDate',
                lower: [routeDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeDate',
                lower: [routeDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeDate',
                lower: [],
                upper: [routeDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  routeDateGreaterThan(DateTime routeDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'routeDate',
          lower: [routeDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  routeDateLessThan(DateTime routeDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'routeDate',
          lower: [],
          upper: [routeDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterWhereClause>
  routeDateBetween(
    DateTime lowerRouteDate,
    DateTime upperRouteDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'routeDate',
          lower: [lowerRouteDate],
          includeLower: includeLower,
          upper: [upperRouteDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DailyRouteModelQueryFilter
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QFilterCondition> {
  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  activatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'activatedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  activatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'activatedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  activatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activatedAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  activatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  activatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  activatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'closedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'closedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'closedAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'closedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'closedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'closedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'closedByUserId'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'closedByUserId'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'closedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'closedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'closedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'closedByUserId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'closedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'closedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'closedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'closedByUserId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'closedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'closedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'closingNotes'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'closingNotes'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'closingNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'closingNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'closingNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'closingNotes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'closingNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'closingNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'closingNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'closingNotes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'closingNotes', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  closingNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'closingNotes', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  completedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedCount', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  completedCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  completedCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  completedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  dayOfWeekEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dayOfWeek', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  dayOfWeekGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dayOfWeek',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  dayOfWeekLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dayOfWeek',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  dayOfWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dayOfWeek',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  firstClockInAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'firstClockInAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  firstClockInAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'firstClockInAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  firstClockInAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstClockInAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  firstClockInAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstClockInAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  firstClockInAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstClockInAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  firstClockInAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstClockInAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'forceCloseReason'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'forceCloseReason'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'forceCloseReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'forceCloseReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'forceCloseReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'forceCloseReason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'forceCloseReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'forceCloseReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'forceCloseReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'forceCloseReason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'forceCloseReason', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceCloseReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'forceCloseReason', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'forceClosed', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'forceClosedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'forceClosedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'forceClosedAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'forceClosedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'forceClosedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'forceClosedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'forceClosedByUserId'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'forceClosedByUserId'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'forceClosedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'forceClosedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'forceClosedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'forceClosedByUserId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'forceClosedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'forceClosedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'forceClosedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'forceClosedByUserId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'forceClosedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  forceClosedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'forceClosedByUserId',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  inProgressCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'inProgressCount', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  inProgressCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'inProgressCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  inProgressCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'inProgressCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  inProgressCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'inProgressCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastClockOutAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastClockOutAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastClockOutAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastClockOutAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastClockOutAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastClockOutAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastClockOutAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastClockOutAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastClockOutAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastClockOutAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastClockOutAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastClockOutAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastSyncedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSyncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastSyncedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSyncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  lastSyncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSyncedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  routeDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'routeDate', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  routeDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'routeDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  routeDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'routeDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  routeDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'routeDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'salesAgentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'salesAgentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'salesAgentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'salesAgentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'salesAgentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'salesAgentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'salesAgentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'salesAgentId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'salesAgentId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  salesAgentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'salesAgentId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  skippedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skippedCount', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  skippedCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skippedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  skippedCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skippedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  skippedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skippedCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  statusEqualTo(DailyRouteStatusModel value, {bool caseSensitive = true}) {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  statusGreaterThan(
    DailyRouteStatusModel value, {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  statusLessThan(
    DailyRouteStatusModel value, {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  statusBetween(
    DailyRouteStatusModel lower,
    DailyRouteStatusModel upper, {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'syncError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncError',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'syncError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'syncError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'syncError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'syncError',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncStateEqualTo(SyncStateModel value, {bool caseSensitive = true}) {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncStateGreaterThan(
    SyncStateModel value, {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncStateLessThan(
    SyncStateModel value, {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncStateBetween(
    SyncStateModel lower,
    SyncStateModel upper, {
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
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

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalScheduledEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalScheduled', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalScheduledGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalScheduled',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalScheduledLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalScheduled',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalScheduledBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalScheduled',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalVisitTimeMinsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalVisitTimeMins', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalVisitTimeMinsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalVisitTimeMins',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalVisitTimeMinsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalVisitTimeMins',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  totalVisitTimeMinsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalVisitTimeMins',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DailyRouteModelQueryObject
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QFilterCondition> {}

extension DailyRouteModelQueryLinks
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QFilterCondition> {}

extension DailyRouteModelQuerySortBy
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QSortBy> {
  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByActivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByClosedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedByUserId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByClosedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedByUserId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByClosingNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingNotes', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByClosingNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingNotes', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByCompletedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByFirstClockInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstClockInAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByFirstClockInAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstClockInAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceCloseReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceCloseReason', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceCloseReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceCloseReason', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosed', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosed', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceClosedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedByUserId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByForceClosedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedByUserId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByInProgressCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inProgressCount', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByInProgressCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inProgressCount', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByLastClockOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClockOutAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByLastClockOutAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClockOutAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy> sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByRouteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeDate', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByRouteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeDate', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySkippedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedCount', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySkippedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedCount', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByTotalScheduled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScheduled', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByTotalScheduledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScheduled', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByTotalVisitTimeMins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVisitTimeMins', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByTotalVisitTimeMinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVisitTimeMins', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DailyRouteModelQuerySortThenBy
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QSortThenBy> {
  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByActivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByClosedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedByUserId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByClosedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedByUserId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByClosingNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingNotes', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByClosingNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingNotes', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByCompletedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByFirstClockInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstClockInAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByFirstClockInAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstClockInAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceCloseReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceCloseReason', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceCloseReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceCloseReason', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosed', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosed', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceClosedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedByUserId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByForceClosedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forceClosedByUserId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByInProgressCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inProgressCount', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByInProgressCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inProgressCount', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByLastClockOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClockOutAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByLastClockOutAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClockOutAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByRouteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeDate', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByRouteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeDate', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySkippedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedCount', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySkippedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedCount', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByTotalScheduled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScheduled', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByTotalScheduledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScheduled', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByTotalVisitTimeMins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVisitTimeMins', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByTotalVisitTimeMinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVisitTimeMins', Sort.desc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DailyRouteModelQueryWhereDistinct
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct> {
  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activatedAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByClosedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'closedByUserId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByClosingNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closingNotes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedCount');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfWeek');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByFirstClockInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstClockInAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByForceCloseReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'forceCloseReason',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByForceClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forceClosed');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByForceClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forceClosedAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByForceClosedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'forceClosedByUserId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByInProgressCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inProgressCount');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByLastClockOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastClockOutAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct> distinctByLocalId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByRouteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeDate');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctBySalesAgentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesAgentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct> distinctByServerId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctBySkippedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skippedCount');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct> distinctByStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByTotalScheduled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalScheduled');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByTotalVisitTimeMins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalVisitTimeMins');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension DailyRouteModelQueryProperty
    on QueryBuilder<DailyRouteModel, DailyRouteModel, QQueryProperty> {
  QueryBuilder<DailyRouteModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime?, QQueryOperations>
  activatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activatedAt');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime?, QQueryOperations>
  closedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedAt');
    });
  }

  QueryBuilder<DailyRouteModel, String?, QQueryOperations>
  closedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedByUserId');
    });
  }

  QueryBuilder<DailyRouteModel, String?, QQueryOperations>
  closingNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closingNotes');
    });
  }

  QueryBuilder<DailyRouteModel, int, QQueryOperations>
  completedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedCount');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DailyRouteModel, int, QQueryOperations> dayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfWeek');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime?, QQueryOperations>
  firstClockInAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstClockInAt');
    });
  }

  QueryBuilder<DailyRouteModel, String?, QQueryOperations>
  forceCloseReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forceCloseReason');
    });
  }

  QueryBuilder<DailyRouteModel, bool, QQueryOperations> forceClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forceClosed');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime?, QQueryOperations>
  forceClosedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forceClosedAt');
    });
  }

  QueryBuilder<DailyRouteModel, String?, QQueryOperations>
  forceClosedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forceClosedByUserId');
    });
  }

  QueryBuilder<DailyRouteModel, int, QQueryOperations>
  inProgressCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inProgressCount');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime?, QQueryOperations>
  lastClockOutAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastClockOutAt');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime?, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<DailyRouteModel, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime, QQueryOperations>
  routeDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeDate');
    });
  }

  QueryBuilder<DailyRouteModel, String, QQueryOperations>
  salesAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesAgentId');
    });
  }

  QueryBuilder<DailyRouteModel, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<DailyRouteModel, int, QQueryOperations> skippedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skippedCount');
    });
  }

  QueryBuilder<DailyRouteModel, DailyRouteStatusModel, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DailyRouteModel, String?, QQueryOperations> syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<DailyRouteModel, SyncStateModel, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<DailyRouteModel, int, QQueryOperations>
  totalScheduledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalScheduled');
    });
  }

  QueryBuilder<DailyRouteModel, int, QQueryOperations>
  totalVisitTimeMinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalVisitTimeMins');
    });
  }

  QueryBuilder<DailyRouteModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
