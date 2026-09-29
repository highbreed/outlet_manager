// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facings_count_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFacingsCountModelCollection on Isar {
  IsarCollection<FacingsCountModel> get facingsCountModels => this.collection();
}

const FacingsCountModelSchema = CollectionSchema(
  name: r'FacingsCountModel',
  id: 3472751438265166753,
  properties: {
    r'approvedAt': PropertySchema(
      id: 0,
      name: r'approvedAt',
      type: IsarType.dateTime,
    ),
    r'canEdit': PropertySchema(id: 1, name: r'canEdit', type: IsarType.bool),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerCode': PropertySchema(
      id: 3,
      name: r'customerCode',
      type: IsarType.string,
    ),
    r'customerId': PropertySchema(
      id: 4,
      name: r'customerId',
      type: IsarType.long,
    ),
    r'customerName': PropertySchema(
      id: 5,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'isInProgress': PropertySchema(
      id: 6,
      name: r'isInProgress',
      type: IsarType.bool,
    ),
    r'isSubmitted': PropertySchema(
      id: 7,
      name: r'isSubmitted',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 8,
      name: r'items',
      type: IsarType.objectList,

      target: r'FacingsCountItemModel',
    ),
    r'lastSyncedAt': PropertySchema(
      id: 9,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 10, name: r'localId', type: IsarType.string),
    r'salesAgentId': PropertySchema(
      id: 11,
      name: r'salesAgentId',
      type: IsarType.long,
    ),
    r'serverId': PropertySchema(id: 12, name: r'serverId', type: IsarType.long),
    r'status': PropertySchema(
      id: 13,
      name: r'status',
      type: IsarType.string,
      enumMap: _FacingsCountModelstatusEnumValueMap,
    ),
    r'submittedAt': PropertySchema(
      id: 14,
      name: r'submittedAt',
      type: IsarType.dateTime,
    ),
    r'syncError': PropertySchema(
      id: 15,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 16,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _FacingsCountModelsyncStateEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'visitLocalId': PropertySchema(
      id: 18,
      name: r'visitLocalId',
      type: IsarType.string,
    ),
    r'visitServerId': PropertySchema(
      id: 19,
      name: r'visitServerId',
      type: IsarType.long,
    ),
  },

  estimateSize: _facingsCountModelEstimateSize,
  serialize: _facingsCountModelSerialize,
  deserialize: _facingsCountModelDeserialize,
  deserializeProp: _facingsCountModelDeserializeProp,
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
    r'salesAgentId': IndexSchema(
      id: 2602633652681520462,
      name: r'salesAgentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'salesAgentId',
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
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
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
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {r'FacingsCountItemModel': FacingsCountItemModelSchema},

  getId: _facingsCountModelGetId,
  getLinks: _facingsCountModelGetLinks,
  attach: _facingsCountModelAttach,
  version: '3.3.2',
);

int _facingsCountModelEstimateSize(
  FacingsCountModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerCode.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[FacingsCountItemModel]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount += FacingsCountItemModelSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.syncError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncState.name.length * 3;
  bytesCount += 3 + object.visitLocalId.length * 3;
  return bytesCount;
}

void _facingsCountModelSerialize(
  FacingsCountModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.approvedAt);
  writer.writeBool(offsets[1], object.canEdit);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.customerCode);
  writer.writeLong(offsets[4], object.customerId);
  writer.writeString(offsets[5], object.customerName);
  writer.writeBool(offsets[6], object.isInProgress);
  writer.writeBool(offsets[7], object.isSubmitted);
  writer.writeObjectList<FacingsCountItemModel>(
    offsets[8],
    allOffsets,
    FacingsCountItemModelSchema.serialize,
    object.items,
  );
  writer.writeDateTime(offsets[9], object.lastSyncedAt);
  writer.writeString(offsets[10], object.localId);
  writer.writeLong(offsets[11], object.salesAgentId);
  writer.writeLong(offsets[12], object.serverId);
  writer.writeString(offsets[13], object.status.name);
  writer.writeDateTime(offsets[14], object.submittedAt);
  writer.writeString(offsets[15], object.syncError);
  writer.writeString(offsets[16], object.syncState.name);
  writer.writeDateTime(offsets[17], object.updatedAt);
  writer.writeString(offsets[18], object.visitLocalId);
  writer.writeLong(offsets[19], object.visitServerId);
}

FacingsCountModel _facingsCountModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FacingsCountModel();
  object.approvedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.customerCode = reader.readString(offsets[3]);
  object.customerId = reader.readLong(offsets[4]);
  object.customerName = reader.readString(offsets[5]);
  object.id = id;
  object.items =
      reader.readObjectList<FacingsCountItemModel>(
        offsets[8],
        FacingsCountItemModelSchema.deserialize,
        allOffsets,
        FacingsCountItemModel(),
      ) ??
      [];
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[9]);
  object.localId = reader.readString(offsets[10]);
  object.salesAgentId = reader.readLong(offsets[11]);
  object.serverId = reader.readLongOrNull(offsets[12]);
  object.status =
      _FacingsCountModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[13],
      )] ??
      FacingsCountModelStatus.inProgress;
  object.submittedAt = reader.readDateTimeOrNull(offsets[14]);
  object.syncError = reader.readStringOrNull(offsets[15]);
  object.syncState =
      _FacingsCountModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[16],
      )] ??
      FacingsCountSyncState.pending;
  object.updatedAt = reader.readDateTime(offsets[17]);
  object.visitLocalId = reader.readString(offsets[18]);
  object.visitServerId = reader.readLongOrNull(offsets[19]);
  return object;
}

P _facingsCountModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readObjectList<FacingsCountItemModel>(
                offset,
                FacingsCountItemModelSchema.deserialize,
                allOffsets,
                FacingsCountItemModel(),
              ) ??
              [])
          as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (_FacingsCountModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              FacingsCountModelStatus.inProgress)
          as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (_FacingsCountModelsyncStateValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              FacingsCountSyncState.pending)
          as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FacingsCountModelstatusEnumValueMap = {
  r'inProgress': r'inProgress',
  r'submitted': r'submitted',
  r'approved': r'approved',
  r'rejected': r'rejected',
};
const _FacingsCountModelstatusValueEnumMap = {
  r'inProgress': FacingsCountModelStatus.inProgress,
  r'submitted': FacingsCountModelStatus.submitted,
  r'approved': FacingsCountModelStatus.approved,
  r'rejected': FacingsCountModelStatus.rejected,
};
const _FacingsCountModelsyncStateEnumValueMap = {
  r'pending': r'pending',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'failed': r'failed',
};
const _FacingsCountModelsyncStateValueEnumMap = {
  r'pending': FacingsCountSyncState.pending,
  r'syncing': FacingsCountSyncState.syncing,
  r'synced': FacingsCountSyncState.synced,
  r'failed': FacingsCountSyncState.failed,
};

Id _facingsCountModelGetId(FacingsCountModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _facingsCountModelGetLinks(
  FacingsCountModel object,
) {
  return [];
}

void _facingsCountModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  FacingsCountModel object,
) {
  object.id = id;
}

extension FacingsCountModelQueryWhereSort
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QWhere> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhere>
  anyServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhere>
  anyCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'customerId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhere>
  anySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'salesAgentId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhere>
  anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension FacingsCountModelQueryWhere
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QWhereClause> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  serverIdEqualTo(int? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  customerIdEqualTo(int customerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'customerId', value: [customerId]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  salesAgentIdEqualTo(int salesAgentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'salesAgentId',
          value: [salesAgentId],
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  salesAgentIdNotEqualTo(int salesAgentId) {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  salesAgentIdGreaterThan(int salesAgentId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'salesAgentId',
          lower: [salesAgentId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  salesAgentIdLessThan(int salesAgentId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'salesAgentId',
          lower: [],
          upper: [salesAgentId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  salesAgentIdBetween(
    int lowerSalesAgentId,
    int upperSalesAgentId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'salesAgentId',
          lower: [lowerSalesAgentId],
          includeLower: includeLower,
          upper: [upperSalesAgentId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  statusEqualTo(FacingsCountModelStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  statusNotEqualTo(FacingsCountModelStatus status) {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  createdAtGreaterThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [createdAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  createdAtLessThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [],
          upper: [createdAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [lowerCreatedAt],
          includeLower: includeLower,
          upper: [upperCreatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  syncStateEqualTo(FacingsCountSyncState syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncState', value: [syncState]),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterWhereClause>
  syncStateNotEqualTo(FacingsCountSyncState syncState) {
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

extension FacingsCountModelQueryFilter
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QFilterCondition> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  approvedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'approvedAt'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  approvedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'approvedAt'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  approvedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'approvedAt', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  approvedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'approvedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  approvedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'approvedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  approvedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'approvedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  canEditEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'canEdit', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'customerCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'customerCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'customerCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'customerCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'customerCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'customerCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'customerCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'customerCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerCode', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customerCode', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerId', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'customerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'customerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'customerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'customerName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'customerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'customerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'customerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'customerName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerName', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customerName', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  isInProgressEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isInProgress', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  isSubmittedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSubmitted', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'items', length, true, length, true);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'items', 0, true, 0, true);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'items', 0, false, 999999, true);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'items', 0, true, length, include);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'items', length, include, 999999, true);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  salesAgentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'salesAgentId', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  statusEqualTo(FacingsCountModelStatus value, {bool caseSensitive = true}) {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  statusGreaterThan(
    FacingsCountModelStatus value, {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  statusLessThan(
    FacingsCountModelStatus value, {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  statusBetween(
    FacingsCountModelStatus lower,
    FacingsCountModelStatus upper, {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  submittedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'submittedAt'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  submittedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'submittedAt'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  submittedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'submittedAt', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  submittedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'submittedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  submittedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'submittedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  submittedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'submittedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncStateEqualTo(FacingsCountSyncState value, {bool caseSensitive = true}) {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncStateGreaterThan(
    FacingsCountSyncState value, {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncStateLessThan(
    FacingsCountSyncState value, {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncStateBetween(
    FacingsCountSyncState lower,
    FacingsCountSyncState upper, {
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  visitLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  visitLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'visitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  visitServerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visitServerId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  visitServerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visitServerId'),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  visitServerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitServerId', value: value),
      );
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
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
}

extension FacingsCountModelQueryObject
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QFilterCondition> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterFilterCondition>
  itemsElement(FilterQuery<FacingsCountItemModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension FacingsCountModelQueryLinks
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QFilterCondition> {}

extension FacingsCountModelQuerySortBy
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QSortBy> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByApprovedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCanEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCanEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCustomerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCustomerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByIsInProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByIsInProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByIsSubmittedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  sortByVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.desc);
    });
  }
}

extension FacingsCountModelQuerySortThenBy
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QSortThenBy> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByApprovedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCanEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCanEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCustomerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCustomerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByIsInProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByIsInProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByIsSubmittedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.asc);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QAfterSortBy>
  thenByVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.desc);
    });
  }
}

extension FacingsCountModelQueryWhereDistinct
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct> {
  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedAt');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByCanEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canEdit');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByCustomerCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByIsInProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInProgress');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSubmitted');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesAgentId');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedAt');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByVisitLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitLocalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModel, QDistinct>
  distinctByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitServerId');
    });
  }
}

extension FacingsCountModelQueryProperty
    on QueryBuilder<FacingsCountModel, FacingsCountModel, QQueryProperty> {
  QueryBuilder<FacingsCountModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FacingsCountModel, DateTime?, QQueryOperations>
  approvedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedAt');
    });
  }

  QueryBuilder<FacingsCountModel, bool, QQueryOperations> canEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canEdit');
    });
  }

  QueryBuilder<FacingsCountModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FacingsCountModel, String, QQueryOperations>
  customerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerCode');
    });
  }

  QueryBuilder<FacingsCountModel, int, QQueryOperations> customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<FacingsCountModel, String, QQueryOperations>
  customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<FacingsCountModel, bool, QQueryOperations>
  isInProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInProgress');
    });
  }

  QueryBuilder<FacingsCountModel, bool, QQueryOperations>
  isSubmittedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSubmitted');
    });
  }

  QueryBuilder<FacingsCountModel, List<FacingsCountItemModel>, QQueryOperations>
  itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<FacingsCountModel, DateTime?, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<FacingsCountModel, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<FacingsCountModel, int, QQueryOperations>
  salesAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesAgentId');
    });
  }

  QueryBuilder<FacingsCountModel, int?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountModelStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<FacingsCountModel, DateTime?, QQueryOperations>
  submittedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedAt');
    });
  }

  QueryBuilder<FacingsCountModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<FacingsCountModel, FacingsCountSyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<FacingsCountModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<FacingsCountModel, String, QQueryOperations>
  visitLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitLocalId');
    });
  }

  QueryBuilder<FacingsCountModel, int?, QQueryOperations>
  visitServerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitServerId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FacingsCountItemModelSchema = Schema(
  name: r'FacingsCountItemModel',
  id: -3241288395134591471,
  properties: {
    r'itemGroupCode': PropertySchema(
      id: 0,
      name: r'itemGroupCode',
      type: IsarType.string,
    ),
    r'itemGroupId': PropertySchema(
      id: 1,
      name: r'itemGroupId',
      type: IsarType.long,
    ),
    r'itemGroupName': PropertySchema(
      id: 2,
      name: r'itemGroupName',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(id: 3, name: r'quantity', type: IsarType.long),
  },

  estimateSize: _facingsCountItemModelEstimateSize,
  serialize: _facingsCountItemModelSerialize,
  deserialize: _facingsCountItemModelDeserialize,
  deserializeProp: _facingsCountItemModelDeserializeProp,
);

int _facingsCountItemModelEstimateSize(
  FacingsCountItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemGroupCode.length * 3;
  bytesCount += 3 + object.itemGroupName.length * 3;
  return bytesCount;
}

void _facingsCountItemModelSerialize(
  FacingsCountItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.itemGroupCode);
  writer.writeLong(offsets[1], object.itemGroupId);
  writer.writeString(offsets[2], object.itemGroupName);
  writer.writeLong(offsets[3], object.quantity);
}

FacingsCountItemModel _facingsCountItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FacingsCountItemModel();
  object.itemGroupCode = reader.readString(offsets[0]);
  object.itemGroupId = reader.readLong(offsets[1]);
  object.itemGroupName = reader.readString(offsets[2]);
  object.quantity = reader.readLong(offsets[3]);
  return object;
}

P _facingsCountItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FacingsCountItemModelQueryFilter
    on
        QueryBuilder<
          FacingsCountItemModel,
          FacingsCountItemModel,
          QFilterCondition
        > {
  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'itemGroupCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemGroupCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemGroupCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemGroupCode',
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
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'itemGroupCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'itemGroupCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'itemGroupCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'itemGroupCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemGroupCode', value: ''),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'itemGroupCode', value: ''),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemGroupId', value: value),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemGroupId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemGroupId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemGroupId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'itemGroupName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemGroupName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemGroupName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemGroupName',
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
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'itemGroupName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'itemGroupName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'itemGroupName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'itemGroupName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemGroupName', value: ''),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  itemGroupNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'itemGroupName', value: ''),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantity', value: value),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  quantityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  quantityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    FacingsCountItemModel,
    FacingsCountItemModel,
    QAfterFilterCondition
  >
  quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension FacingsCountItemModelQueryObject
    on
        QueryBuilder<
          FacingsCountItemModel,
          FacingsCountItemModel,
          QFilterCondition
        > {}
