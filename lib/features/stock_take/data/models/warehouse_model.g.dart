// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWarehouseModelCollection on Isar {
  IsarCollection<WarehouseModel> get warehouseModels => this.collection();
}

const WarehouseModelSchema = CollectionSchema(
  name: r'WarehouseModel',
  id: 4346543022764006268,
  properties: {
    r'cachedAt': PropertySchema(
      id: 0,
      name: r'cachedAt',
      type: IsarType.dateTime,
    ),
    r'isActive': PropertySchema(id: 1, name: r'isActive', type: IsarType.bool),
    r'isBackStore': PropertySchema(
      id: 2,
      name: r'isBackStore',
      type: IsarType.bool,
    ),
    r'isDisplay': PropertySchema(
      id: 3,
      name: r'isDisplay',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(
      id: 4,
      name: r'location',
      type: IsarType.string,
    ),
    r'sapWarehouseCode': PropertySchema(
      id: 5,
      name: r'sapWarehouseCode',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(id: 6, name: r'serverId', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'warehouseCode': PropertySchema(
      id: 8,
      name: r'warehouseCode',
      type: IsarType.string,
    ),
    r'warehouseName': PropertySchema(
      id: 9,
      name: r'warehouseName',
      type: IsarType.string,
    ),
    r'warehouseType': PropertySchema(
      id: 10,
      name: r'warehouseType',
      type: IsarType.string,
      enumMap: _WarehouseModelwarehouseTypeEnumValueMap,
    ),
  },

  estimateSize: _warehouseModelEstimateSize,
  serialize: _warehouseModelSerialize,
  deserialize: _warehouseModelDeserialize,
  deserializeProp: _warehouseModelDeserializeProp,
  idName: r'id',
  indexes: {
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
  },
  links: {},
  embeddedSchemas: {},

  getId: _warehouseModelGetId,
  getLinks: _warehouseModelGetLinks,
  attach: _warehouseModelAttach,
  version: '3.3.2',
);

int _warehouseModelEstimateSize(
  WarehouseModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sapWarehouseCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.warehouseCode.length * 3;
  bytesCount += 3 + object.warehouseName.length * 3;
  bytesCount += 3 + object.warehouseType.name.length * 3;
  return bytesCount;
}

void _warehouseModelSerialize(
  WarehouseModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.cachedAt);
  writer.writeBool(offsets[1], object.isActive);
  writer.writeBool(offsets[2], object.isBackStore);
  writer.writeBool(offsets[3], object.isDisplay);
  writer.writeString(offsets[4], object.location);
  writer.writeString(offsets[5], object.sapWarehouseCode);
  writer.writeLong(offsets[6], object.serverId);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeString(offsets[8], object.warehouseCode);
  writer.writeString(offsets[9], object.warehouseName);
  writer.writeString(offsets[10], object.warehouseType.name);
}

WarehouseModel _warehouseModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WarehouseModel();
  object.cachedAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isActive = reader.readBool(offsets[1]);
  object.location = reader.readStringOrNull(offsets[4]);
  object.sapWarehouseCode = reader.readStringOrNull(offsets[5]);
  object.serverId = reader.readLong(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.warehouseCode = reader.readString(offsets[8]);
  object.warehouseName = reader.readString(offsets[9]);
  object.warehouseType =
      _WarehouseModelwarehouseTypeValueEnumMap[reader.readStringOrNull(
        offsets[10],
      )] ??
      WarehouseType.display;
  return object;
}

P _warehouseModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_WarehouseModelwarehouseTypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              WarehouseType.display)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WarehouseModelwarehouseTypeEnumValueMap = {
  r'display': r'display',
  r'backStore': r'backStore',
};
const _WarehouseModelwarehouseTypeValueEnumMap = {
  r'display': WarehouseType.display,
  r'backStore': WarehouseType.backStore,
};

Id _warehouseModelGetId(WarehouseModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _warehouseModelGetLinks(WarehouseModel object) {
  return [];
}

void _warehouseModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  WarehouseModel object,
) {
  object.id = id;
}

extension WarehouseModelQueryWhereSort
    on QueryBuilder<WarehouseModel, WarehouseModel, QWhere> {
  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhere> anyServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverId'),
      );
    });
  }
}

extension WarehouseModelQueryWhere
    on QueryBuilder<WarehouseModel, WarehouseModel, QWhereClause> {
  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause>
  serverIdEqualTo(int serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause>
  serverIdNotEqualTo(int serverId) {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause>
  serverIdGreaterThan(int serverId, {bool include = false}) {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause>
  serverIdLessThan(int serverId, {bool include = false}) {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterWhereClause>
  serverIdBetween(
    int lowerServerId,
    int upperServerId, {
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
}

extension WarehouseModelQueryFilter
    on QueryBuilder<WarehouseModel, WarehouseModel, QFilterCondition> {
  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  cachedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cachedAt', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  cachedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cachedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  cachedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cachedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  cachedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cachedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  isBackStoreEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBackStore', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  isDisplayEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDisplay', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'location'),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'location'),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'location',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'location',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'location', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'location', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sapWarehouseCode'),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sapWarehouseCode'),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sapWarehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sapWarehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sapWarehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sapWarehouseCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sapWarehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sapWarehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sapWarehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sapWarehouseCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sapWarehouseCode', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  sapWarehouseCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sapWarehouseCode', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  serverIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  serverIdGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  serverIdLessThan(int value, {bool include = false}) {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  serverIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'warehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'warehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'warehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'warehouseCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'warehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'warehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'warehouseCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'warehouseCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'warehouseCode', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'warehouseCode', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'warehouseName', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'warehouseName', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
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

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'warehouseType', value: ''),
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterFilterCondition>
  warehouseTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'warehouseType', value: ''),
      );
    });
  }
}

extension WarehouseModelQueryObject
    on QueryBuilder<WarehouseModel, WarehouseModel, QFilterCondition> {}

extension WarehouseModelQueryLinks
    on QueryBuilder<WarehouseModel, WarehouseModel, QFilterCondition> {}

extension WarehouseModelQuerySortBy
    on QueryBuilder<WarehouseModel, WarehouseModel, QSortBy> {
  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> sortByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByIsBackStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBackStore', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByIsBackStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBackStore', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> sortByIsDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisplay', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByIsDisplayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisplay', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortBySapWarehouseCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapWarehouseCode', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortBySapWarehouseCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapWarehouseCode', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByWarehouseCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseCode', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByWarehouseCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseCode', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByWarehouseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByWarehouseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByWarehouseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  sortByWarehouseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.desc);
    });
  }
}

extension WarehouseModelQuerySortThenBy
    on QueryBuilder<WarehouseModel, WarehouseModel, QSortThenBy> {
  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByIsBackStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBackStore', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByIsBackStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBackStore', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByIsDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisplay', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByIsDisplayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisplay', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenBySapWarehouseCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapWarehouseCode', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenBySapWarehouseCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sapWarehouseCode', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByWarehouseCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseCode', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByWarehouseCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseCode', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByWarehouseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByWarehouseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseName', Sort.desc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByWarehouseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.asc);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QAfterSortBy>
  thenByWarehouseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseType', Sort.desc);
    });
  }
}

extension WarehouseModelQueryWhereDistinct
    on QueryBuilder<WarehouseModel, WarehouseModel, QDistinct> {
  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct> distinctByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedAt');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctByIsBackStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBackStore');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctByIsDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDisplay');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct> distinctByLocation({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctBySapWarehouseCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'sapWarehouseCode',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct> distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctByWarehouseCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'warehouseCode',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctByWarehouseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'warehouseName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<WarehouseModel, WarehouseModel, QDistinct>
  distinctByWarehouseType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'warehouseType',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension WarehouseModelQueryProperty
    on QueryBuilder<WarehouseModel, WarehouseModel, QQueryProperty> {
  QueryBuilder<WarehouseModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WarehouseModel, DateTime, QQueryOperations> cachedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedAt');
    });
  }

  QueryBuilder<WarehouseModel, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<WarehouseModel, bool, QQueryOperations> isBackStoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBackStore');
    });
  }

  QueryBuilder<WarehouseModel, bool, QQueryOperations> isDisplayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDisplay');
    });
  }

  QueryBuilder<WarehouseModel, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<WarehouseModel, String?, QQueryOperations>
  sapWarehouseCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sapWarehouseCode');
    });
  }

  QueryBuilder<WarehouseModel, int, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<WarehouseModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<WarehouseModel, String, QQueryOperations>
  warehouseCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseCode');
    });
  }

  QueryBuilder<WarehouseModel, String, QQueryOperations>
  warehouseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseName');
    });
  }

  QueryBuilder<WarehouseModel, WarehouseType, QQueryOperations>
  warehouseTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseType');
    });
  }
}
