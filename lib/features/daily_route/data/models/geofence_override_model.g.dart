// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_override_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGeofenceOverrideModelCollection on Isar {
  IsarCollection<GeofenceOverrideModel> get geofenceOverrideModels =>
      this.collection();
}

const GeofenceOverrideModelSchema = CollectionSchema(
  name: r'GeofenceOverrideModel',
  id: -8496373477811929907,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'decidedAt': PropertySchema(
      id: 1,
      name: r'decidedAt',
      type: IsarType.dateTime,
    ),
    r'decidedByName': PropertySchema(
      id: 2,
      name: r'decidedByName',
      type: IsarType.string,
    ),
    r'decidedByUserId': PropertySchema(
      id: 3,
      name: r'decidedByUserId',
      type: IsarType.string,
    ),
    r'decisionNotes': PropertySchema(
      id: 4,
      name: r'decisionNotes',
      type: IsarType.string,
    ),
    r'distanceFromOutlet': PropertySchema(
      id: 5,
      name: r'distanceFromOutlet',
      type: IsarType.double,
    ),
    r'expiresAt': PropertySchema(
      id: 6,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 7, name: r'localId', type: IsarType.string),
    r'outletCode': PropertySchema(
      id: 8,
      name: r'outletCode',
      type: IsarType.string,
    ),
    r'outletName': PropertySchema(
      id: 9,
      name: r'outletName',
      type: IsarType.string,
    ),
    r'outletVisitLocalId': PropertySchema(
      id: 10,
      name: r'outletVisitLocalId',
      type: IsarType.string,
    ),
    r'outletVisitServerId': PropertySchema(
      id: 11,
      name: r'outletVisitServerId',
      type: IsarType.string,
    ),
    r'reason': PropertySchema(id: 12, name: r'reason', type: IsarType.string),
    r'requestAccuracyMeters': PropertySchema(
      id: 13,
      name: r'requestAccuracyMeters',
      type: IsarType.double,
    ),
    r'requestLatitude': PropertySchema(
      id: 14,
      name: r'requestLatitude',
      type: IsarType.double,
    ),
    r'requestLongitude': PropertySchema(
      id: 15,
      name: r'requestLongitude',
      type: IsarType.double,
    ),
    r'requestedAt': PropertySchema(
      id: 16,
      name: r'requestedAt',
      type: IsarType.dateTime,
    ),
    r'requestedByName': PropertySchema(
      id: 17,
      name: r'requestedByName',
      type: IsarType.string,
    ),
    r'requestedByUserId': PropertySchema(
      id: 18,
      name: r'requestedByUserId',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 19,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 20,
      name: r'status',
      type: IsarType.string,
      enumMap: _GeofenceOverrideModelstatusEnumValueMap,
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
      enumMap: _GeofenceOverrideModelsyncStateEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 23,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _geofenceOverrideModelEstimateSize,
  serialize: _geofenceOverrideModelSerialize,
  deserialize: _geofenceOverrideModelDeserialize,
  deserializeProp: _geofenceOverrideModelDeserializeProp,
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
    r'outletVisitLocalId': IndexSchema(
      id: -287026068802137180,
      name: r'outletVisitLocalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'outletVisitLocalId',
          type: IndexType.hash,
          caseSensitive: true,
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
  },
  links: {},
  embeddedSchemas: {},

  getId: _geofenceOverrideModelGetId,
  getLinks: _geofenceOverrideModelGetLinks,
  attach: _geofenceOverrideModelAttach,
  version: '3.3.0-dev.1',
);

int _geofenceOverrideModelEstimateSize(
  GeofenceOverrideModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.decidedByName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.decidedByUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.decisionNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.outletCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.outletName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.outletVisitLocalId.length * 3;
  {
    final value = object.outletVisitServerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.reason.length * 3;
  {
    final value = object.requestedByName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.requestedByUserId.length * 3;
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

void _geofenceOverrideModelSerialize(
  GeofenceOverrideModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.decidedAt);
  writer.writeString(offsets[2], object.decidedByName);
  writer.writeString(offsets[3], object.decidedByUserId);
  writer.writeString(offsets[4], object.decisionNotes);
  writer.writeDouble(offsets[5], object.distanceFromOutlet);
  writer.writeDateTime(offsets[6], object.expiresAt);
  writer.writeString(offsets[7], object.localId);
  writer.writeString(offsets[8], object.outletCode);
  writer.writeString(offsets[9], object.outletName);
  writer.writeString(offsets[10], object.outletVisitLocalId);
  writer.writeString(offsets[11], object.outletVisitServerId);
  writer.writeString(offsets[12], object.reason);
  writer.writeDouble(offsets[13], object.requestAccuracyMeters);
  writer.writeDouble(offsets[14], object.requestLatitude);
  writer.writeDouble(offsets[15], object.requestLongitude);
  writer.writeDateTime(offsets[16], object.requestedAt);
  writer.writeString(offsets[17], object.requestedByName);
  writer.writeString(offsets[18], object.requestedByUserId);
  writer.writeString(offsets[19], object.serverId);
  writer.writeString(offsets[20], object.status.name);
  writer.writeString(offsets[21], object.syncError);
  writer.writeString(offsets[22], object.syncState.name);
  writer.writeDateTime(offsets[23], object.updatedAt);
}

GeofenceOverrideModel _geofenceOverrideModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeofenceOverrideModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.decidedAt = reader.readDateTimeOrNull(offsets[1]);
  object.decidedByName = reader.readStringOrNull(offsets[2]);
  object.decidedByUserId = reader.readStringOrNull(offsets[3]);
  object.decisionNotes = reader.readStringOrNull(offsets[4]);
  object.distanceFromOutlet = reader.readDouble(offsets[5]);
  object.expiresAt = reader.readDateTime(offsets[6]);
  object.id = id;
  object.localId = reader.readString(offsets[7]);
  object.outletCode = reader.readStringOrNull(offsets[8]);
  object.outletName = reader.readStringOrNull(offsets[9]);
  object.outletVisitLocalId = reader.readString(offsets[10]);
  object.outletVisitServerId = reader.readStringOrNull(offsets[11]);
  object.reason = reader.readString(offsets[12]);
  object.requestAccuracyMeters = reader.readDouble(offsets[13]);
  object.requestLatitude = reader.readDouble(offsets[14]);
  object.requestLongitude = reader.readDouble(offsets[15]);
  object.requestedAt = reader.readDateTime(offsets[16]);
  object.requestedByName = reader.readStringOrNull(offsets[17]);
  object.requestedByUserId = reader.readString(offsets[18]);
  object.serverId = reader.readStringOrNull(offsets[19]);
  object.status =
      _GeofenceOverrideModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[20],
      )] ??
      GeofenceOverrideStatusModel.pending;
  object.syncError = reader.readStringOrNull(offsets[21]);
  object.syncState =
      _GeofenceOverrideModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[22],
      )] ??
      SyncStateModel.localOnly;
  object.updatedAt = reader.readDateTime(offsets[23]);
  return object;
}

P _geofenceOverrideModelDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (_GeofenceOverrideModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              GeofenceOverrideStatusModel.pending)
          as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (_GeofenceOverrideModelsyncStateValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              SyncStateModel.localOnly)
          as P;
    case 23:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GeofenceOverrideModelstatusEnumValueMap = {
  r'pending': r'pending',
  r'approved': r'approved',
  r'rejected': r'rejected',
  r'expired': r'expired',
};
const _GeofenceOverrideModelstatusValueEnumMap = {
  r'pending': GeofenceOverrideStatusModel.pending,
  r'approved': GeofenceOverrideStatusModel.approved,
  r'rejected': GeofenceOverrideStatusModel.rejected,
  r'expired': GeofenceOverrideStatusModel.expired,
};
const _GeofenceOverrideModelsyncStateEnumValueMap = {
  r'localOnly': r'localOnly',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'syncFailed': r'syncFailed',
  r'needsAttention': r'needsAttention',
};
const _GeofenceOverrideModelsyncStateValueEnumMap = {
  r'localOnly': SyncStateModel.localOnly,
  r'syncing': SyncStateModel.syncing,
  r'synced': SyncStateModel.synced,
  r'syncFailed': SyncStateModel.syncFailed,
  r'needsAttention': SyncStateModel.needsAttention,
};

Id _geofenceOverrideModelGetId(GeofenceOverrideModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _geofenceOverrideModelGetLinks(
  GeofenceOverrideModel object,
) {
  return [];
}

void _geofenceOverrideModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  GeofenceOverrideModel object,
) {
  object.id = id;
}

extension GeofenceOverrideModelByIndex
    on IsarCollection<GeofenceOverrideModel> {
  Future<GeofenceOverrideModel?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  GeofenceOverrideModel? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<GeofenceOverrideModel?>> getAllByLocalId(
    List<String> localIdValues,
  ) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<GeofenceOverrideModel?> getAllByLocalIdSync(List<String> localIdValues) {
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

  Future<Id> putByLocalId(GeofenceOverrideModel object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(GeofenceOverrideModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<GeofenceOverrideModel> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(
    List<GeofenceOverrideModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }
}

extension GeofenceOverrideModelQueryWhereSort
    on QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QWhere> {
  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GeofenceOverrideModelQueryWhere
    on
        QueryBuilder<
          GeofenceOverrideModel,
          GeofenceOverrideModel,
          QWhereClause
        > {
  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
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

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
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

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
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

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
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

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
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

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  outletVisitLocalIdEqualTo(String outletVisitLocalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'outletVisitLocalId',
          value: [outletVisitLocalId],
        ),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  outletVisitLocalIdNotEqualTo(String outletVisitLocalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletVisitLocalId',
                lower: [],
                upper: [outletVisitLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletVisitLocalId',
                lower: [outletVisitLocalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletVisitLocalId',
                lower: [outletVisitLocalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletVisitLocalId',
                lower: [],
                upper: [outletVisitLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  statusEqualTo(GeofenceOverrideStatusModel status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterWhereClause>
  statusNotEqualTo(GeofenceOverrideStatusModel status) {
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
}

extension GeofenceOverrideModelQueryFilter
    on
        QueryBuilder<
          GeofenceOverrideModel,
          GeofenceOverrideModel,
          QFilterCondition
        > {
  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'decidedAt'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'decidedAt'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'decidedAt', value: value),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'decidedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'decidedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'decidedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'decidedByName'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'decidedByName'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'decidedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'decidedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'decidedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'decidedByName',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'decidedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'decidedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'decidedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'decidedByName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'decidedByName', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'decidedByName', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'decidedByUserId'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'decidedByUserId'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'decidedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'decidedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'decidedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'decidedByUserId',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'decidedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'decidedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'decidedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'decidedByUserId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'decidedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decidedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'decidedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'decisionNotes'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'decisionNotes'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'decisionNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'decisionNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'decisionNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'decisionNotes',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'decisionNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'decisionNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'decisionNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'decisionNotes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'decisionNotes', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  decisionNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'decisionNotes', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  distanceFromOutletEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'distanceFromOutlet',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  distanceFromOutletGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'distanceFromOutlet',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  distanceFromOutletLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'distanceFromOutlet',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  distanceFromOutletBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'distanceFromOutlet',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  expiresAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'expiresAt', value: value),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  expiresAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expiresAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  expiresAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expiresAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  expiresAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expiresAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'outletCode'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'outletCode'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletCodeEqualTo(String? value, {bool caseSensitive = true}) {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletCodeGreaterThan(
    String? value, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletCodeLessThan(
    String? value, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletCodeBetween(
    String? lower,
    String? upper, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'outletName'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'outletName'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletNameEqualTo(String? value, {bool caseSensitive = true}) {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletNameGreaterThan(
    String? value, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletNameLessThan(
    String? value, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletNameBetween(
    String? lower,
    String? upper, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletVisitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletVisitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletVisitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletVisitLocalId',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletVisitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletVisitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletVisitLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletVisitLocalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletVisitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletVisitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'outletVisitServerId'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'outletVisitServerId'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletVisitServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletVisitServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletVisitServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletVisitServerId',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletVisitServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletVisitServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletVisitServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletVisitServerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletVisitServerId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  outletVisitServerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'outletVisitServerId',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reason',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestAccuracyMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestAccuracyMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestAccuracyMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestAccuracyMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestAccuracyMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLatitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLatitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLatitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLatitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestLatitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLongitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLongitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLongitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestLongitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestLongitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requestedAt', value: value),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'requestedByName'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'requestedByName'),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestedByName',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'requestedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'requestedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'requestedByName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'requestedByName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requestedByName', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'requestedByName', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestedByUserId',
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'requestedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'requestedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'requestedByUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'requestedByUserId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requestedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  requestedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'requestedByUserId', value: ''),
      );
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  statusEqualTo(
    GeofenceOverrideStatusModel value, {
    bool caseSensitive = true,
  }) {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  statusGreaterThan(
    GeofenceOverrideStatusModel value, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  statusLessThan(
    GeofenceOverrideStatusModel value, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
  statusBetween(
    GeofenceOverrideStatusModel lower,
    GeofenceOverrideStatusModel upper, {
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
    GeofenceOverrideModel,
    GeofenceOverrideModel,
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
}

extension GeofenceOverrideModelQueryObject
    on
        QueryBuilder<
          GeofenceOverrideModel,
          GeofenceOverrideModel,
          QFilterCondition
        > {}

extension GeofenceOverrideModelQueryLinks
    on
        QueryBuilder<
          GeofenceOverrideModel,
          GeofenceOverrideModel,
          QFilterCondition
        > {}

extension GeofenceOverrideModelQuerySortBy
    on QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QSortBy> {
  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecidedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecidedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByName', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecidedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByName', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecidedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByUserId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecidedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByUserId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecisionNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionNotes', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDecisionNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionNotes', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDistanceFromOutlet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceFromOutlet', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByDistanceFromOutletDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceFromOutlet', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitLocalId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitLocalId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitServerId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByOutletVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitServerId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestAccuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestAccuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLatitude', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLatitude', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLongitude', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLongitude', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByName', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByName', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByUserId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByRequestedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByUserId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GeofenceOverrideModelQuerySortThenBy
    on QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QSortThenBy> {
  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecidedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecidedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByName', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecidedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByName', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecidedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByUserId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecidedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decidedByUserId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecisionNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionNotes', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDecisionNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionNotes', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDistanceFromOutlet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceFromOutlet', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByDistanceFromOutletDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceFromOutlet', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitLocalId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitLocalId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletVisitServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitServerId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByOutletVisitServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletVisitServerId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestAccuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestAccuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLatitude', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLatitude', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLongitude', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestLongitude', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedAt', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByName', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByName', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByUserId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByRequestedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedByUserId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GeofenceOverrideModelQueryWhereDistinct
    on QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct> {
  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByDecidedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'decidedAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByDecidedByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'decidedByName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByDecidedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'decidedByUserId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByDecisionNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'decisionNotes',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByDistanceFromOutlet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceFromOutlet');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByOutletCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByOutletName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByOutletVisitLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'outletVisitLocalId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByOutletVisitServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'outletVisitServerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByRequestAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestAccuracyMeters');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByRequestLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestLatitude');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByRequestLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestLongitude');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByRequestedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestedAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByRequestedByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'requestedByName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByRequestedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'requestedByUserId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeofenceOverrideModel, GeofenceOverrideModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension GeofenceOverrideModelQueryProperty
    on
        QueryBuilder<
          GeofenceOverrideModel,
          GeofenceOverrideModel,
          QQueryProperty
        > {
  QueryBuilder<GeofenceOverrideModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GeofenceOverrideModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, DateTime?, QQueryOperations>
  decidedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decidedAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  decidedByNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decidedByName');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  decidedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decidedByUserId');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  decisionNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decisionNotes');
    });
  }

  QueryBuilder<GeofenceOverrideModel, double, QQueryOperations>
  distanceFromOutletProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceFromOutlet');
    });
  }

  QueryBuilder<GeofenceOverrideModel, DateTime, QQueryOperations>
  expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  outletCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletCode');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  outletNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletName');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String, QQueryOperations>
  outletVisitLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletVisitLocalId');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  outletVisitServerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletVisitServerId');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String, QQueryOperations>
  reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<GeofenceOverrideModel, double, QQueryOperations>
  requestAccuracyMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestAccuracyMeters');
    });
  }

  QueryBuilder<GeofenceOverrideModel, double, QQueryOperations>
  requestLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestLatitude');
    });
  }

  QueryBuilder<GeofenceOverrideModel, double, QQueryOperations>
  requestLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestLongitude');
    });
  }

  QueryBuilder<GeofenceOverrideModel, DateTime, QQueryOperations>
  requestedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestedAt');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  requestedByNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestedByName');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String, QQueryOperations>
  requestedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestedByUserId');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<
    GeofenceOverrideModel,
    GeofenceOverrideStatusModel,
    QQueryOperations
  >
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<GeofenceOverrideModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<GeofenceOverrideModel, SyncStateModel, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<GeofenceOverrideModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
