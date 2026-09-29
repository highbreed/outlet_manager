// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_brand_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAgentBrandModelCollection on Isar {
  IsarCollection<AgentBrandModel> get agentBrandModels => this.collection();
}

const AgentBrandModelSchema = CollectionSchema(
  name: r'AgentBrandModel',
  id: -7250630625090452963,
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
    r'isAllBrands': PropertySchema(
      id: 5,
      name: r'isAllBrands',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _agentBrandModelEstimateSize,
  serialize: _agentBrandModelSerialize,
  deserialize: _agentBrandModelDeserialize,
  deserializeProp: _agentBrandModelDeserializeProp,
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
  },
  links: {},
  embeddedSchemas: {},

  getId: _agentBrandModelGetId,
  getLinks: _agentBrandModelGetLinks,
  attach: _agentBrandModelAttach,
  version: '3.3.2',
);

int _agentBrandModelEstimateSize(
  AgentBrandModel object,
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

void _agentBrandModelSerialize(
  AgentBrandModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.agentId);
  writer.writeStringList(offsets[1], object.brandCodes);
  writer.writeLongList(offsets[2], object.brandIds);
  writer.writeStringList(offsets[3], object.brandNames);
  writer.writeDateTime(offsets[4], object.cachedAt);
  writer.writeBool(offsets[5], object.isAllBrands);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

AgentBrandModel _agentBrandModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AgentBrandModel();
  object.agentId = reader.readLong(offsets[0]);
  object.brandCodes = reader.readStringList(offsets[1]) ?? [];
  object.brandIds = reader.readLongList(offsets[2]) ?? [];
  object.brandNames = reader.readStringList(offsets[3]) ?? [];
  object.cachedAt = reader.readDateTime(offsets[4]);
  object.id = id;
  object.isAllBrands = reader.readBool(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  return object;
}

P _agentBrandModelDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _agentBrandModelGetId(AgentBrandModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _agentBrandModelGetLinks(AgentBrandModel object) {
  return [];
}

void _agentBrandModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  AgentBrandModel object,
) {
  object.id = id;
}

extension AgentBrandModelQueryWhereSort
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QWhere> {
  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhere> anyAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'agentId'),
      );
    });
  }
}

extension AgentBrandModelQueryWhere
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QWhereClause> {
  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
  agentIdEqualTo(int agentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'agentId', value: [agentId]),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterWhereClause>
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
}

extension AgentBrandModelQueryFilter
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QFilterCondition> {
  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  agentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'agentId', value: value),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandCodes', value: ''),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandCodes', value: ''),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', length, true, length, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', 0, true, 0, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', 0, false, 999999, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', 0, true, length, include);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandCodesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandCodes', length, include, 999999, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandIds', value: value),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', length, true, length, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', 0, true, 0, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', 0, true, length, include);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandIds', length, include, 999999, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandNames', value: ''),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandNames', value: ''),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', length, true, length, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', 0, true, 0, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', 0, false, 999999, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', 0, true, length, include);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  brandNamesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandNames', length, include, 999999, true);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  cachedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cachedAt', value: value),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  isAllBrandsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isAllBrands', value: value),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterFilterCondition>
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

extension AgentBrandModelQueryObject
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QFilterCondition> {}

extension AgentBrandModelQueryLinks
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QFilterCondition> {}

extension AgentBrandModelQuerySortBy
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QSortBy> {
  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy> sortByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByIsAllBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrands', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByIsAllBrandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrands', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AgentBrandModelQuerySortThenBy
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QSortThenBy> {
  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy> thenByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agentId', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByCachedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cachedAt', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByIsAllBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrands', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByIsAllBrandsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAllBrands', Sort.desc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AgentBrandModelQueryWhereDistinct
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct> {
  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'agentId');
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByBrandCodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandCodes');
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByBrandIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandIds');
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByBrandNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandNames');
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByCachedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cachedAt');
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByIsAllBrands() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAllBrands');
    });
  }

  QueryBuilder<AgentBrandModel, AgentBrandModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension AgentBrandModelQueryProperty
    on QueryBuilder<AgentBrandModel, AgentBrandModel, QQueryProperty> {
  QueryBuilder<AgentBrandModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AgentBrandModel, int, QQueryOperations> agentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'agentId');
    });
  }

  QueryBuilder<AgentBrandModel, List<String>, QQueryOperations>
  brandCodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandCodes');
    });
  }

  QueryBuilder<AgentBrandModel, List<int>, QQueryOperations>
  brandIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandIds');
    });
  }

  QueryBuilder<AgentBrandModel, List<String>, QQueryOperations>
  brandNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandNames');
    });
  }

  QueryBuilder<AgentBrandModel, DateTime, QQueryOperations> cachedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cachedAt');
    });
  }

  QueryBuilder<AgentBrandModel, bool, QQueryOperations> isAllBrandsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAllBrands');
    });
  }

  QueryBuilder<AgentBrandModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
