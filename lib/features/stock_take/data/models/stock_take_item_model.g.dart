// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_item_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStockTakeItemModelCollection on Isar {
  IsarCollection<StockTakeItemModel> get stockTakeItemModels =>
      this.collection();
}

const StockTakeItemModelSchema = CollectionSchema(
  name: r'StockTakeItemModel',
  id: 2757836333735864398,
  properties: {
    r'brandId': PropertySchema(id: 0, name: r'brandId', type: IsarType.long),
    r'brandName': PropertySchema(
      id: 1,
      name: r'brandName',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'completedAt': PropertySchema(
      id: 3,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'customerProductId': PropertySchema(
      id: 4,
      name: r'customerProductId',
      type: IsarType.long,
    ),
    r'isAboveMax': PropertySchema(
      id: 5,
      name: r'isAboveMax',
      type: IsarType.bool,
    ),
    r'isBelowMin': PropertySchema(
      id: 6,
      name: r'isBelowMin',
      type: IsarType.bool,
    ),
    r'isCompleted': PropertySchema(
      id: 7,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isInRange': PropertySchema(
      id: 8,
      name: r'isInRange',
      type: IsarType.bool,
    ),
    r'itemCode': PropertySchema(
      id: 9,
      name: r'itemCode',
      type: IsarType.string,
    ),
    r'itemDescription': PropertySchema(
      id: 10,
      name: r'itemDescription',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 11,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'localId': PropertySchema(id: 12, name: r'localId', type: IsarType.string),
    r'maxStockLevel': PropertySchema(
      id: 13,
      name: r'maxStockLevel',
      type: IsarType.long,
    ),
    r'minStockLevel': PropertySchema(
      id: 14,
      name: r'minStockLevel',
      type: IsarType.long,
    ),
    r'modelNumber': PropertySchema(
      id: 15,
      name: r'modelNumber',
      type: IsarType.string,
    ),
    r'serialCount': PropertySchema(
      id: 16,
      name: r'serialCount',
      type: IsarType.long,
    ),
    r'serverId': PropertySchema(id: 17, name: r'serverId', type: IsarType.long),
    r'sessionLocalId': PropertySchema(
      id: 18,
      name: r'sessionLocalId',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 19,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 20,
      name: r'status',
      type: IsarType.string,
      enumMap: _StockTakeItemModelstatusEnumValueMap,
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
      enumMap: _StockTakeItemModelsyncStateEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 23,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _stockTakeItemModelEstimateSize,
  serialize: _stockTakeItemModelSerialize,
  deserialize: _stockTakeItemModelDeserialize,
  deserializeProp: _stockTakeItemModelDeserializeProp,
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
    r'sessionLocalId': IndexSchema(
      id: 9052363567607604684,
      name: r'sessionLocalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sessionLocalId',
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

  getId: _stockTakeItemModelGetId,
  getLinks: _stockTakeItemModelGetLinks,
  attach: _stockTakeItemModelAttach,
  version: '3.3.2',
);

int _stockTakeItemModelEstimateSize(
  StockTakeItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brandName.length * 3;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemCode.length * 3;
  {
    final value = object.itemDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.modelNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sessionLocalId.length * 3;
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

void _stockTakeItemModelSerialize(
  StockTakeItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.brandId);
  writer.writeString(offsets[1], object.brandName);
  writer.writeString(offsets[2], object.category);
  writer.writeDateTime(offsets[3], object.completedAt);
  writer.writeLong(offsets[4], object.customerProductId);
  writer.writeBool(offsets[5], object.isAboveMax);
  writer.writeBool(offsets[6], object.isBelowMin);
  writer.writeBool(offsets[7], object.isCompleted);
  writer.writeBool(offsets[8], object.isInRange);
  writer.writeString(offsets[9], object.itemCode);
  writer.writeString(offsets[10], object.itemDescription);
  writer.writeString(offsets[11], object.itemName);
  writer.writeString(offsets[12], object.localId);
  writer.writeLong(offsets[13], object.maxStockLevel);
  writer.writeLong(offsets[14], object.minStockLevel);
  writer.writeString(offsets[15], object.modelNumber);
  writer.writeLong(offsets[16], object.serialCount);
  writer.writeLong(offsets[17], object.serverId);
  writer.writeString(offsets[18], object.sessionLocalId);
  writer.writeDateTime(offsets[19], object.startedAt);
  writer.writeString(offsets[20], object.status.name);
  writer.writeString(offsets[21], object.syncError);
  writer.writeString(offsets[22], object.syncState.name);
  writer.writeDateTime(offsets[23], object.updatedAt);
}

StockTakeItemModel _stockTakeItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StockTakeItemModel();
  object.brandId = reader.readLong(offsets[0]);
  object.brandName = reader.readString(offsets[1]);
  object.category = reader.readStringOrNull(offsets[2]);
  object.completedAt = reader.readDateTimeOrNull(offsets[3]);
  object.customerProductId = reader.readLong(offsets[4]);
  object.id = id;
  object.itemCode = reader.readString(offsets[9]);
  object.itemDescription = reader.readStringOrNull(offsets[10]);
  object.itemName = reader.readString(offsets[11]);
  object.localId = reader.readString(offsets[12]);
  object.maxStockLevel = reader.readLong(offsets[13]);
  object.minStockLevel = reader.readLong(offsets[14]);
  object.modelNumber = reader.readStringOrNull(offsets[15]);
  object.serialCount = reader.readLong(offsets[16]);
  object.serverId = reader.readLongOrNull(offsets[17]);
  object.sessionLocalId = reader.readString(offsets[18]);
  object.startedAt = reader.readDateTime(offsets[19]);
  object.status =
      _StockTakeItemModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[20],
      )] ??
      ItemCountStatus.inProgress;
  object.syncError = reader.readStringOrNull(offsets[21]);
  object.syncState =
      _StockTakeItemModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[22],
      )] ??
      SyncState.pending;
  object.updatedAt = reader.readDateTime(offsets[23]);
  return object;
}

P _stockTakeItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (_StockTakeItemModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ItemCountStatus.inProgress)
          as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (_StockTakeItemModelsyncStateValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SyncState.pending)
          as P;
    case 23:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StockTakeItemModelstatusEnumValueMap = {
  r'inProgress': r'inProgress',
  r'completed': r'completed',
};
const _StockTakeItemModelstatusValueEnumMap = {
  r'inProgress': ItemCountStatus.inProgress,
  r'completed': ItemCountStatus.completed,
};
const _StockTakeItemModelsyncStateEnumValueMap = {
  r'pending': r'pending',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'failed': r'failed',
};
const _StockTakeItemModelsyncStateValueEnumMap = {
  r'pending': SyncState.pending,
  r'syncing': SyncState.syncing,
  r'synced': SyncState.synced,
  r'failed': SyncState.failed,
};

Id _stockTakeItemModelGetId(StockTakeItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stockTakeItemModelGetLinks(
  StockTakeItemModel object,
) {
  return [];
}

void _stockTakeItemModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  StockTakeItemModel object,
) {
  object.id = id;
}

extension StockTakeItemModelQueryWhereSort
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QWhere> {
  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StockTakeItemModelQueryWhere
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QWhereClause> {
  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  sessionLocalIdEqualTo(String sessionLocalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'sessionLocalId',
          value: [sessionLocalId],
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  sessionLocalIdNotEqualTo(String sessionLocalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionLocalId',
                lower: [],
                upper: [sessionLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionLocalId',
                lower: [sessionLocalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionLocalId',
                lower: [sessionLocalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionLocalId',
                lower: [],
                upper: [sessionLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
  syncStateEqualTo(SyncState syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncState', value: [syncState]),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterWhereClause>
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

extension StockTakeItemModelQueryFilter
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QFilterCondition> {
  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandId', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'brandName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'brandName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'brandName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'brandName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'brandName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandName', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  brandNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandName', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'category'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'category'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'category',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'category',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'category', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'category', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  customerProductIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerProductId', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  customerProductIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'customerProductId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  customerProductIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'customerProductId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  customerProductIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'customerProductId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  isAboveMaxEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isAboveMax', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  isBelowMinEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBelowMin', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCompleted', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  isInRangeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isInRange', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'itemCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'itemCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'itemCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'itemCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'itemCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemCode', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'itemCode', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'itemDescription'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'itemDescription'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'itemDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemDescription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'itemDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'itemDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'itemDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'itemDescription',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemDescription', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'itemDescription', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'itemName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'itemName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'itemName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'itemName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'itemName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemName', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'itemName', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  maxStockLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxStockLevel', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  maxStockLevelGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxStockLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  maxStockLevelLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxStockLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  maxStockLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxStockLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  minStockLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'minStockLevel', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  minStockLevelGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minStockLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  minStockLevelLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minStockLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  minStockLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minStockLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'modelNumber'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'modelNumber'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modelNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modelNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modelNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modelNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modelNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modelNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modelNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modelNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelNumber', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  modelNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelNumber', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serialCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serialCount', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serialCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serialCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serialCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serialCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serialCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serialCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sessionLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sessionLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sessionLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sessionLocalId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sessionLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sessionLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sessionLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sessionLocalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionLocalId', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  sessionLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sessionLocalId', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  statusEqualTo(ItemCountStatus value, {bool caseSensitive = true}) {
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  statusGreaterThan(
    ItemCountStatus value, {
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  statusLessThan(
    ItemCountStatus value, {
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  statusBetween(
    ItemCountStatus lower,
    ItemCountStatus upper, {
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterFilterCondition>
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

extension StockTakeItemModelQueryObject
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QFilterCondition> {}

extension StockTakeItemModelQueryLinks
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QFilterCondition> {}

extension StockTakeItemModelQuerySortBy
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QSortBy> {
  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByBrandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByBrandIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByBrandName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByBrandNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByCustomerProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerProductId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByCustomerProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerProductId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsAboveMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAboveMax', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsAboveMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAboveMax', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsBelowMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBelowMin', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsBelowMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBelowMin', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsInRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInRange', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByIsInRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInRange', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByItemDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemDescription', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByItemDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemDescription', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByMaxStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByMinStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByModelNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelNumber', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByModelNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelNumber', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySerialCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialCount', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySerialCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialCount', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySessionLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySessionLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StockTakeItemModelQuerySortThenBy
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QSortThenBy> {
  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByBrandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByBrandIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByBrandName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByBrandNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByCustomerProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerProductId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByCustomerProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerProductId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsAboveMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAboveMax', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsAboveMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAboveMax', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsBelowMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBelowMin', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsBelowMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBelowMin', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsInRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInRange', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByIsInRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInRange', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByItemDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemDescription', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByItemDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemDescription', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByMaxStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByMinStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByModelNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelNumber', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByModelNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelNumber', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySerialCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialCount', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySerialCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialCount', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySessionLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySessionLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StockTakeItemModelQueryWhereDistinct
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct> {
  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByBrandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandId');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByBrandName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByCustomerProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerProductId');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByIsAboveMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAboveMax');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByIsBelowMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBelowMin');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByIsInRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInRange');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByItemDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'itemDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStockLevel');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minStockLevel');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByModelNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctBySerialCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serialCount');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctBySessionLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'sessionLocalId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockTakeItemModel, StockTakeItemModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension StockTakeItemModelQueryProperty
    on QueryBuilder<StockTakeItemModel, StockTakeItemModel, QQueryProperty> {
  QueryBuilder<StockTakeItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StockTakeItemModel, int, QQueryOperations> brandIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandId');
    });
  }

  QueryBuilder<StockTakeItemModel, String, QQueryOperations>
  brandNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandName');
    });
  }

  QueryBuilder<StockTakeItemModel, String?, QQueryOperations>
  categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<StockTakeItemModel, DateTime?, QQueryOperations>
  completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<StockTakeItemModel, int, QQueryOperations>
  customerProductIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerProductId');
    });
  }

  QueryBuilder<StockTakeItemModel, bool, QQueryOperations>
  isAboveMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAboveMax');
    });
  }

  QueryBuilder<StockTakeItemModel, bool, QQueryOperations>
  isBelowMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBelowMin');
    });
  }

  QueryBuilder<StockTakeItemModel, bool, QQueryOperations>
  isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<StockTakeItemModel, bool, QQueryOperations> isInRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInRange');
    });
  }

  QueryBuilder<StockTakeItemModel, String, QQueryOperations>
  itemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCode');
    });
  }

  QueryBuilder<StockTakeItemModel, String?, QQueryOperations>
  itemDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemDescription');
    });
  }

  QueryBuilder<StockTakeItemModel, String, QQueryOperations>
  itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<StockTakeItemModel, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<StockTakeItemModel, int, QQueryOperations>
  maxStockLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStockLevel');
    });
  }

  QueryBuilder<StockTakeItemModel, int, QQueryOperations>
  minStockLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minStockLevel');
    });
  }

  QueryBuilder<StockTakeItemModel, String?, QQueryOperations>
  modelNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelNumber');
    });
  }

  QueryBuilder<StockTakeItemModel, int, QQueryOperations>
  serialCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialCount');
    });
  }

  QueryBuilder<StockTakeItemModel, int?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<StockTakeItemModel, String, QQueryOperations>
  sessionLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionLocalId');
    });
  }

  QueryBuilder<StockTakeItemModel, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<StockTakeItemModel, ItemCountStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<StockTakeItemModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<StockTakeItemModel, SyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<StockTakeItemModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
