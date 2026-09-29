// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_activation_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRouteActivationModelCollection on Isar {
  IsarCollection<RouteActivationModel> get routeActivationModels =>
      this.collection();
}

const RouteActivationModelSchema = CollectionSchema(
  name: r'RouteActivationModel',
  id: 3683847689050537031,
  properties: {
    r'activatedAt': PropertySchema(
      id: 0,
      name: r'activatedAt',
      type: IsarType.dateTime,
    ),
    r'deactivatedAt': PropertySchema(
      id: 1,
      name: r'deactivatedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 2, name: r'localId', type: IsarType.string),
    r'routeId': PropertySchema(id: 3, name: r'routeId', type: IsarType.string),
    r'serverId': PropertySchema(
      id: 4,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
      enumMap: _RouteActivationModelstatusEnumValueMap,
    ),
    r'syncState': PropertySchema(
      id: 6,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _RouteActivationModelsyncStateEnumValueMap,
    ),
    r'syncedAt': PropertySchema(
      id: 7,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(id: 8, name: r'userId', type: IsarType.string),
  },

  estimateSize: _routeActivationModelEstimateSize,
  serialize: _routeActivationModelSerialize,
  deserialize: _routeActivationModelDeserialize,
  deserializeProp: _routeActivationModelDeserializeProp,
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
    r'routeId': IndexSchema(
      id: 3544562048266535092,
      name: r'routeId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'routeId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'activatedAt': IndexSchema(
      id: -5947525253472437360,
      name: r'activatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'activatedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _routeActivationModelGetId,
  getLinks: _routeActivationModelGetLinks,
  attach: _routeActivationModelAttach,
  version: '3.3.2',
);

int _routeActivationModelEstimateSize(
  RouteActivationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.routeId.length * 3;
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.syncState.name.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _routeActivationModelSerialize(
  RouteActivationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.activatedAt);
  writer.writeDateTime(offsets[1], object.deactivatedAt);
  writer.writeString(offsets[2], object.localId);
  writer.writeString(offsets[3], object.routeId);
  writer.writeString(offsets[4], object.serverId);
  writer.writeString(offsets[5], object.status.name);
  writer.writeString(offsets[6], object.syncState.name);
  writer.writeDateTime(offsets[7], object.syncedAt);
  writer.writeString(offsets[8], object.userId);
}

RouteActivationModel _routeActivationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RouteActivationModel();
  object.activatedAt = reader.readDateTime(offsets[0]);
  object.deactivatedAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.localId = reader.readString(offsets[2]);
  object.routeId = reader.readString(offsets[3]);
  object.serverId = reader.readStringOrNull(offsets[4]);
  object.status =
      _RouteActivationModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[5],
      )] ??
      RouteActivationStatus.active;
  object.syncState =
      _RouteActivationModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[6],
      )] ??
      SyncState.localOnly;
  object.syncedAt = reader.readDateTimeOrNull(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  return object;
}

P _routeActivationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_RouteActivationModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              RouteActivationStatus.active)
          as P;
    case 6:
      return (_RouteActivationModelsyncStateValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              SyncState.localOnly)
          as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RouteActivationModelstatusEnumValueMap = {
  r'active': r'active',
  r'completed': r'completed',
  r'cancelled': r'cancelled',
};
const _RouteActivationModelstatusValueEnumMap = {
  r'active': RouteActivationStatus.active,
  r'completed': RouteActivationStatus.completed,
  r'cancelled': RouteActivationStatus.cancelled,
};
const _RouteActivationModelsyncStateEnumValueMap = {
  r'localOnly': r'localOnly',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'syncFailed': r'syncFailed',
  r'needsAttention': r'needsAttention',
};
const _RouteActivationModelsyncStateValueEnumMap = {
  r'localOnly': SyncState.localOnly,
  r'syncing': SyncState.syncing,
  r'synced': SyncState.synced,
  r'syncFailed': SyncState.syncFailed,
  r'needsAttention': SyncState.needsAttention,
};

Id _routeActivationModelGetId(RouteActivationModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _routeActivationModelGetLinks(
  RouteActivationModel object,
) {
  return [];
}

void _routeActivationModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  RouteActivationModel object,
) {
  object.id = id;
}

extension RouteActivationModelQueryWhereSort
    on QueryBuilder<RouteActivationModel, RouteActivationModel, QWhere> {
  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhere>
  anyActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'activatedAt'),
      );
    });
  }
}

extension RouteActivationModelQueryWhere
    on QueryBuilder<RouteActivationModel, RouteActivationModel, QWhereClause> {
  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
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

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
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

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
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

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  routeIdEqualTo(String routeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'routeId', value: [routeId]),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  routeIdNotEqualTo(String routeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeId',
                lower: [],
                upper: [routeId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeId',
                lower: [routeId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeId',
                lower: [routeId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'routeId',
                lower: [],
                upper: [routeId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  activatedAtEqualTo(DateTime activatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'activatedAt',
          value: [activatedAt],
        ),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  activatedAtNotEqualTo(DateTime activatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activatedAt',
                lower: [],
                upper: [activatedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activatedAt',
                lower: [activatedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activatedAt',
                lower: [activatedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activatedAt',
                lower: [],
                upper: [activatedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  activatedAtGreaterThan(DateTime activatedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activatedAt',
          lower: [activatedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  activatedAtLessThan(DateTime activatedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activatedAt',
          lower: [],
          upper: [activatedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterWhereClause>
  activatedAtBetween(
    DateTime lowerActivatedAt,
    DateTime upperActivatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'activatedAt',
          lower: [lowerActivatedAt],
          includeLower: includeLower,
          upper: [upperActivatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RouteActivationModelQueryFilter
    on
        QueryBuilder<
          RouteActivationModel,
          RouteActivationModel,
          QFilterCondition
        > {
  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  activatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  activatedAtGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  activatedAtLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  activatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  deactivatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deactivatedAt'),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  deactivatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deactivatedAt'),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  deactivatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deactivatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  deactivatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deactivatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  deactivatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deactivatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  deactivatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deactivatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  routeIdEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  routeIdGreaterThan(
    String value, {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  routeIdLessThan(
    String value, {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  routeIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  routeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'routeId', value: ''),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  routeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'routeId', value: ''),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  statusEqualTo(RouteActivationStatus value, {bool caseSensitive = true}) {
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  statusGreaterThan(
    RouteActivationStatus value, {
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  statusLessThan(
    RouteActivationStatus value, {
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  statusBetween(
    RouteActivationStatus lower,
    RouteActivationStatus upper, {
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncedAt'),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncedAt', value: value),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
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
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<
    RouteActivationModel,
    RouteActivationModel,
    QAfterFilterCondition
  >
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension RouteActivationModelQueryObject
    on
        QueryBuilder<
          RouteActivationModel,
          RouteActivationModel,
          QFilterCondition
        > {}

extension RouteActivationModelQueryLinks
    on
        QueryBuilder<
          RouteActivationModel,
          RouteActivationModel,
          QFilterCondition
        > {}

extension RouteActivationModelQuerySortBy
    on QueryBuilder<RouteActivationModel, RouteActivationModel, QSortBy> {
  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByActivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByDeactivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deactivatedAt', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByDeactivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deactivatedAt', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByRouteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByRouteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RouteActivationModelQuerySortThenBy
    on QueryBuilder<RouteActivationModel, RouteActivationModel, QSortThenBy> {
  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByActivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByDeactivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deactivatedAt', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByDeactivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deactivatedAt', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByRouteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByRouteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'routeId', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension RouteActivationModelQueryWhereDistinct
    on QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct> {
  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activatedAt');
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByDeactivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deactivatedAt');
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByRouteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'routeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationModel, QDistinct>
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension RouteActivationModelQueryProperty
    on
        QueryBuilder<
          RouteActivationModel,
          RouteActivationModel,
          QQueryProperty
        > {
  QueryBuilder<RouteActivationModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RouteActivationModel, DateTime, QQueryOperations>
  activatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activatedAt');
    });
  }

  QueryBuilder<RouteActivationModel, DateTime?, QQueryOperations>
  deactivatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deactivatedAt');
    });
  }

  QueryBuilder<RouteActivationModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<RouteActivationModel, String, QQueryOperations>
  routeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'routeId');
    });
  }

  QueryBuilder<RouteActivationModel, String?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<RouteActivationModel, RouteActivationStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RouteActivationModel, SyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<RouteActivationModel, DateTime?, QQueryOperations>
  syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<RouteActivationModel, String, QQueryOperations>
  userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
