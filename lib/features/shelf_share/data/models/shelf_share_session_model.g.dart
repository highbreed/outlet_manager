// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_share_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShelfShareSessionModelCollection on Isar {
  IsarCollection<ShelfShareSessionModel> get shelfShareSessionModels =>
      this.collection();
}

const ShelfShareSessionModelSchema = CollectionSchema(
  name: r'ShelfShareSessionModel',
  id: 646662093707874723,
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
    r'itemGroups': PropertySchema(
      id: 8,
      name: r'itemGroups',
      type: IsarType.objectList,

      target: r'ShelfShareItemGroupModel',
    ),
    r'lastSyncedAt': PropertySchema(
      id: 9,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 10, name: r'localId', type: IsarType.string),
    r'notes': PropertySchema(id: 11, name: r'notes', type: IsarType.string),
    r'salesAgentId': PropertySchema(
      id: 12,
      name: r'salesAgentId',
      type: IsarType.long,
    ),
    r'serverId': PropertySchema(id: 13, name: r'serverId', type: IsarType.long),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.string,
      enumMap: _ShelfShareSessionModelstatusEnumValueMap,
    ),
    r'statusString': PropertySchema(
      id: 15,
      name: r'statusString',
      type: IsarType.string,
    ),
    r'submittedAt': PropertySchema(
      id: 16,
      name: r'submittedAt',
      type: IsarType.dateTime,
    ),
    r'syncError': PropertySchema(
      id: 17,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 18,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _ShelfShareSessionModelsyncStateEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'visitLocalId': PropertySchema(
      id: 20,
      name: r'visitLocalId',
      type: IsarType.string,
    ),
    r'visitServerId': PropertySchema(
      id: 21,
      name: r'visitServerId',
      type: IsarType.long,
    ),
  },

  estimateSize: _shelfShareSessionModelEstimateSize,
  serialize: _shelfShareSessionModelSerialize,
  deserialize: _shelfShareSessionModelDeserialize,
  deserializeProp: _shelfShareSessionModelDeserializeProp,
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
  embeddedSchemas: {
    r'ShelfShareItemGroupModel': ShelfShareItemGroupModelSchema,
    r'ShelfShareBrandEntryModel': ShelfShareBrandEntryModelSchema,
  },

  getId: _shelfShareSessionModelGetId,
  getLinks: _shelfShareSessionModelGetLinks,
  attach: _shelfShareSessionModelAttach,
  version: '3.3.0-dev.1',
);

int _shelfShareSessionModelEstimateSize(
  ShelfShareSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerCode.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.itemGroups.length * 3;
  {
    final offsets = allOffsets[ShelfShareItemGroupModel]!;
    for (var i = 0; i < object.itemGroups.length; i++) {
      final value = object.itemGroups[i];
      bytesCount += ShelfShareItemGroupModelSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.notes;
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
  return bytesCount;
}

void _shelfShareSessionModelSerialize(
  ShelfShareSessionModel object,
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
  writer.writeObjectList<ShelfShareItemGroupModel>(
    offsets[8],
    allOffsets,
    ShelfShareItemGroupModelSchema.serialize,
    object.itemGroups,
  );
  writer.writeDateTime(offsets[9], object.lastSyncedAt);
  writer.writeString(offsets[10], object.localId);
  writer.writeString(offsets[11], object.notes);
  writer.writeLong(offsets[12], object.salesAgentId);
  writer.writeLong(offsets[13], object.serverId);
  writer.writeString(offsets[14], object.status.name);
  writer.writeString(offsets[15], object.statusString);
  writer.writeDateTime(offsets[16], object.submittedAt);
  writer.writeString(offsets[17], object.syncError);
  writer.writeString(offsets[18], object.syncState.name);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeString(offsets[20], object.visitLocalId);
  writer.writeLong(offsets[21], object.visitServerId);
}

ShelfShareSessionModel _shelfShareSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShelfShareSessionModel();
  object.approvedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.customerCode = reader.readString(offsets[3]);
  object.customerId = reader.readLong(offsets[4]);
  object.customerName = reader.readString(offsets[5]);
  object.id = id;
  object.itemGroups =
      reader.readObjectList<ShelfShareItemGroupModel>(
        offsets[8],
        ShelfShareItemGroupModelSchema.deserialize,
        allOffsets,
        ShelfShareItemGroupModel(),
      ) ??
      [];
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[9]);
  object.localId = reader.readString(offsets[10]);
  object.notes = reader.readStringOrNull(offsets[11]);
  object.salesAgentId = reader.readLong(offsets[12]);
  object.serverId = reader.readLongOrNull(offsets[13]);
  object.status =
      _ShelfShareSessionModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[14],
      )] ??
      ShelfShareModelStatus.inProgress;
  object.submittedAt = reader.readDateTimeOrNull(offsets[16]);
  object.syncError = reader.readStringOrNull(offsets[17]);
  object.syncState =
      _ShelfShareSessionModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[18],
      )] ??
      ShelfShareSyncState.pending;
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.visitLocalId = reader.readString(offsets[20]);
  object.visitServerId = reader.readLongOrNull(offsets[21]);
  return object;
}

P _shelfShareSessionModelDeserializeProp<P>(
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
      return (reader.readObjectList<ShelfShareItemGroupModel>(
                offset,
                ShelfShareItemGroupModelSchema.deserialize,
                allOffsets,
                ShelfShareItemGroupModel(),
              ) ??
              [])
          as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (_ShelfShareSessionModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ShelfShareModelStatus.inProgress)
          as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (_ShelfShareSessionModelsyncStateValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              ShelfShareSyncState.pending)
          as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShelfShareSessionModelstatusEnumValueMap = {
  r'inProgress': r'inProgress',
  r'submitted': r'submitted',
  r'approved': r'approved',
  r'rejected': r'rejected',
};
const _ShelfShareSessionModelstatusValueEnumMap = {
  r'inProgress': ShelfShareModelStatus.inProgress,
  r'submitted': ShelfShareModelStatus.submitted,
  r'approved': ShelfShareModelStatus.approved,
  r'rejected': ShelfShareModelStatus.rejected,
};
const _ShelfShareSessionModelsyncStateEnumValueMap = {
  r'pending': r'pending',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'failed': r'failed',
};
const _ShelfShareSessionModelsyncStateValueEnumMap = {
  r'pending': ShelfShareSyncState.pending,
  r'syncing': ShelfShareSyncState.syncing,
  r'synced': ShelfShareSyncState.synced,
  r'failed': ShelfShareSyncState.failed,
};

Id _shelfShareSessionModelGetId(ShelfShareSessionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shelfShareSessionModelGetLinks(
  ShelfShareSessionModel object,
) {
  return [];
}

void _shelfShareSessionModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ShelfShareSessionModel object,
) {
  object.id = id;
}

extension ShelfShareSessionModelQueryWhereSort
    on QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QWhere> {
  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterWhere>
  anyServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverId'),
      );
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterWhere>
  anyCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'customerId'),
      );
    });
  }
}

extension ShelfShareSessionModelQueryWhere
    on
        QueryBuilder<
          ShelfShareSessionModel,
          ShelfShareSessionModel,
          QWhereClause
        > {
  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  serverIdEqualTo(int? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  statusEqualTo(ShelfShareModelStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  statusNotEqualTo(ShelfShareModelStatus status) {
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  syncStateEqualTo(ShelfShareSyncState syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncState', value: [syncState]),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterWhereClause
  >
  syncStateNotEqualTo(ShelfShareSyncState syncState) {
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

extension ShelfShareSessionModelQueryFilter
    on
        QueryBuilder<
          ShelfShareSessionModel,
          ShelfShareSessionModel,
          QFilterCondition
        > {
  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  approvedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'approvedAt'),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  approvedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'approvedAt'),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  approvedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'approvedAt', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  canEditEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'canEdit', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  customerCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerCode', value: ''),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  customerCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customerCode', value: ''),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customerName', value: ''),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customerName', value: ''),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  isInProgressEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isInProgress', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  isSubmittedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSubmitted', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'itemGroups', length, true, length, true);
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'itemGroups', 0, true, 0, true);
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'itemGroups', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'itemGroups', 0, true, length, include);
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'itemGroups', length, include, 999999, true);
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  statusEqualTo(ShelfShareModelStatus value, {bool caseSensitive = true}) {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  statusGreaterThan(
    ShelfShareModelStatus value, {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  statusLessThan(
    ShelfShareModelStatus value, {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  statusBetween(
    ShelfShareModelStatus lower,
    ShelfShareModelStatus upper, {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  submittedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'submittedAt'),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  submittedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'submittedAt'),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  submittedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'submittedAt', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  syncStateEqualTo(ShelfShareSyncState value, {bool caseSensitive = true}) {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  syncStateGreaterThan(
    ShelfShareSyncState value, {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  syncStateLessThan(
    ShelfShareSyncState value, {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  syncStateBetween(
    ShelfShareSyncState lower,
    ShelfShareSyncState upper, {
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
    ShelfShareSessionModel,
    ShelfShareSessionModel,
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
}

extension ShelfShareSessionModelQueryObject
    on
        QueryBuilder<
          ShelfShareSessionModel,
          ShelfShareSessionModel,
          QFilterCondition
        > {
  QueryBuilder<
    ShelfShareSessionModel,
    ShelfShareSessionModel,
    QAfterFilterCondition
  >
  itemGroupsElement(FilterQuery<ShelfShareItemGroupModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'itemGroups');
    });
  }
}

extension ShelfShareSessionModelQueryLinks
    on
        QueryBuilder<
          ShelfShareSessionModel,
          ShelfShareSessionModel,
          QFilterCondition
        > {}

extension ShelfShareSessionModelQuerySortBy
    on QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QSortBy> {
  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByApprovedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCanEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCanEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCustomerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCustomerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByIsInProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByIsInProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByIsSubmittedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByStatusString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByStatusStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  sortByVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.desc);
    });
  }
}

extension ShelfShareSessionModelQuerySortThenBy
    on
        QueryBuilder<
          ShelfShareSessionModel,
          ShelfShareSessionModel,
          QSortThenBy
        > {
  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByApprovedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCanEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCanEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEdit', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCustomerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCustomerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByIsInProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByIsInProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInProgress', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByIsSubmittedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySalesAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByStatusString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByStatusStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusString', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.asc);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QAfterSortBy>
  thenByVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitServerId', Sort.desc);
    });
  }
}

extension ShelfShareSessionModelQueryWhereDistinct
    on QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct> {
  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByApprovedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByCanEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canEdit');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByCustomerCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByIsInProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInProgress');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSubmitted');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctBySalesAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesAgentId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByStatusString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByVisitLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitLocalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSessionModel, QDistinct>
  distinctByVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitServerId');
    });
  }
}

extension ShelfShareSessionModelQueryProperty
    on
        QueryBuilder<
          ShelfShareSessionModel,
          ShelfShareSessionModel,
          QQueryProperty
        > {
  QueryBuilder<ShelfShareSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShelfShareSessionModel, DateTime?, QQueryOperations>
  approvedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, bool, QQueryOperations>
  canEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canEdit');
    });
  }

  QueryBuilder<ShelfShareSessionModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String, QQueryOperations>
  customerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerCode');
    });
  }

  QueryBuilder<ShelfShareSessionModel, int, QQueryOperations>
  customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String, QQueryOperations>
  customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<ShelfShareSessionModel, bool, QQueryOperations>
  isInProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInProgress');
    });
  }

  QueryBuilder<ShelfShareSessionModel, bool, QQueryOperations>
  isSubmittedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSubmitted');
    });
  }

  QueryBuilder<
    ShelfShareSessionModel,
    List<ShelfShareItemGroupModel>,
    QQueryOperations
  >
  itemGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemGroups');
    });
  }

  QueryBuilder<ShelfShareSessionModel, DateTime?, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String?, QQueryOperations>
  notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<ShelfShareSessionModel, int, QQueryOperations>
  salesAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesAgentId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, int?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareModelStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String, QQueryOperations>
  statusStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusString');
    });
  }

  QueryBuilder<ShelfShareSessionModel, DateTime?, QQueryOperations>
  submittedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<ShelfShareSessionModel, ShelfShareSyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<ShelfShareSessionModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ShelfShareSessionModel, String, QQueryOperations>
  visitLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitLocalId');
    });
  }

  QueryBuilder<ShelfShareSessionModel, int?, QQueryOperations>
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

const ShelfShareBrandEntryModelSchema = Schema(
  name: r'ShelfShareBrandEntryModel',
  id: -6340185845798526535,
  properties: {
    r'brandId': PropertySchema(id: 0, name: r'brandId', type: IsarType.long),
    r'brandName': PropertySchema(
      id: 1,
      name: r'brandName',
      type: IsarType.string,
    ),
    r'facings': PropertySchema(id: 2, name: r'facings', type: IsarType.long),
    r'notes': PropertySchema(id: 3, name: r'notes', type: IsarType.string),
  },

  estimateSize: _shelfShareBrandEntryModelEstimateSize,
  serialize: _shelfShareBrandEntryModelSerialize,
  deserialize: _shelfShareBrandEntryModelDeserialize,
  deserializeProp: _shelfShareBrandEntryModelDeserializeProp,
);

int _shelfShareBrandEntryModelEstimateSize(
  ShelfShareBrandEntryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brandName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _shelfShareBrandEntryModelSerialize(
  ShelfShareBrandEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.brandId);
  writer.writeString(offsets[1], object.brandName);
  writer.writeLong(offsets[2], object.facings);
  writer.writeString(offsets[3], object.notes);
}

ShelfShareBrandEntryModel _shelfShareBrandEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShelfShareBrandEntryModel();
  object.brandId = reader.readLong(offsets[0]);
  object.brandName = reader.readString(offsets[1]);
  object.facings = reader.readLong(offsets[2]);
  object.notes = reader.readStringOrNull(offsets[3]);
  return object;
}

P _shelfShareBrandEntryModelDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ShelfShareBrandEntryModelQueryFilter
    on
        QueryBuilder<
          ShelfShareBrandEntryModel,
          ShelfShareBrandEntryModel,
          QFilterCondition
        > {
  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  brandIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandId', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  brandNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandName', value: ''),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  brandNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandName', value: ''),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  facingsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'facings', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  facingsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'facings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  facingsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'facings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  facingsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'facings',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
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
    ShelfShareBrandEntryModel,
    ShelfShareBrandEntryModel,
    QAfterFilterCondition
  >
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }
}

extension ShelfShareBrandEntryModelQueryObject
    on
        QueryBuilder<
          ShelfShareBrandEntryModel,
          ShelfShareBrandEntryModel,
          QFilterCondition
        > {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ShelfShareItemGroupModelSchema = Schema(
  name: r'ShelfShareItemGroupModel',
  id: 3637258790198596946,
  properties: {
    r'brandEntries': PropertySchema(
      id: 0,
      name: r'brandEntries',
      type: IsarType.objectList,

      target: r'ShelfShareBrandEntryModel',
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
    r'totalFacings': PropertySchema(
      id: 3,
      name: r'totalFacings',
      type: IsarType.long,
    ),
  },

  estimateSize: _shelfShareItemGroupModelEstimateSize,
  serialize: _shelfShareItemGroupModelSerialize,
  deserialize: _shelfShareItemGroupModelDeserialize,
  deserializeProp: _shelfShareItemGroupModelDeserializeProp,
);

int _shelfShareItemGroupModelEstimateSize(
  ShelfShareItemGroupModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brandEntries.length * 3;
  {
    final offsets = allOffsets[ShelfShareBrandEntryModel]!;
    for (var i = 0; i < object.brandEntries.length; i++) {
      final value = object.brandEntries[i];
      bytesCount += ShelfShareBrandEntryModelSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.itemGroupName.length * 3;
  return bytesCount;
}

void _shelfShareItemGroupModelSerialize(
  ShelfShareItemGroupModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ShelfShareBrandEntryModel>(
    offsets[0],
    allOffsets,
    ShelfShareBrandEntryModelSchema.serialize,
    object.brandEntries,
  );
  writer.writeLong(offsets[1], object.itemGroupId);
  writer.writeString(offsets[2], object.itemGroupName);
  writer.writeLong(offsets[3], object.totalFacings);
}

ShelfShareItemGroupModel _shelfShareItemGroupModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShelfShareItemGroupModel();
  object.brandEntries =
      reader.readObjectList<ShelfShareBrandEntryModel>(
        offsets[0],
        ShelfShareBrandEntryModelSchema.deserialize,
        allOffsets,
        ShelfShareBrandEntryModel(),
      ) ??
      [];
  object.itemGroupId = reader.readLong(offsets[1]);
  object.itemGroupName = reader.readString(offsets[2]);
  return object;
}

P _shelfShareItemGroupModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<ShelfShareBrandEntryModel>(
                offset,
                ShelfShareBrandEntryModelSchema.deserialize,
                allOffsets,
                ShelfShareBrandEntryModel(),
              ) ??
              [])
          as P;
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

extension ShelfShareItemGroupModelQueryFilter
    on
        QueryBuilder<
          ShelfShareItemGroupModel,
          ShelfShareItemGroupModel,
          QFilterCondition
        > {
  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandEntries', length, true, length, true);
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandEntries', 0, true, 0, true);
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandEntries', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandEntries', 0, true, length, include);
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'brandEntries', length, include, 999999, true);
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'brandEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
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
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  totalFacingsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalFacings', value: value),
      );
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  totalFacingsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalFacings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  totalFacingsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalFacings',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  totalFacingsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalFacings',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ShelfShareItemGroupModelQueryObject
    on
        QueryBuilder<
          ShelfShareItemGroupModel,
          ShelfShareItemGroupModel,
          QFilterCondition
        > {
  QueryBuilder<
    ShelfShareItemGroupModel,
    ShelfShareItemGroupModel,
    QAfterFilterCondition
  >
  brandEntriesElement(FilterQuery<ShelfShareBrandEntryModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'brandEntries');
    });
  }
}
