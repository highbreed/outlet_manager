// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStockTakeSessionModelCollection on Isar {
  IsarCollection<StockTakeSessionModel> get stockTakeSessionModels =>
      this.collection();
}

const StockTakeSessionModelSchema = CollectionSchema(
  name: r'StockTakeSessionModel',
  id: -3860213809498854389,
  properties: {
    r'canAddItems': PropertySchema(
      id: 0,
      name: r'canAddItems',
      type: IsarType.bool,
    ),
    r'canSyncToServer': PropertySchema(
      id: 1,
      name: r'canSyncToServer',
      type: IsarType.bool,
    ),
    r'cancelReason': PropertySchema(
      id: 2,
      name: r'cancelReason',
      type: IsarType.string,
    ),
    r'cancelledAt': PropertySchema(
      id: 3,
      name: r'cancelledAt',
      type: IsarType.dateTime,
    ),
    r'completedAt': PropertySchema(
      id: 4,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 6,
      name: r'customerId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(id: 7, name: r'isActive', type: IsarType.bool),
    r'isCancelled': PropertySchema(
      id: 8,
      name: r'isCancelled',
      type: IsarType.bool,
    ),
    r'isCompleted': PropertySchema(
      id: 9,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isPaused': PropertySchema(id: 10, name: r'isPaused', type: IsarType.bool),
    r'lastPausedAt': PropertySchema(
      id: 11,
      name: r'lastPausedAt',
      type: IsarType.dateTime,
    ),
    r'lastResumedAt': PropertySchema(
      id: 12,
      name: r'lastResumedAt',
      type: IsarType.dateTime,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 13,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 14, name: r'localId', type: IsarType.string),
    r'notes': PropertySchema(id: 15, name: r'notes', type: IsarType.string),
    r'outletCode': PropertySchema(
      id: 16,
      name: r'outletCode',
      type: IsarType.string,
    ),
    r'outletName': PropertySchema(
      id: 17,
      name: r'outletName',
      type: IsarType.string,
    ),
    r'pausedAt': PropertySchema(
      id: 18,
      name: r'pausedAt',
      type: IsarType.dateTime,
    ),
    r'resumedAt': PropertySchema(
      id: 19,
      name: r'resumedAt',
      type: IsarType.dateTime,
    ),
    r'salesAgentId': PropertySchema(
      id: 20,
      name: r'salesAgentId',
      type: IsarType.long,
    ),
    r'sapStockTakeCode': PropertySchema(
      id: 21,
      name: r'sapStockTakeCode',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(id: 22, name: r'serverId', type: IsarType.long),
    r'startedAt': PropertySchema(
      id: 23,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 24,
      name: r'status',
      type: IsarType.string,
      enumMap: _StockTakeSessionModelstatusEnumValueMap,
    ),
    r'statusString': PropertySchema(
      id: 25,
      name: r'statusString',
      type: IsarType.string,
    ),
    r'syncError': PropertySchema(
      id: 26,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 27,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _StockTakeSessionModelsyncStateEnumValueMap,
    ),
    r'totalProducts': PropertySchema(
      id: 28,
      name: r'totalProducts',
      type: IsarType.long,
    ),
    r'totalSerials': PropertySchema(
      id: 29,
      name: r'totalSerials',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 30,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'visitLocalId': PropertySchema(
      id: 31,
      name: r'visitLocalId',
      type: IsarType.string,
    ),
    r'visitServerId': PropertySchema(
      id: 32,
      name: r'visitServerId',
      type: IsarType.long,
    ),
    r'warehouseId': PropertySchema(
      id: 33,
      name: r'warehouseId',
      type: IsarType.long,
    ),
    r'warehouseName': PropertySchema(
      id: 34,
      name: r'warehouseName',
      type: IsarType.string,
    ),
    r'warehouseType': PropertySchema(
      id: 35,
      name: r'warehouseType',
      type: IsarType.string,
      enumMap: _StockTakeSessionModelwarehouseTypeEnumValueMap,
    ),
  },

  estimateSize: _stockTakeSessionModelEstimateSize,
  serialize: _stockTakeSessionModelSerialize,
  deserialize: _stockTakeSessionModelDeserialize,
  deserializeProp: _stockTakeSessionModelDeserializeProp,
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
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'visitLocalId': IndexSchema(
      id: -2000498432582344955,
      name: r'visitLocalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'visitLocalId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'customerId': IndexSchema(
      id: 1498639901530368639,
      name: r'customerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'customerId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'warehouseId': IndexSchema(
      id: -3759612439572445753,
      name: r'warehouseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'warehouseId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.hash,
          caseSensitive: true,
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
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _stockTakeSessionModelGetId,
  getLinks: _stockTakeSessionModelGetLinks,
  attach: _stockTakeSessionModelAttach,
  version: '3.3.2',
);

int _stockTakeSessionModelEstimateSize(
  StockTakeSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cancelReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.outletCode.length * 3;
  bytesCount += 3 + object.outletName.length * 3;
  {
    final value = object.sapStockTakeCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.statusString.length * 3;
  {
    final value = object.syncError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncState.name.length * 3;
  bytesCount += 3 + object.visitLocalId.length * 3;
  bytesCount += 3 + object.warehouseName.length * 3;
  bytesCount += 3 + object.warehouseType.name.length * 3;
  return bytesCount;
}

void _stockTakeSessionModelSerialize(
  StockTakeSessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.canAddItems);
  writer.writeBool(offsets[1], object.canSyncToServer);
  writer.writeString(offsets[2], object.cancelReason);
  writer.writeDateTime(offsets[3], object.cancelledAt);
  writer.writeDateTime(offsets[4], object.completedAt);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeLong(offsets[6], object.customerId);
  writer.writeBool(offsets[7], object.isActive);
  writer.writeBool(offsets[8], object.isCancelled);
  writer.writeBool(offsets[9], object.isCompleted);
  writer.writeBool(offsets[10], object.isPaused);
  writer.writeDateTime(offsets[11], object.lastPausedAt);
  writer.writeDateTime(offsets[12], object.lastResumedAt);
  writer.writeDateTime(offsets[13], object.lastSyncedAt);
  writer.writeString(offsets[14], object.localId);
  writer.writeString(offsets[15], object.notes);
  writer.writeString(offsets[16], object.outletCode);
  writer.writeString(offsets[17], object.outletName);
  writer.writeDateTime(offsets[18], object.pausedAt);
  writer.writeDateTime(offsets[19], object.resumedAt);
  writer.writeLong(offsets[20], object.salesAgentId);
  writer.writeString(offsets[21], object.sapStockTakeCode);
  writer.writeLong(offsets[22], object.serverId);
  writer.writeDateTime(offsets[23], object.startedAt);
  writer.writeString(offsets[24], object.status.name);
  writer.writeString(offsets[25], object.statusString);
  writer.writeString(offsets[26], object.syncError);
  writer.writeString(offsets[27], object.syncState.name);
  writer.writeLong(offsets[28], object.totalProducts);
  writer.writeLong(offsets[29], object.totalSerials);
  writer.writeDateTime(offsets[30], object.updatedAt);
  writer.writeString(offsets[31], object.visitLocalId);
  writer.writeLong(offsets[32], object.visitServerId);
  writer.writeLong(offsets[33], object.warehouseId);
  writer.writeString(offsets[34], object.warehouseName);
  writer.writeString(offsets[35], object.warehouseType.name);
}

StockTakeSessionModel _stockTakeSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StockTakeSessionModel();
  object.cancelReason = reader.readStringOrNull(offsets[2]);
  object.cancelledAt = reader.readDateTimeOrNull(offsets[3]);
  object.completedAt = reader.readDateTimeOrNull(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.customerId = reader.readLong(offsets[6]);
  object.id = id;
  object.lastPausedAt = reader.readDateTimeOrNull(offsets[11]);
  object.lastResumedAt = reader.readDateTimeOrNull(offsets[12]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[13]);
  object.localId = reader.readString(offsets[14]);
  object.notes = reader.readStringOrNull(offsets[15]);
  object.outletCode = reader.readString(offsets[16]);
  object.outletName = reader.readString(offsets[17]);
  object.pausedAt = reader.readDateTimeOrNull(offsets[18]);
  object.resumedAt = reader.readDateTimeOrNull(offsets[19]);
  object.salesAgentId = reader.readLong(offsets[20]);
  object.sapStockTakeCode = reader.readStringOrNull(offsets[21]);
  object.serverId = reader.readLongOrNull(offsets[22]);
  object.startedAt = reader.readDateTime(offsets[23]);
  object.status =
      _StockTakeSessionModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[24],
      )] ??
      StockTakeStatus.active;
  object.syncError = reader.readStringOrNull(offsets[26]);
  object.syncState =
      _StockTakeSessionModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[27],
      )] ??
      SyncState.pending;
  object.totalProducts = reader.readLong(offsets[28]);
  object.totalSerials = reader.readLong(offsets[29]);
  object.updatedAt = reader.readDateTime(offsets[30]);
  object.visitLocalId = reader.readString(offsets[31]);
  object.visitServerId = reader.readLongOrNull(offsets[32]);
  object.warehouseId = reader.readLong(offsets[33]);
  object.warehouseName = reader.readString(offsets[34]);
  object.warehouseType =
      _StockTakeSessionModelwarehouseTypeValueEnumMap[reader.readStringOrNull(
        offsets[35],
      )] ??
      WarehouseType.display;
  return object;
}

P _stockTakeSessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readDateTime(offset)) as P;
    case 24:
      return (_StockTakeSessionModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              StockTakeStatus.active)
          as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (_StockTakeSessionModelsyncStateValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              SyncState.pending)
          as P;
    case 28:
      return (reader.readLong(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    case 30:
      return (reader.readDateTime(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    case 33:
      return (reader.readLong(offset)) as P;
    case 34:
      return (reader.readString(offset)) as P;
    case 35:
      return (_StockTakeSessionModelwarehouseTypeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              WarehouseType.display)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StockTakeSessionModelstatusEnumValueMap = {
  r'active': r'active',
  r'paused': r'paused',
  r'completed': r'completed',
  r'cancelled': r'cancelled',
};
const _StockTakeSessionModelstatusValueEnumMap = {
  r'active': StockTakeStatus.active,
  r'paused': StockTakeStatus.paused,
  r'completed': StockTakeStatus.completed,
  r'cancelled': StockTakeStatus.cancelled,
};
const _StockTakeSessionModelsyncStateEnumValueMap = {
  r'pending': r'pending',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'failed': r'failed',
};
const _StockTakeSessionModelsyncStateValueEnumMap = {
  r'pending': SyncState.pending,
  r'syncing': SyncState.syncing,
  r'synced': SyncState.synced,
  r'failed': SyncState.failed,
};
const _StockTakeSessionModelwarehouseTypeEnumValueMap = {
  r'display': r'display',
  r'backStore': r'backStore',
};
const _StockTakeSessionModelwarehouseTypeValueEnumMap = {
  r'display': WarehouseType.display,
  r'backStore': WarehouseType.backStore,
};

Id _stockTakeSessionModelGetId(StockTakeSessionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stockTakeSessionModelGetLinks(
  StockTakeSessionModel object,
) {
  return [];
}

void _stockTakeSessionModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  StockTakeSessionModel object,
) {
  object.id = id;
}

extension StockTakeSessionModelQueryWhereSort
    on QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QWhere> {
  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhere>
  anyServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverId'),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhere>
  anyCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'customerId'),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhere>
  anyWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'warehouseId'),
      );
    });
  }
}

extension StockTakeSessionModelQueryWhere
    on
        QueryBuilder<
          StockTakeSessionModel,
          StockTakeSessionModel,
          QWhereClause
        > {
  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  serverIdEqualTo(int? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  serverIdNotEqualTo(int? serverId) {
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

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  serverIdGreaterThan(int? serverId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [serverId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  serverIdLessThan(int? serverId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [],
          upper: [serverId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  serverIdBetween(
    int? lowerServerId,
    int? upperServerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [lowerServerId],
          includeLower: includeLower,
          upper: [upperServerId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  visitLocalIdEqualTo(String visitLocalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'visitLocalId',
          value: [visitLocalId],
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  visitLocalIdNotEqualTo(String visitLocalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'visitLocalId',
                lower: [],
                upper: [visitLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'visitLocalId',
                lower: [visitLocalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'visitLocalId',
                lower: [visitLocalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'visitLocalId',
                lower: [],
                upper: [visitLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  customerIdEqualTo(int customerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'customerId', value: [customerId]),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  customerIdNotEqualTo(int customerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customerId',
                lower: [],
                upper: [customerId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customerId',
                lower: [customerId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customerId',
                lower: [customerId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customerId',
                lower: [],
                upper: [customerId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  customerIdGreaterThan(int customerId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'customerId',
          lower: [customerId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  customerIdLessThan(int customerId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'customerId',
          lower: [],
          upper: [customerId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  customerIdBetween(
    int lowerCustomerId,
    int upperCustomerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'customerId',
          lower: [lowerCustomerId],
          includeLower: includeLower,
          upper: [upperCustomerId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  warehouseIdEqualTo(int warehouseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'warehouseId',
          value: [warehouseId],
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  warehouseIdNotEqualTo(int warehouseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'warehouseId',
                lower: [],
                upper: [warehouseId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'warehouseId',
                lower: [warehouseId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'warehouseId',
                lower: [warehouseId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'warehouseId',
                lower: [],
                upper: [warehouseId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  warehouseIdGreaterThan(int warehouseId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'warehouseId',
          lower: [warehouseId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  warehouseIdLessThan(int warehouseId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'warehouseId',
          lower: [],
          upper: [warehouseId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  warehouseIdBetween(
    int lowerWarehouseId,
    int upperWarehouseId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'warehouseId',
          lower: [lowerWarehouseId],
          includeLower: includeLower,
          upper: [upperWarehouseId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  statusEqualTo(StockTakeStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  statusNotEqualTo(StockTakeStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  syncStateEqualTo(SyncState syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncState', value: [syncState]),
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterWhereClause>
  syncStateNotEqualTo(SyncState syncState) {
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
}

extension StockTakeSessionModelQueryFilter
    on
        QueryBuilder<
          StockTakeSessionModel,
          StockTakeSessionModel,
          QFilterCondition
        > {
  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  canAddItemsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'canAddItems', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  canSyncToServerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'canSyncToServer', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cancelReason'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cancelReason'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cancelReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cancelReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cancelReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cancelReason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cancelReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cancelReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cancelReason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cancelReason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cancelReason', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cancelReason', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelledAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cancelledAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelledAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cancelledAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelledAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cancelledAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelledAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cancelledAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelledAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cancelledAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  cancelledAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cancelledAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  completedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  completedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  customerIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerId', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  customerIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'customerId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  customerIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'customerId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  customerIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'customerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  isCancelledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCancelled', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCompleted', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  isPausedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isPaused', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastPausedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastPausedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastPausedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastPausedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastPausedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastPausedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastPausedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastPausedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastPausedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastPausedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastPausedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastPausedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastResumedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastResumedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastResumedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastResumedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastResumedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastResumedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastResumedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastResumedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastResumedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastResumedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastResumedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastResumedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  outletCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  outletCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  outletNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  outletNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  pausedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pausedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  pausedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pausedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  pausedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pausedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  pausedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pausedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  pausedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pausedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  pausedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pausedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  resumedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'resumedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  resumedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'resumedAt'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  resumedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'resumedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  resumedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'resumedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  resumedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'resumedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  resumedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'resumedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  salesAgentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'salesAgentId', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  salesAgentIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'salesAgentId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  salesAgentIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'salesAgentId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  salesAgentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'salesAgentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sapStockTakeCode'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sapStockTakeCode'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sapStockTakeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sapStockTakeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sapStockTakeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sapStockTakeCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sapStockTakeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sapStockTakeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sapStockTakeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sapStockTakeCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sapStockTakeCode', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  sapStockTakeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sapStockTakeCode', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusEqualTo(StockTakeStatus value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusGreaterThan(
    StockTakeStatus value, {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusLessThan(
    StockTakeStatus value, {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusBetween(
    StockTakeStatus lower,
    StockTakeStatus upper, {
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'statusString',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statusString',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statusString',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statusString',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'statusString',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'statusString',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'statusString',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'statusString',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusString', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  statusStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'statusString', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalProductsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalProducts', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalProductsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalProducts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalProductsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalProducts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalProductsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalProducts',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalSerialsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalSerials', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalSerialsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalSerials',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalSerialsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalSerials',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  totalSerialsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalSerials',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'visitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitLocalId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'visitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'visitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'visitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'visitLocalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'visitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitServerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visitServerId'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitServerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visitServerId'),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitServerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitServerId', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitServerIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitServerId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitServerIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitServerId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  visitServerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitServerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'warehouseId', value: value),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'warehouseId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'warehouseId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'warehouseId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'warehouseName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'warehouseName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'warehouseName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'warehouseName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'warehouseName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'warehouseName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'warehouseName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'warehouseName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'warehouseName', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'warehouseName', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeEqualTo(WarehouseType value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'warehouseType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeGreaterThan(
    WarehouseType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'warehouseType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeLessThan(
    WarehouseType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'warehouseType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeBetween(
    WarehouseType lower,
    WarehouseType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'warehouseType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'warehouseType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'warehouseType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'warehouseType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'warehouseType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'warehouseType', value: ''),
      );
    });
  }

  QueryBuilder<
    StockTakeSessionModel,
    StockTakeSessionModel,
    QAfterFilterCondition
  >
  warehouseTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'warehouseType', value: ''),
      );
    });
  }
}

extension StockTakeSessionModelQueryObject
    on
        QueryBuilder<
          StockTakeSessionModel,
          StockTakeSessionModel,
          QFilterCondition
        > {}

extension StockTakeSessionModelQueryLinks
    on
        QueryBuilder<
          StockTakeSessionModel,
          StockTakeSessionModel,
          QFilterCondition
        > {}

extension StockTakeSessionModelQuerySortBy
    on QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QSortBy> {
  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCanAddItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddItems', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCanAddItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddItems', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCanSyncToServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSyncToServer', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCanSyncToServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSyncToServer', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCancelReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelReason', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCancelReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelReason', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsPaused() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByIsPausedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLastPausedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPausedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLastPausedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPausedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLastResumedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastResumedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLastResumedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastResumedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByPausedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByPausedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByResumedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByResumedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySapStockTakeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapStockTakeCode', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySapStockTakeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapStockTakeCode', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByStatusString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByStatusStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByTotalProducts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProducts', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByTotalProductsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProducts', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByTotalSerials() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSerials', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByTotalSerialsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSerials', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByWarehouseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByWarehouseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByWarehouseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  sortByWarehouseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.desc);
    });
  }
}

extension StockTakeSessionModelQuerySortThenBy
    on QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QSortThenBy> {
  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCanAddItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddItems', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCanAddItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddItems', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCanSyncToServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSyncToServer', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCanSyncToServerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSyncToServer', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCancelReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelReason', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCancelReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelReason', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsPaused() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByIsPausedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLastPausedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPausedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLastPausedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPausedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLastResumedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastResumedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLastResumedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastResumedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByPausedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByPausedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByResumedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByResumedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySapStockTakeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapStockTakeCode', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySapStockTakeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapStockTakeCode', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByStatusString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByStatusStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByTotalProducts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProducts', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByTotalProductsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProducts', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByTotalSerials() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSerials', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByTotalSerialsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSerials', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByWarehouseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByWarehouseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByWarehouseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.asc);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QAfterSortBy>
  thenByWarehouseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.desc);
    });
  }
}

extension StockTakeSessionModelQueryWhereDistinct
    on QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct> {
  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCanAddItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canAddItems');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCanSyncToServer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canSyncToServer');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCancelReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelReason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCancelled');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByIsPaused() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaused');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByLastPausedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPausedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByLastResumedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastResumedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByOutletCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByOutletName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByPausedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pausedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByResumedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resumedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesAgentId');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctBySapStockTakeCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'sapStockTakeCode',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByStatusString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByTotalProducts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalProducts');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByTotalSerials() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSerials');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByVisitLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitLocalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitServerId');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByWarehouseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'warehouseName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeSessionModel, QDistinct>
  distinctByWarehouseType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'warehouseType',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension StockTakeSessionModelQueryProperty
    on
        QueryBuilder<
          StockTakeSessionModel,
          StockTakeSessionModel,
          QQueryProperty
        > {
  QueryBuilder<StockTakeSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StockTakeSessionModel, bool, QQueryOperations>
  canAddItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canAddItems');
    });
  }

  QueryBuilder<StockTakeSessionModel, bool, QQueryOperations>
  canSyncToServerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canSyncToServer');
    });
  }

  QueryBuilder<StockTakeSessionModel, String?, QQueryOperations>
  cancelReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelReason');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  cancelledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, int, QQueryOperations>
  customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<StockTakeSessionModel, bool, QQueryOperations>
  isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<StockTakeSessionModel, bool, QQueryOperations>
  isCancelledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCancelled');
    });
  }

  QueryBuilder<StockTakeSessionModel, bool, QQueryOperations>
  isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<StockTakeSessionModel, bool, QQueryOperations>
  isPausedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaused');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  lastPausedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPausedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  lastResumedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastResumedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<StockTakeSessionModel, String?, QQueryOperations>
  notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<StockTakeSessionModel, String, QQueryOperations>
  outletCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletCode');
    });
  }

  QueryBuilder<StockTakeSessionModel, String, QQueryOperations>
  outletNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletName');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  pausedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pausedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime?, QQueryOperations>
  resumedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resumedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, int, QQueryOperations>
  salesAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesAgentId');
    });
  }

  QueryBuilder<StockTakeSessionModel, String?, QQueryOperations>
  sapStockTakeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sapStockTakeCode');
    });
  }

  QueryBuilder<StockTakeSessionModel, int?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, StockTakeStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<StockTakeSessionModel, String, QQueryOperations>
  statusStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusString');
    });
  }

  QueryBuilder<StockTakeSessionModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<StockTakeSessionModel, SyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<StockTakeSessionModel, int, QQueryOperations>
  totalProductsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalProducts');
    });
  }

  QueryBuilder<StockTakeSessionModel, int, QQueryOperations>
  totalSerialsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSerials');
    });
  }

  QueryBuilder<StockTakeSessionModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<StockTakeSessionModel, String, QQueryOperations>
  visitLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitLocalId');
    });
  }

  QueryBuilder<StockTakeSessionModel, int?, QQueryOperations>
  visitServerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitServerId');
    });
  }

  QueryBuilder<StockTakeSessionModel, int, QQueryOperations>
  warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }

  QueryBuilder<StockTakeSessionModel, String, QQueryOperations>
  warehouseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseName');
    });
  }

  QueryBuilder<StockTakeSessionModel, WarehouseType, QQueryOperations>
  warehouseTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseType');
    });
  }
}
