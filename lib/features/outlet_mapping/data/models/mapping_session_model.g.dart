// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapping_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMappingSessionModelCollection on Isar {
  IsarCollection<MappingSessionModel> get mappingSessionModels =>
      this.collection();
}

const MappingSessionModelSchema = CollectionSchema(
  name: r'MappingSessionModel',
  id: -8302537946292067558,
  properties: {
    r'captureFinishedLocalAt': PropertySchema(
      id: 0,
      name: r'captureFinishedLocalAt',
      type: IsarType.dateTime,
    ),
    r'configVersion': PropertySchema(
      id: 1,
      name: r'configVersion',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'failureCode': PropertySchema(
      id: 3,
      name: r'failureCode',
      type: IsarType.string,
      enumMap: _MappingSessionModelfailureCodeEnumValueMap,
    ),
    r'failureMessage': PropertySchema(
      id: 4,
      name: r'failureMessage',
      type: IsarType.string,
    ),
    r'footprintId': PropertySchema(
      id: 5,
      name: r'footprintId',
      type: IsarType.long,
    ),
    r'lastKnownServerTotalSamples': PropertySchema(
      id: 6,
      name: r'lastKnownServerTotalSamples',
      type: IsarType.long,
    ),
    r'lastSampleAt': PropertySchema(
      id: 7,
      name: r'lastSampleAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 8, name: r'localId', type: IsarType.string),
    r'localState': PropertySchema(
      id: 9,
      name: r'localState',
      type: IsarType.string,
      enumMap: _MappingSessionModellocalStateEnumValueMap,
    ),
    r'mappingRequestId': PropertySchema(
      id: 10,
      name: r'mappingRequestId',
      type: IsarType.long,
    ),
    r'maxBatch': PropertySchema(id: 11, name: r'maxBatch', type: IsarType.long),
    r'maxSamples': PropertySchema(
      id: 12,
      name: r'maxSamples',
      type: IsarType.long,
    ),
    r'minDurationSeconds': PropertySchema(
      id: 13,
      name: r'minDurationSeconds',
      type: IsarType.double,
    ),
    r'minSamples': PropertySchema(
      id: 14,
      name: r'minSamples',
      type: IsarType.long,
    ),
    r'nextSequence': PropertySchema(
      id: 15,
      name: r'nextSequence',
      type: IsarType.long,
    ),
    r'outletCode': PropertySchema(
      id: 16,
      name: r'outletCode',
      type: IsarType.string,
    ),
    r'outletId': PropertySchema(
      id: 17,
      name: r'outletId',
      type: IsarType.string,
    ),
    r'outletName': PropertySchema(
      id: 18,
      name: r'outletName',
      type: IsarType.string,
    ),
    r'ownerUserId': PropertySchema(
      id: 19,
      name: r'ownerUserId',
      type: IsarType.string,
    ),
    r'preMappingDistanceFilter': PropertySchema(
      id: 20,
      name: r'preMappingDistanceFilter',
      type: IsarType.double,
    ),
    r'preMappingExtrasJson': PropertySchema(
      id: 21,
      name: r'preMappingExtrasJson',
      type: IsarType.string,
    ),
    r'preMappingHeartbeatInterval': PropertySchema(
      id: 22,
      name: r'preMappingHeartbeatInterval',
      type: IsarType.double,
    ),
    r'recommendedIntervalMs': PropertySchema(
      id: 23,
      name: r'recommendedIntervalMs',
      type: IsarType.long,
    ),
    r'serverTimeAtStart': PropertySchema(
      id: 24,
      name: r'serverTimeAtStart',
      type: IsarType.dateTime,
    ),
    r'startedAt': PropertySchema(
      id: 25,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 26,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'visitLocalId': PropertySchema(
      id: 27,
      name: r'visitLocalId',
      type: IsarType.string,
    ),
  },

  estimateSize: _mappingSessionModelEstimateSize,
  serialize: _mappingSessionModelSerialize,
  deserialize: _mappingSessionModelDeserialize,
  deserializeProp: _mappingSessionModelDeserializeProp,
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
    r'footprintId': IndexSchema(
      id: -3287874153404473661,
      name: r'footprintId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'footprintId',
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
    r'ownerUserId': IndexSchema(
      id: 1631799950038639233,
      name: r'ownerUserId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ownerUserId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'localState': IndexSchema(
      id: 5127451679316564062,
      name: r'localState',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'localState',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _mappingSessionModelGetId,
  getLinks: _mappingSessionModelGetLinks,
  attach: _mappingSessionModelAttach,
  version: '3.3.2',
);

int _mappingSessionModelEstimateSize(
  MappingSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.failureCode;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.failureMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.localState.name.length * 3;
  bytesCount += 3 + object.outletCode.length * 3;
  bytesCount += 3 + object.outletId.length * 3;
  bytesCount += 3 + object.outletName.length * 3;
  bytesCount += 3 + object.ownerUserId.length * 3;
  {
    final value = object.preMappingExtrasJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.visitLocalId.length * 3;
  return bytesCount;
}

void _mappingSessionModelSerialize(
  MappingSessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.captureFinishedLocalAt);
  writer.writeLong(offsets[1], object.configVersion);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.failureCode?.name);
  writer.writeString(offsets[4], object.failureMessage);
  writer.writeLong(offsets[5], object.footprintId);
  writer.writeLong(offsets[6], object.lastKnownServerTotalSamples);
  writer.writeDateTime(offsets[7], object.lastSampleAt);
  writer.writeString(offsets[8], object.localId);
  writer.writeString(offsets[9], object.localState.name);
  writer.writeLong(offsets[10], object.mappingRequestId);
  writer.writeLong(offsets[11], object.maxBatch);
  writer.writeLong(offsets[12], object.maxSamples);
  writer.writeDouble(offsets[13], object.minDurationSeconds);
  writer.writeLong(offsets[14], object.minSamples);
  writer.writeLong(offsets[15], object.nextSequence);
  writer.writeString(offsets[16], object.outletCode);
  writer.writeString(offsets[17], object.outletId);
  writer.writeString(offsets[18], object.outletName);
  writer.writeString(offsets[19], object.ownerUserId);
  writer.writeDouble(offsets[20], object.preMappingDistanceFilter);
  writer.writeString(offsets[21], object.preMappingExtrasJson);
  writer.writeDouble(offsets[22], object.preMappingHeartbeatInterval);
  writer.writeLong(offsets[23], object.recommendedIntervalMs);
  writer.writeDateTime(offsets[24], object.serverTimeAtStart);
  writer.writeDateTime(offsets[25], object.startedAt);
  writer.writeDateTime(offsets[26], object.updatedAt);
  writer.writeString(offsets[27], object.visitLocalId);
}

MappingSessionModel _mappingSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MappingSessionModel();
  object.captureFinishedLocalAt = reader.readDateTimeOrNull(offsets[0]);
  object.configVersion = reader.readLong(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.failureCode =
      _MappingSessionModelfailureCodeValueEnumMap[reader.readStringOrNull(
        offsets[3],
      )];
  object.failureMessage = reader.readStringOrNull(offsets[4]);
  object.footprintId = reader.readLong(offsets[5]);
  object.id = id;
  object.lastKnownServerTotalSamples = reader.readLongOrNull(offsets[6]);
  object.lastSampleAt = reader.readDateTimeOrNull(offsets[7]);
  object.localId = reader.readString(offsets[8]);
  object.localState =
      _MappingSessionModellocalStateValueEnumMap[reader.readStringOrNull(
        offsets[9],
      )] ??
      MappingLocalStateModel.idle;
  object.mappingRequestId = reader.readLong(offsets[10]);
  object.maxBatch = reader.readLong(offsets[11]);
  object.maxSamples = reader.readLong(offsets[12]);
  object.minDurationSeconds = reader.readDouble(offsets[13]);
  object.minSamples = reader.readLong(offsets[14]);
  object.nextSequence = reader.readLong(offsets[15]);
  object.outletCode = reader.readString(offsets[16]);
  object.outletId = reader.readString(offsets[17]);
  object.outletName = reader.readString(offsets[18]);
  object.ownerUserId = reader.readString(offsets[19]);
  object.preMappingDistanceFilter = reader.readDouble(offsets[20]);
  object.preMappingExtrasJson = reader.readStringOrNull(offsets[21]);
  object.preMappingHeartbeatInterval = reader.readDouble(offsets[22]);
  object.recommendedIntervalMs = reader.readLongOrNull(offsets[23]);
  object.serverTimeAtStart = reader.readDateTimeOrNull(offsets[24]);
  object.startedAt = reader.readDateTime(offsets[25]);
  object.updatedAt = reader.readDateTime(offsets[26]);
  object.visitLocalId = reader.readString(offsets[27]);
  return object;
}

P _mappingSessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (_MappingSessionModelfailureCodeValueEnumMap[reader
              .readStringOrNull(offset)])
          as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (_MappingSessionModellocalStateValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              MappingLocalStateModel.idle)
          as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    case 26:
      return (reader.readDateTime(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MappingSessionModelfailureCodeEnumValueMap = {
  r'mockLocationExcessive': r'mockLocationExcessive',
  r'insufficientSamples': r'insufficientSamples',
  r'captureTooShort': r'captureTooShort',
  r'poorGpsQuality': r'poorGpsQuality',
  r'degenerateGeometry': r'degenerateGeometry',
  r'areaTooLarge': r'areaTooLarge',
};
const _MappingSessionModelfailureCodeValueEnumMap = {
  r'mockLocationExcessive': MappingFailureCodeModel.mockLocationExcessive,
  r'insufficientSamples': MappingFailureCodeModel.insufficientSamples,
  r'captureTooShort': MappingFailureCodeModel.captureTooShort,
  r'poorGpsQuality': MappingFailureCodeModel.poorGpsQuality,
  r'degenerateGeometry': MappingFailureCodeModel.degenerateGeometry,
  r'areaTooLarge': MappingFailureCodeModel.areaTooLarge,
};
const _MappingSessionModellocalStateEnumValueMap = {
  r'idle': r'idle',
  r'preparing': r'preparing',
  r'capturing': r'capturing',
  r'captureFinishedLocal': r'captureFinishedLocal',
  r'uploadPending': r'uploadPending',
  r'submitting': r'submitting',
  r'finishResultUnknown': r'finishResultUnknown',
  r'pendingReview': r'pendingReview',
  r'captureFailed': r'captureFailed',
  r'abandoning': r'abandoning',
  r'abandoned': r'abandoned',
  r'cancelled': r'cancelled',
};
const _MappingSessionModellocalStateValueEnumMap = {
  r'idle': MappingLocalStateModel.idle,
  r'preparing': MappingLocalStateModel.preparing,
  r'capturing': MappingLocalStateModel.capturing,
  r'captureFinishedLocal': MappingLocalStateModel.captureFinishedLocal,
  r'uploadPending': MappingLocalStateModel.uploadPending,
  r'submitting': MappingLocalStateModel.submitting,
  r'finishResultUnknown': MappingLocalStateModel.finishResultUnknown,
  r'pendingReview': MappingLocalStateModel.pendingReview,
  r'captureFailed': MappingLocalStateModel.captureFailed,
  r'abandoning': MappingLocalStateModel.abandoning,
  r'abandoned': MappingLocalStateModel.abandoned,
  r'cancelled': MappingLocalStateModel.cancelled,
};

Id _mappingSessionModelGetId(MappingSessionModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _mappingSessionModelGetLinks(
  MappingSessionModel object,
) {
  return [];
}

void _mappingSessionModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  MappingSessionModel object,
) {
  object.id = id;
}

extension MappingSessionModelByIndex on IsarCollection<MappingSessionModel> {
  Future<MappingSessionModel?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  MappingSessionModel? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<MappingSessionModel?>> getAllByLocalId(
    List<String> localIdValues,
  ) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<MappingSessionModel?> getAllByLocalIdSync(List<String> localIdValues) {
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

  Future<Id> putByLocalId(MappingSessionModel object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(MappingSessionModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<MappingSessionModel> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(
    List<MappingSessionModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }
}

extension MappingSessionModelQueryWhereSort
    on QueryBuilder<MappingSessionModel, MappingSessionModel, QWhere> {
  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhere>
  anyFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'footprintId'),
      );
    });
  }
}

extension MappingSessionModelQueryWhere
    on QueryBuilder<MappingSessionModel, MappingSessionModel, QWhereClause> {
  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  footprintIdEqualTo(int footprintId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'footprintId',
          value: [footprintId],
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  footprintIdNotEqualTo(int footprintId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'footprintId',
                lower: [],
                upper: [footprintId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'footprintId',
                lower: [footprintId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'footprintId',
                lower: [footprintId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'footprintId',
                lower: [],
                upper: [footprintId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  footprintIdGreaterThan(int footprintId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'footprintId',
          lower: [footprintId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  footprintIdLessThan(int footprintId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'footprintId',
          lower: [],
          upper: [footprintId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  footprintIdBetween(
    int lowerFootprintId,
    int upperFootprintId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'footprintId',
          lower: [lowerFootprintId],
          includeLower: includeLower,
          upper: [upperFootprintId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  ownerUserIdEqualTo(String ownerUserId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'ownerUserId',
          value: [ownerUserId],
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  ownerUserIdNotEqualTo(String ownerUserId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerUserId',
                lower: [],
                upper: [ownerUserId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerUserId',
                lower: [ownerUserId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerUserId',
                lower: [ownerUserId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerUserId',
                lower: [],
                upper: [ownerUserId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  localStateEqualTo(MappingLocalStateModel localState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localState', value: [localState]),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterWhereClause>
  localStateNotEqualTo(MappingLocalStateModel localState) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localState',
                lower: [],
                upper: [localState],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localState',
                lower: [localState],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localState',
                lower: [localState],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'localState',
                lower: [],
                upper: [localState],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension MappingSessionModelQueryFilter
    on
        QueryBuilder<
          MappingSessionModel,
          MappingSessionModel,
          QFilterCondition
        > {
  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  captureFinishedLocalAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'captureFinishedLocalAt'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  captureFinishedLocalAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'captureFinishedLocalAt'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  captureFinishedLocalAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'captureFinishedLocalAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  captureFinishedLocalAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'captureFinishedLocalAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  captureFinishedLocalAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'captureFinishedLocalAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  captureFinishedLocalAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'captureFinishedLocalAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  configVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'configVersion', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  configVersionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'configVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  configVersionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'configVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  configVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'configVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'failureCode'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'failureCode'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeEqualTo(
    MappingFailureCodeModel? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'failureCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeGreaterThan(
    MappingFailureCodeModel? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'failureCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeLessThan(
    MappingFailureCodeModel? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'failureCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeBetween(
    MappingFailureCodeModel? lower,
    MappingFailureCodeModel? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'failureCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'failureCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'failureCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'failureCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'failureCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'failureCode', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'failureCode', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'failureMessage'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'failureMessage'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'failureMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'failureMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'failureMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'failureMessage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'failureMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'failureMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'failureMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'failureMessage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'failureMessage', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  failureMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'failureMessage', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  footprintIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'footprintId', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  footprintIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'footprintId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  footprintIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'footprintId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  footprintIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'footprintId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastKnownServerTotalSamplesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastKnownServerTotalSamples'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastKnownServerTotalSamplesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'lastKnownServerTotalSamples',
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastKnownServerTotalSamplesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastKnownServerTotalSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastKnownServerTotalSamplesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastKnownServerTotalSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastKnownServerTotalSamplesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastKnownServerTotalSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastKnownServerTotalSamplesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastKnownServerTotalSamples',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastSampleAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSampleAt'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastSampleAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSampleAt'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastSampleAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSampleAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastSampleAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSampleAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastSampleAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSampleAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  lastSampleAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSampleAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateEqualTo(MappingLocalStateModel value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateGreaterThan(
    MappingLocalStateModel value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateLessThan(
    MappingLocalStateModel value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateBetween(
    MappingLocalStateModel lower,
    MappingLocalStateModel upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localState',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localState',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localState',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localState', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  localStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localState', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  mappingRequestIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mappingRequestId', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  mappingRequestIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mappingRequestId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  mappingRequestIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mappingRequestId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  mappingRequestIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mappingRequestId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxBatchEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxBatch', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxBatchGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxBatch',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxBatchLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxBatch',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxBatchBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxBatch',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxSamplesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxSamples', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxSamplesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxSamplesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  maxSamplesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxSamples',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minDurationSecondsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'minDurationSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minDurationSecondsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minDurationSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minDurationSecondsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minDurationSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minDurationSecondsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minDurationSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minSamplesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'minSamples', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minSamplesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minSamplesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minSamples',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  minSamplesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minSamples',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  nextSequenceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextSequence', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  nextSequenceGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextSequence',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  nextSequenceLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextSequence',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  nextSequenceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextSequence',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  outletNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ownerUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ownerUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ownerUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ownerUserId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ownerUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ownerUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ownerUserId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ownerUserId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ownerUserId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  ownerUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ownerUserId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingDistanceFilterEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'preMappingDistanceFilter',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingDistanceFilterGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'preMappingDistanceFilter',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingDistanceFilterLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'preMappingDistanceFilter',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingDistanceFilterBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'preMappingDistanceFilter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'preMappingExtrasJson'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'preMappingExtrasJson'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'preMappingExtrasJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'preMappingExtrasJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'preMappingExtrasJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'preMappingExtrasJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'preMappingExtrasJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'preMappingExtrasJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'preMappingExtrasJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'preMappingExtrasJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'preMappingExtrasJson', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingExtrasJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'preMappingExtrasJson',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingHeartbeatIntervalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'preMappingHeartbeatInterval',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingHeartbeatIntervalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'preMappingHeartbeatInterval',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingHeartbeatIntervalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'preMappingHeartbeatInterval',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  preMappingHeartbeatIntervalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'preMappingHeartbeatInterval',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  recommendedIntervalMsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'recommendedIntervalMs'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  recommendedIntervalMsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'recommendedIntervalMs'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  recommendedIntervalMsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'recommendedIntervalMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  recommendedIntervalMsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recommendedIntervalMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  recommendedIntervalMsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recommendedIntervalMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  recommendedIntervalMsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recommendedIntervalMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  serverTimeAtStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverTimeAtStart'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  serverTimeAtStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverTimeAtStart'),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  serverTimeAtStartEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverTimeAtStart', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  serverTimeAtStartGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverTimeAtStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  serverTimeAtStartLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverTimeAtStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  serverTimeAtStartBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverTimeAtStart',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  visitLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitLocalId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterFilterCondition>
  visitLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'visitLocalId', value: ''),
      );
    });
  }
}

extension MappingSessionModelQueryObject
    on
        QueryBuilder<
          MappingSessionModel,
          MappingSessionModel,
          QFilterCondition
        > {}

extension MappingSessionModelQueryLinks
    on
        QueryBuilder<
          MappingSessionModel,
          MappingSessionModel,
          QFilterCondition
        > {}

extension MappingSessionModelQuerySortBy
    on QueryBuilder<MappingSessionModel, MappingSessionModel, QSortBy> {
  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByCaptureFinishedLocalAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureFinishedLocalAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByCaptureFinishedLocalAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureFinishedLocalAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByConfigVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configVersion', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByConfigVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configVersion', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByFailureCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureCode', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByFailureCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureCode', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByFailureMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureMessage', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByFailureMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureMessage', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByFootprintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLastKnownServerTotalSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownServerTotalSamples', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLastKnownServerTotalSamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownServerTotalSamples', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLastSampleAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSampleAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLastSampleAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSampleAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLocalState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localState', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByLocalStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localState', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMappingRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMappingRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMaxBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBatch', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMaxBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBatch', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMaxSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSamples', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMaxSamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSamples', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMinDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMinDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDurationSeconds', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMinSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSamples', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByMinSamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSamples', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByNextSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextSequence', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByNextSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextSequence', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOwnerUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUserId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByOwnerUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUserId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByPreMappingDistanceFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingDistanceFilter', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByPreMappingDistanceFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingDistanceFilter', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByPreMappingExtrasJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingExtrasJson', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByPreMappingExtrasJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingExtrasJson', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByPreMappingHeartbeatInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingHeartbeatInterval', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByPreMappingHeartbeatIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingHeartbeatInterval', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByRecommendedIntervalMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedIntervalMs', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByRecommendedIntervalMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedIntervalMs', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByServerTimeAtStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTimeAtStart', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByServerTimeAtStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTimeAtStart', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  sortByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }
}

extension MappingSessionModelQuerySortThenBy
    on QueryBuilder<MappingSessionModel, MappingSessionModel, QSortThenBy> {
  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByCaptureFinishedLocalAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureFinishedLocalAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByCaptureFinishedLocalAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureFinishedLocalAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByConfigVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configVersion', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByConfigVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configVersion', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByFailureCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureCode', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByFailureCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureCode', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByFailureMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureMessage', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByFailureMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureMessage', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByFootprintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLastKnownServerTotalSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownServerTotalSamples', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLastKnownServerTotalSamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownServerTotalSamples', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLastSampleAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSampleAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLastSampleAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSampleAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLocalState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localState', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByLocalStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localState', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMappingRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMappingRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMaxBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBatch', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMaxBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxBatch', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMaxSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSamples', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMaxSamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSamples', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMinDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMinDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minDurationSeconds', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMinSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSamples', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByMinSamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSamples', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByNextSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextSequence', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByNextSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextSequence', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOwnerUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUserId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByOwnerUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUserId', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByPreMappingDistanceFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingDistanceFilter', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByPreMappingDistanceFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingDistanceFilter', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByPreMappingExtrasJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingExtrasJson', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByPreMappingExtrasJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingExtrasJson', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByPreMappingHeartbeatInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingHeartbeatInterval', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByPreMappingHeartbeatIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preMappingHeartbeatInterval', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByRecommendedIntervalMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedIntervalMs', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByRecommendedIntervalMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedIntervalMs', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByServerTimeAtStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTimeAtStart', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByServerTimeAtStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTimeAtStart', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByVisitLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.asc);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QAfterSortBy>
  thenByVisitLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitLocalId', Sort.desc);
    });
  }
}

extension MappingSessionModelQueryWhereDistinct
    on QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct> {
  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByCaptureFinishedLocalAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'captureFinishedLocalAt');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByConfigVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'configVersion');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByFailureCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failureCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByFailureMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'failureMessage',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'footprintId');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByLastKnownServerTotalSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastKnownServerTotalSamples');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByLastSampleAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSampleAt');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByLocalState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByMappingRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mappingRequestId');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByMaxBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxBatch');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByMaxSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSamples');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByMinDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minDurationSeconds');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByMinSamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minSamples');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByNextSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextSequence');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByOutletCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByOutletId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByOutletName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByOwnerUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerUserId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByPreMappingDistanceFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preMappingDistanceFilter');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByPreMappingExtrasJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'preMappingExtrasJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByPreMappingHeartbeatInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preMappingHeartbeatInterval');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByRecommendedIntervalMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recommendedIntervalMs');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByServerTimeAtStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverTimeAtStart');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MappingSessionModel, MappingSessionModel, QDistinct>
  distinctByVisitLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitLocalId', caseSensitive: caseSensitive);
    });
  }
}

extension MappingSessionModelQueryProperty
    on QueryBuilder<MappingSessionModel, MappingSessionModel, QQueryProperty> {
  QueryBuilder<MappingSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MappingSessionModel, DateTime?, QQueryOperations>
  captureFinishedLocalAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'captureFinishedLocalAt');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations>
  configVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'configVersion');
    });
  }

  QueryBuilder<MappingSessionModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MappingSessionModel, MappingFailureCodeModel?, QQueryOperations>
  failureCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failureCode');
    });
  }

  QueryBuilder<MappingSessionModel, String?, QQueryOperations>
  failureMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failureMessage');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations>
  footprintIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'footprintId');
    });
  }

  QueryBuilder<MappingSessionModel, int?, QQueryOperations>
  lastKnownServerTotalSamplesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastKnownServerTotalSamples');
    });
  }

  QueryBuilder<MappingSessionModel, DateTime?, QQueryOperations>
  lastSampleAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSampleAt');
    });
  }

  QueryBuilder<MappingSessionModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<MappingSessionModel, MappingLocalStateModel, QQueryOperations>
  localStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localState');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations>
  mappingRequestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mappingRequestId');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations> maxBatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxBatch');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations>
  maxSamplesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSamples');
    });
  }

  QueryBuilder<MappingSessionModel, double, QQueryOperations>
  minDurationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minDurationSeconds');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations>
  minSamplesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minSamples');
    });
  }

  QueryBuilder<MappingSessionModel, int, QQueryOperations>
  nextSequenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextSequence');
    });
  }

  QueryBuilder<MappingSessionModel, String, QQueryOperations>
  outletCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletCode');
    });
  }

  QueryBuilder<MappingSessionModel, String, QQueryOperations>
  outletIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletId');
    });
  }

  QueryBuilder<MappingSessionModel, String, QQueryOperations>
  outletNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletName');
    });
  }

  QueryBuilder<MappingSessionModel, String, QQueryOperations>
  ownerUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerUserId');
    });
  }

  QueryBuilder<MappingSessionModel, double, QQueryOperations>
  preMappingDistanceFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preMappingDistanceFilter');
    });
  }

  QueryBuilder<MappingSessionModel, String?, QQueryOperations>
  preMappingExtrasJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preMappingExtrasJson');
    });
  }

  QueryBuilder<MappingSessionModel, double, QQueryOperations>
  preMappingHeartbeatIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preMappingHeartbeatInterval');
    });
  }

  QueryBuilder<MappingSessionModel, int?, QQueryOperations>
  recommendedIntervalMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recommendedIntervalMs');
    });
  }

  QueryBuilder<MappingSessionModel, DateTime?, QQueryOperations>
  serverTimeAtStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverTimeAtStart');
    });
  }

  QueryBuilder<MappingSessionModel, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<MappingSessionModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MappingSessionModel, String, QQueryOperations>
  visitLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitLocalId');
    });
  }
}
