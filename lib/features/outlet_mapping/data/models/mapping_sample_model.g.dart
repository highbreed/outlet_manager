// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapping_sample_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMappingSampleModelCollection on Isar {
  IsarCollection<MappingSampleModel> get mappingSampleModels =>
      this.collection();
}

const MappingSampleModelSchema = CollectionSchema(
  name: r'MappingSampleModel',
  id: -1789631616601383502,
  properties: {
    r'accuracyM': PropertySchema(
      id: 0,
      name: r'accuracyM',
      type: IsarType.double,
    ),
    r'altitudeM': PropertySchema(
      id: 1,
      name: r'altitudeM',
      type: IsarType.double,
    ),
    r'attemptCount': PropertySchema(
      id: 2,
      name: r'attemptCount',
      type: IsarType.long,
    ),
    r'clientSampleId': PropertySchema(
      id: 3,
      name: r'clientSampleId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'floorLabel': PropertySchema(
      id: 5,
      name: r'floorLabel',
      type: IsarType.string,
    ),
    r'footprintId': PropertySchema(
      id: 6,
      name: r'footprintId',
      type: IsarType.long,
    ),
    r'headingDeg': PropertySchema(
      id: 7,
      name: r'headingDeg',
      type: IsarType.double,
    ),
    r'isMock': PropertySchema(id: 8, name: r'isMock', type: IsarType.bool),
    r'lastAttemptAt': PropertySchema(
      id: 9,
      name: r'lastAttemptAt',
      type: IsarType.dateTime,
    ),
    r'lastError': PropertySchema(
      id: 10,
      name: r'lastError',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 11,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'localId': PropertySchema(id: 12, name: r'localId', type: IsarType.string),
    r'longitude': PropertySchema(
      id: 13,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'provider': PropertySchema(
      id: 14,
      name: r'provider',
      type: IsarType.string,
    ),
    r'recordedAt': PropertySchema(
      id: 15,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'sequence': PropertySchema(id: 16, name: r'sequence', type: IsarType.long),
    r'speedMps': PropertySchema(
      id: 17,
      name: r'speedMps',
      type: IsarType.double,
    ),
    r'syncState': PropertySchema(
      id: 18,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _MappingSampleModelsyncStateEnumValueMap,
    ),
    r'verticalAccuracyM': PropertySchema(
      id: 19,
      name: r'verticalAccuracyM',
      type: IsarType.double,
    ),
  },

  estimateSize: _mappingSampleModelEstimateSize,
  serialize: _mappingSampleModelSerialize,
  deserialize: _mappingSampleModelDeserialize,
  deserializeProp: _mappingSampleModelDeserializeProp,
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
    r'clientSampleId': IndexSchema(
      id: 8873594426665253614,
      name: r'clientSampleId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'clientSampleId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'recordedAt': IndexSchema(
      id: -5046025352082009396,
      name: r'recordedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recordedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'syncState_footprintId': IndexSchema(
      id: -6828118001035975161,
      name: r'syncState_footprintId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncState',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'footprintId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _mappingSampleModelGetId,
  getLinks: _mappingSampleModelGetLinks,
  attach: _mappingSampleModelAttach,
  version: '3.3.0-dev.1',
);

int _mappingSampleModelEstimateSize(
  MappingSampleModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clientSampleId.length * 3;
  {
    final value = object.floorLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.provider;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncState.name.length * 3;
  return bytesCount;
}

void _mappingSampleModelSerialize(
  MappingSampleModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracyM);
  writer.writeDouble(offsets[1], object.altitudeM);
  writer.writeLong(offsets[2], object.attemptCount);
  writer.writeString(offsets[3], object.clientSampleId);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.floorLabel);
  writer.writeLong(offsets[6], object.footprintId);
  writer.writeDouble(offsets[7], object.headingDeg);
  writer.writeBool(offsets[8], object.isMock);
  writer.writeDateTime(offsets[9], object.lastAttemptAt);
  writer.writeString(offsets[10], object.lastError);
  writer.writeDouble(offsets[11], object.latitude);
  writer.writeString(offsets[12], object.localId);
  writer.writeDouble(offsets[13], object.longitude);
  writer.writeString(offsets[14], object.provider);
  writer.writeDateTime(offsets[15], object.recordedAt);
  writer.writeLong(offsets[16], object.sequence);
  writer.writeDouble(offsets[17], object.speedMps);
  writer.writeString(offsets[18], object.syncState.name);
  writer.writeDouble(offsets[19], object.verticalAccuracyM);
}

MappingSampleModel _mappingSampleModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MappingSampleModel();
  object.accuracyM = reader.readDouble(offsets[0]);
  object.altitudeM = reader.readDoubleOrNull(offsets[1]);
  object.attemptCount = reader.readLong(offsets[2]);
  object.clientSampleId = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.floorLabel = reader.readStringOrNull(offsets[5]);
  object.footprintId = reader.readLong(offsets[6]);
  object.headingDeg = reader.readDoubleOrNull(offsets[7]);
  object.id = id;
  object.isMock = reader.readBoolOrNull(offsets[8]);
  object.lastAttemptAt = reader.readDateTimeOrNull(offsets[9]);
  object.lastError = reader.readStringOrNull(offsets[10]);
  object.latitude = reader.readDouble(offsets[11]);
  object.localId = reader.readString(offsets[12]);
  object.longitude = reader.readDouble(offsets[13]);
  object.provider = reader.readStringOrNull(offsets[14]);
  object.recordedAt = reader.readDateTime(offsets[15]);
  object.sequence = reader.readLong(offsets[16]);
  object.speedMps = reader.readDoubleOrNull(offsets[17]);
  object.syncState =
      _MappingSampleModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[18],
      )] ??
      MappingSampleSyncStateModel.pending;
  object.verticalAccuracyM = reader.readDoubleOrNull(offsets[19]);
  return object;
}

P _mappingSampleModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (_MappingSampleModelsyncStateValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              MappingSampleSyncStateModel.pending)
          as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MappingSampleModelsyncStateEnumValueMap = {
  r'pending': r'pending',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'failed': r'failed',
};
const _MappingSampleModelsyncStateValueEnumMap = {
  r'pending': MappingSampleSyncStateModel.pending,
  r'syncing': MappingSampleSyncStateModel.syncing,
  r'synced': MappingSampleSyncStateModel.synced,
  r'failed': MappingSampleSyncStateModel.failed,
};

Id _mappingSampleModelGetId(MappingSampleModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _mappingSampleModelGetLinks(
  MappingSampleModel object,
) {
  return [];
}

void _mappingSampleModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  MappingSampleModel object,
) {
  object.id = id;
}

extension MappingSampleModelByIndex on IsarCollection<MappingSampleModel> {
  Future<MappingSampleModel?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  MappingSampleModel? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<MappingSampleModel?>> getAllByLocalId(
    List<String> localIdValues,
  ) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<MappingSampleModel?> getAllByLocalIdSync(List<String> localIdValues) {
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

  Future<Id> putByLocalId(MappingSampleModel object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(MappingSampleModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<MappingSampleModel> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(
    List<MappingSampleModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }

  Future<MappingSampleModel?> getByClientSampleId(String clientSampleId) {
    return getByIndex(r'clientSampleId', [clientSampleId]);
  }

  MappingSampleModel? getByClientSampleIdSync(String clientSampleId) {
    return getByIndexSync(r'clientSampleId', [clientSampleId]);
  }

  Future<bool> deleteByClientSampleId(String clientSampleId) {
    return deleteByIndex(r'clientSampleId', [clientSampleId]);
  }

  bool deleteByClientSampleIdSync(String clientSampleId) {
    return deleteByIndexSync(r'clientSampleId', [clientSampleId]);
  }

  Future<List<MappingSampleModel?>> getAllByClientSampleId(
    List<String> clientSampleIdValues,
  ) {
    final values = clientSampleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'clientSampleId', values);
  }

  List<MappingSampleModel?> getAllByClientSampleIdSync(
    List<String> clientSampleIdValues,
  ) {
    final values = clientSampleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'clientSampleId', values);
  }

  Future<int> deleteAllByClientSampleId(List<String> clientSampleIdValues) {
    final values = clientSampleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'clientSampleId', values);
  }

  int deleteAllByClientSampleIdSync(List<String> clientSampleIdValues) {
    final values = clientSampleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'clientSampleId', values);
  }

  Future<Id> putByClientSampleId(MappingSampleModel object) {
    return putByIndex(r'clientSampleId', object);
  }

  Id putByClientSampleIdSync(
    MappingSampleModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'clientSampleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClientSampleId(List<MappingSampleModel> objects) {
    return putAllByIndex(r'clientSampleId', objects);
  }

  List<Id> putAllByClientSampleIdSync(
    List<MappingSampleModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'clientSampleId', objects, saveLinks: saveLinks);
  }
}

extension MappingSampleModelQueryWhereSort
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QWhere> {
  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhere>
  anyFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'footprintId'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhere>
  anyRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recordedAt'),
      );
    });
  }
}

extension MappingSampleModelQueryWhere
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QWhereClause> {
  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  clientSampleIdEqualTo(String clientSampleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'clientSampleId',
          value: [clientSampleId],
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  clientSampleIdNotEqualTo(String clientSampleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clientSampleId',
                lower: [],
                upper: [clientSampleId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clientSampleId',
                lower: [clientSampleId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clientSampleId',
                lower: [clientSampleId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'clientSampleId',
                lower: [],
                upper: [clientSampleId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  recordedAtEqualTo(DateTime recordedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recordedAt', value: [recordedAt]),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  recordedAtNotEqualTo(DateTime recordedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [],
                upper: [recordedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [recordedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [recordedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordedAt',
                lower: [],
                upper: [recordedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  recordedAtGreaterThan(DateTime recordedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordedAt',
          lower: [recordedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  recordedAtLessThan(DateTime recordedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordedAt',
          lower: [],
          upper: [recordedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  recordedAtBetween(
    DateTime lowerRecordedAt,
    DateTime upperRecordedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordedAt',
          lower: [lowerRecordedAt],
          includeLower: includeLower,
          upper: [upperRecordedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateEqualToAnyFootprintId(MappingSampleSyncStateModel syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'syncState_footprintId',
          value: [syncState],
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateNotEqualToAnyFootprintId(MappingSampleSyncStateModel syncState) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [],
                upper: [syncState],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [syncState],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [syncState],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [],
                upper: [syncState],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateFootprintIdEqualTo(
    MappingSampleSyncStateModel syncState,
    int footprintId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'syncState_footprintId',
          value: [syncState, footprintId],
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateEqualToFootprintIdNotEqualTo(
    MappingSampleSyncStateModel syncState,
    int footprintId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [syncState],
                upper: [syncState, footprintId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [syncState, footprintId],
                includeLower: false,
                upper: [syncState],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [syncState, footprintId],
                includeLower: false,
                upper: [syncState],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncState_footprintId',
                lower: [syncState],
                upper: [syncState, footprintId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateEqualToFootprintIdGreaterThan(
    MappingSampleSyncStateModel syncState,
    int footprintId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncState_footprintId',
          lower: [syncState, footprintId],
          includeLower: include,
          upper: [syncState],
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateEqualToFootprintIdLessThan(
    MappingSampleSyncStateModel syncState,
    int footprintId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncState_footprintId',
          lower: [syncState],
          upper: [syncState, footprintId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterWhereClause>
  syncStateEqualToFootprintIdBetween(
    MappingSampleSyncStateModel syncState,
    int lowerFootprintId,
    int upperFootprintId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncState_footprintId',
          lower: [syncState, lowerFootprintId],
          includeLower: includeLower,
          upper: [syncState, upperFootprintId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MappingSampleModelQueryFilter
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QFilterCondition> {
  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  accuracyMEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accuracyM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  accuracyMGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accuracyM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  accuracyMLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accuracyM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  accuracyMBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accuracyM',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  altitudeMIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'altitudeM'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  altitudeMIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'altitudeM'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  altitudeMEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'altitudeM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  altitudeMGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'altitudeM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  altitudeMLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'altitudeM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  altitudeMBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'altitudeM',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  attemptCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'attemptCount', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  attemptCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'attemptCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  attemptCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'attemptCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  attemptCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'attemptCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clientSampleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clientSampleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clientSampleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clientSampleId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clientSampleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clientSampleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clientSampleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clientSampleId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clientSampleId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  clientSampleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'clientSampleId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'floorLabel'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'floorLabel'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'floorLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'floorLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'floorLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'floorLabel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'floorLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'floorLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'floorLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'floorLabel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'floorLabel', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  floorLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'floorLabel', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  footprintIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'footprintId', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  headingDegIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'headingDeg'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  headingDegIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'headingDeg'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  headingDegEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'headingDeg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  headingDegGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'headingDeg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  headingDegLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'headingDeg',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  headingDegBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'headingDeg',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  isMockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'isMock'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  isMockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'isMock'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  isMockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isMock', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAttemptAt'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAttemptAt'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastAttemptAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAttemptAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastAttemptAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAttemptAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastAttemptAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAttemptAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastAttemptAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAttemptAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastError'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastError'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastError',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastError',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastError', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastError', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  latitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'latitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'latitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  longitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'longitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'longitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'provider'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'provider'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'provider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'provider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'provider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'provider',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'provider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'provider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'provider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'provider',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'provider', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  providerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'provider', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordedAt', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  recordedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  recordedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  recordedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  sequenceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sequence', value: value),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  sequenceGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sequence',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  sequenceLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sequence',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  sequenceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sequence',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  speedMpsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'speedMps'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  speedMpsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'speedMps'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  speedMpsEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speedMps',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  speedMpsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speedMps',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  speedMpsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speedMps',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  speedMpsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speedMps',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  syncStateEqualTo(
    MappingSampleSyncStateModel value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  syncStateGreaterThan(
    MappingSampleSyncStateModel value, {
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  syncStateLessThan(
    MappingSampleSyncStateModel value, {
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  syncStateBetween(
    MappingSampleSyncStateModel lower,
    MappingSampleSyncStateModel upper, {
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
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

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  verticalAccuracyMIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'verticalAccuracyM'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  verticalAccuracyMIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'verticalAccuracyM'),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  verticalAccuracyMEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'verticalAccuracyM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  verticalAccuracyMGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'verticalAccuracyM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  verticalAccuracyMLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'verticalAccuracyM',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterFilterCondition>
  verticalAccuracyMBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'verticalAccuracyM',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension MappingSampleModelQueryObject
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QFilterCondition> {}

extension MappingSampleModelQueryLinks
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QFilterCondition> {}

extension MappingSampleModelQuerySortBy
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QSortBy> {
  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByAccuracyM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyM', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByAccuracyMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyM', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByAltitudeM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeM', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByAltitudeMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeM', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByAttemptCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptCount', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByAttemptCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptCount', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByClientSampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientSampleId', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByClientSampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientSampleId', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByFloorLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorLabel', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByFloorLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorLabel', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByFootprintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByHeadingDeg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDeg', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByHeadingDegDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDeg', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByIsMock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMock', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByIsMockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMock', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provider', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provider', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortBySequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortBySequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortBySpeedMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortBySpeedMpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByVerticalAccuracyM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verticalAccuracyM', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  sortByVerticalAccuracyMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verticalAccuracyM', Sort.desc);
    });
  }
}

extension MappingSampleModelQuerySortThenBy
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QSortThenBy> {
  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByAccuracyM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyM', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByAccuracyMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyM', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByAltitudeM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeM', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByAltitudeMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altitudeM', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByAttemptCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptCount', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByAttemptCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptCount', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByClientSampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientSampleId', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByClientSampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientSampleId', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByFloorLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorLabel', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByFloorLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorLabel', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByFootprintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footprintId', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByHeadingDeg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDeg', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByHeadingDegDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headingDeg', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByIsMock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMock', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByIsMockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMock', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAttemptAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provider', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provider', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenBySequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenBySequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenBySpeedMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenBySpeedMpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedMps', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByVerticalAccuracyM() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verticalAccuracyM', Sort.asc);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QAfterSortBy>
  thenByVerticalAccuracyMDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verticalAccuracyM', Sort.desc);
    });
  }
}

extension MappingSampleModelQueryWhereDistinct
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct> {
  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByAccuracyM() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracyM');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByAltitudeM() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altitudeM');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByAttemptCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attemptCount');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByClientSampleId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'clientSampleId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByFloorLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'footprintId');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByHeadingDeg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'headingDeg');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByIsMock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMock');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAttemptAt');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByLastError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByProvider({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'provider', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctBySequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequence');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctBySpeedMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speedMps');
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MappingSampleModel, MappingSampleModel, QDistinct>
  distinctByVerticalAccuracyM() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verticalAccuracyM');
    });
  }
}

extension MappingSampleModelQueryProperty
    on QueryBuilder<MappingSampleModel, MappingSampleModel, QQueryProperty> {
  QueryBuilder<MappingSampleModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MappingSampleModel, double, QQueryOperations>
  accuracyMProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracyM');
    });
  }

  QueryBuilder<MappingSampleModel, double?, QQueryOperations>
  altitudeMProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altitudeM');
    });
  }

  QueryBuilder<MappingSampleModel, int, QQueryOperations>
  attemptCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attemptCount');
    });
  }

  QueryBuilder<MappingSampleModel, String, QQueryOperations>
  clientSampleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientSampleId');
    });
  }

  QueryBuilder<MappingSampleModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MappingSampleModel, String?, QQueryOperations>
  floorLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorLabel');
    });
  }

  QueryBuilder<MappingSampleModel, int, QQueryOperations>
  footprintIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'footprintId');
    });
  }

  QueryBuilder<MappingSampleModel, double?, QQueryOperations>
  headingDegProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'headingDeg');
    });
  }

  QueryBuilder<MappingSampleModel, bool?, QQueryOperations> isMockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMock');
    });
  }

  QueryBuilder<MappingSampleModel, DateTime?, QQueryOperations>
  lastAttemptAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAttemptAt');
    });
  }

  QueryBuilder<MappingSampleModel, String?, QQueryOperations>
  lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastError');
    });
  }

  QueryBuilder<MappingSampleModel, double, QQueryOperations>
  latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<MappingSampleModel, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<MappingSampleModel, double, QQueryOperations>
  longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<MappingSampleModel, String?, QQueryOperations>
  providerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'provider');
    });
  }

  QueryBuilder<MappingSampleModel, DateTime, QQueryOperations>
  recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<MappingSampleModel, int, QQueryOperations> sequenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequence');
    });
  }

  QueryBuilder<MappingSampleModel, double?, QQueryOperations>
  speedMpsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speedMps');
    });
  }

  QueryBuilder<
    MappingSampleModel,
    MappingSampleSyncStateModel,
    QQueryOperations
  >
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<MappingSampleModel, double?, QQueryOperations>
  verticalAccuracyMProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verticalAccuracyM');
    });
  }
}
