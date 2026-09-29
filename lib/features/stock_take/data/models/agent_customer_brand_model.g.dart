// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_customer_brand_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAgentCustomerBrandModelCollection on Isar {
  IsarCollection<AgentCustomerBrandModel> get agentCustomerBrandModels =>
      this.collection();
}

const AgentCustomerBrandModelSchema = CollectionSchema(
  name: r'AgentCustomerBrandModel',
  id: -7474675376768707471,
  properties: {
    r'agentId': PropertySchema(id: 0, name: r'agentId', type: IsarType.long),
    r'brandCodes': PropertySchema(
      id: 1,
      name: r'brandCodes',
      type: IsarType.stringList,
    ),
    r'brandIds': PropertySchema(
      id: 2,
      name: r'brandIds',
      type: IsarType.longList,
    ),
    r'brandNames': PropertySchema(
      id: 3,
      name: r'brandNames',
      type: IsarType.stringList,
    ),
    r'cachedAt': PropertySchema(
      id: 4,
      name: r'cachedAt',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 5,
      name: r'customerId',
      type: IsarType.long,
    ),
    r'hasGlobalAllBrands': PropertySchema(
      id: 6,
      name: r'hasGlobalAllBrands',
      type: IsarType.bool,
    ),
    r'isAllBrandsForCustomer': PropertySchema(
      id: 7,
      name: r'isAllBrandsForCustomer',
      type: IsarType.bool,
    ),
  },

  estimateSize: _agentCustomerBrandModelEstimateSize,
  serialize: _agentCustomerBrandModelSerialize,
  deserialize: _agentCustomerBrandModelDeserialize,
  deserializeProp: _agentCustomerBrandModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'agentId': IndexSchema(
      id: 7133481944148491938,
      name: r'agentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'agentId',
          type: IndexType.value,
          caseSensitive: false,
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
  },
  links: {},
  embeddedSchemas: {},

  getId: _agentCustomerBrandModelGetId,
  getLinks: _agentCustomerBrandModelGetLinks,
  attach: _agentCustomerBrandModelAttach,
  version: '3.3.2',
);

int _agentCustomerBrandModelEstimateSize(
  AgentCustomerBrandModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brandCodes.length * 3;
  {
    for (var i = 0; i < object.brandCodes.length; i++) {
      final value = object.brandCodes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.brandIds.length * 8;
  bytesCount += 3 + object.brandNames.length * 3;
  {
    for (var i = 0; i < object.brandNames.length; i++) {
      final value = object.brandNames[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _agentCustomerBrandModelSerialize(
  AgentCustomerBrandModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.agentId);
  writer.writeStringList(offsets[1], object.brandCodes);
  writer.writeLongList(offsets[2], object.brandIds);
  writer.writeStringList(offsets[3], object.brandNames);
  writer.writeDateTime(offsets[4], object.cachedAt);
  writer.writeLong(offsets[5], object.customerId);
  writer.writeBool(offsets[6], object.hasGlobalAllBrands);
  writer.writeBool(offsets[7], object.isAllBrandsForCustomer);
}

AgentCustomerBrandModel _agentCustomerBrandModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AgentCustomerBrandModel();
  object.agentId = reader.readLong(offsets[0]);
  object.brandCodes = reader.readStringList(offsets[1]) ?? [];
  object.brandIds = reader.readLongList(offsets[2]) ?? [];
  object.brandNames = reader.readStringList(offsets[3]) ?? [];
  object.cachedAt = reader.readDateTime(offsets[4]);
  object.customerId = reader.readLong(offsets[5]);
  object.hasGlobalAllBrands = reader.readBool(offsets[6]);
  object.id = id;
  object.isAllBrandsForCustomer = reader.readBool(offsets[7]);
  return object;
}

P _agentCustomerBrandModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _agentCustomerBrandModelGetId(AgentCustomerBrandModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _agentCustomerBrandModelGetLinks(
  AgentCustomerBrandModel object,
) {
  return [];
}

void _agentCustomerBrandModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  AgentCustomerBrandModel object,
) {
  object.id = id;
}

extension AgentCustomerBrandModelQueryWhereSort
    on QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QWhere> {
  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterWhere>
  anyAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'agentId'),
      );
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterWhere>
  anyCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'customerId'),
      );
    });
  }
}

extension AgentCustomerBrandModelQueryWhere
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QWhereClause
        > {
  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  agentIdEqualTo(int agentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'agentId', value: [agentId]),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  agentIdNotEqualTo(int agentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'agentId',
                lower: [],
                upper: [agentId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'agentId',
                lower: [agentId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'agentId',
                lower: [agentId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'agentId',
                lower: [],
                upper: [agentId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  agentIdGreaterThan(int agentId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'agentId',
          lower: [agentId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  agentIdLessThan(int agentId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'agentId',
          lower: [],
          upper: [agentId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  agentIdBetween(
    int lowerAgentId,
    int upperAgentId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'agentId',
          lower: [lowerAgentId],
          includeLower: includeLower,
          upper: [upperAgentId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
  customerIdEqualTo(int customerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'customerId', value: [customerId]),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterWhereClause
  >
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
}

extension AgentCustomerBrandModelQueryFilter
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QFilterCondition
        > {
  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  agentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'agentId', value: value),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  agentIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'agentId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  agentIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'agentId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  agentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'agentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'brandCodes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandCodes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandCodes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandCodes',
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'brandCodes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'brandCodes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'brandCodes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'brandCodes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandCodes', value: ''),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandCodes', value: ''),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', length, true, length, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', 0, true, 0, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', 0, true, length, include);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', length, include, 999999, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandCodesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'brandCodes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandIds', value: value),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', length, true, length, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', 0, true, 0, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', 0, true, length, include);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', length, include, 999999, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'brandIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'brandNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandNames',
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'brandNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'brandNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'brandNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'brandNames',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandNames', value: ''),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandNames', value: ''),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', length, true, length, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', 0, true, 0, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', 0, true, length, include);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', length, include, 999999, true);
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  brandNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'brandNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  cachedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cachedAt', value: value),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  hasGlobalAllBrandsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasGlobalAllBrands', value: value),
      );
    });
  }

  QueryBuilder<
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
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
    AgentCustomerBrandModel,
    AgentCustomerBrandModel,
    QAfterFilterCondition
  >
  isAllBrandsForCustomerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'isAllBrandsForCustomer',
          value: value,
        ),
      );
    });
  }
}

extension AgentCustomerBrandModelQueryObject
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QFilterCondition
        > {}

extension AgentCustomerBrandModelQueryLinks
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QFilterCondition
        > {}

extension AgentCustomerBrandModelQuerySortBy
    on QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QSortBy> {
  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByHasGlobalAllBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGlobalAllBrands', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByHasGlobalAllBrandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGlobalAllBrands', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByIsAllBrandsForCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrandsForCustomer', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  sortByIsAllBrandsForCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrandsForCustomer', Sort.desc);
    });
  }
}

extension AgentCustomerBrandModelQuerySortThenBy
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QSortThenBy
        > {
  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByHasGlobalAllBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGlobalAllBrands', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByHasGlobalAllBrandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGlobalAllBrands', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByIsAllBrandsForCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrandsForCustomer', Sort.asc);
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QAfterSortBy>
  thenByIsAllBrandsForCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrandsForCustomer', Sort.desc);
    });
  }
}

extension AgentCustomerBrandModelQueryWhereDistinct
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QDistinct
        > {
  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'agentId');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByBrandCodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandCodes');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByBrandIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandIds');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByBrandNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandNames');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedAt');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByHasGlobalAllBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasGlobalAllBrands');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, AgentCustomerBrandModel, QDistinct>
  distinctByIsAllBrandsForCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAllBrandsForCustomer');
    });
  }
}

extension AgentCustomerBrandModelQueryProperty
    on
        QueryBuilder<
          AgentCustomerBrandModel,
          AgentCustomerBrandModel,
          QQueryProperty
        > {
  QueryBuilder<AgentCustomerBrandModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, int, QQueryOperations>
  agentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'agentId');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, List<String>, QQueryOperations>
  brandCodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandCodes');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, List<int>, QQueryOperations>
  brandIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandIds');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, List<String>, QQueryOperations>
  brandNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandNames');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, DateTime, QQueryOperations>
  cachedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedAt');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, int, QQueryOperations>
  customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, bool, QQueryOperations>
  hasGlobalAllBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasGlobalAllBrands');
    });
  }

  QueryBuilder<AgentCustomerBrandModel, bool, QQueryOperations>
  isAllBrandsForCustomerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAllBrandsForCustomer');
    });
  }
}
