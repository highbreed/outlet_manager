// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serial_number_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSerialNumberEntryModelCollection on Isar {
  IsarCollection<SerialNumberEntryModel> get serialNumberEntryModels =>
      this.collection();
}

const SerialNumberEntryModelSchema = CollectionSchema(
  name: r'SerialNumberEntryModel',
  id: 423308765916313379,
  properties: {
    r'deviceScanId': PropertySchema(
      id: 0,
      name: r'deviceScanId',
      type: IsarType.string,
    ),
    r'deviceScannedAt': PropertySchema(
      id: 1,
      name: r'deviceScannedAt',
      type: IsarType.dateTime,
    ),
    r'displaySerial': PropertySchema(
      id: 2,
      name: r'displaySerial',
      type: IsarType.string,
    ),
    r'isDuplicate': PropertySchema(
      id: 3,
      name: r'isDuplicate',
      type: IsarType.bool,
    ),
    r'isInvalid': PropertySchema(
      id: 4,
      name: r'isInvalid',
      type: IsarType.bool,
    ),
    r'isValid': PropertySchema(id: 5, name: r'isValid', type: IsarType.bool),
    r'itemLocalId': PropertySchema(
      id: 6,
      name: r'itemLocalId',
      type: IsarType.string,
    ),
    r'localId': PropertySchema(id: 7, name: r'localId', type: IsarType.string),
    r'scanSequence': PropertySchema(
      id: 8,
      name: r'scanSequence',
      type: IsarType.long,
    ),
    r'scannedAt': PropertySchema(
      id: 9,
      name: r'scannedAt',
      type: IsarType.dateTime,
    ),
    r'serialNumberNorm': PropertySchema(
      id: 10,
      name: r'serialNumberNorm',
      type: IsarType.string,
    ),
    r'serialNumberRaw': PropertySchema(
      id: 11,
      name: r'serialNumberRaw',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(id: 12, name: r'serverId', type: IsarType.long),
    r'sessionLocalId': PropertySchema(
      id: 13,
      name: r'sessionLocalId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.string,
      enumMap: _SerialNumberEntryModelstatusEnumValueMap,
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
      enumMap: _SerialNumberEntryModelsyncStateEnumValueMap,
    ),
    r'validationError': PropertySchema(
      id: 17,
      name: r'validationError',
      type: IsarType.string,
    ),
  },

  estimateSize: _serialNumberEntryModelEstimateSize,
  serialize: _serialNumberEntryModelSerialize,
  deserialize: _serialNumberEntryModelDeserialize,
  deserializeProp: _serialNumberEntryModelDeserializeProp,
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
    r'itemLocalId': IndexSchema(
      id: -3617453684345542577,
      name: r'itemLocalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'itemLocalId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'serialNumberNorm_sessionLocalId': IndexSchema(
      id: 4188118556782093819,
      name: r'serialNumberNorm_sessionLocalId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serialNumberNorm',
          type: IndexType.hash,
          caseSensitive: true,
        ),
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

  getId: _serialNumberEntryModelGetId,
  getLinks: _serialNumberEntryModelGetLinks,
  attach: _serialNumberEntryModelAttach,
  version: '3.3.2',
);

int _serialNumberEntryModelEstimateSize(
  SerialNumberEntryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceScanId.length * 3;
  bytesCount += 3 + object.displaySerial.length * 3;
  bytesCount += 3 + object.itemLocalId.length * 3;
  bytesCount += 3 + object.localId.length * 3;
  bytesCount += 3 + object.serialNumberNorm.length * 3;
  bytesCount += 3 + object.serialNumberRaw.length * 3;
  bytesCount += 3 + object.sessionLocalId.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.syncError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncState.name.length * 3;
  {
    final value = object.validationError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _serialNumberEntryModelSerialize(
  SerialNumberEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.deviceScanId);
  writer.writeDateTime(offsets[1], object.deviceScannedAt);
  writer.writeString(offsets[2], object.displaySerial);
  writer.writeBool(offsets[3], object.isDuplicate);
  writer.writeBool(offsets[4], object.isInvalid);
  writer.writeBool(offsets[5], object.isValid);
  writer.writeString(offsets[6], object.itemLocalId);
  writer.writeString(offsets[7], object.localId);
  writer.writeLong(offsets[8], object.scanSequence);
  writer.writeDateTime(offsets[9], object.scannedAt);
  writer.writeString(offsets[10], object.serialNumberNorm);
  writer.writeString(offsets[11], object.serialNumberRaw);
  writer.writeLong(offsets[12], object.serverId);
  writer.writeString(offsets[13], object.sessionLocalId);
  writer.writeString(offsets[14], object.status.name);
  writer.writeString(offsets[15], object.syncError);
  writer.writeString(offsets[16], object.syncState.name);
  writer.writeString(offsets[17], object.validationError);
}

SerialNumberEntryModel _serialNumberEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SerialNumberEntryModel();
  object.deviceScanId = reader.readString(offsets[0]);
  object.deviceScannedAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.itemLocalId = reader.readString(offsets[6]);
  object.localId = reader.readString(offsets[7]);
  object.scanSequence = reader.readLongOrNull(offsets[8]);
  object.scannedAt = reader.readDateTime(offsets[9]);
  object.serialNumberNorm = reader.readString(offsets[10]);
  object.serialNumberRaw = reader.readString(offsets[11]);
  object.serverId = reader.readLongOrNull(offsets[12]);
  object.sessionLocalId = reader.readString(offsets[13]);
  object.status =
      _SerialNumberEntryModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[14],
      )] ??
      SerialStatus.valid;
  object.syncError = reader.readStringOrNull(offsets[15]);
  object.syncState =
      _SerialNumberEntryModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[16],
      )] ??
      SyncState.pending;
  object.validationError = reader.readStringOrNull(offsets[17]);
  return object;
}

P _serialNumberEntryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (_SerialNumberEntryModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SerialStatus.valid)
          as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (_SerialNumberEntryModelsyncStateValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              SyncState.pending)
          as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SerialNumberEntryModelstatusEnumValueMap = {
  r'valid': r'valid',
  r'duplicate': r'duplicate',
  r'duplicateCrossItem': r'duplicateCrossItem',
  r'invalid': r'invalid',
  r'pendingValidation': r'pendingValidation',
};
const _SerialNumberEntryModelstatusValueEnumMap = {
  r'valid': SerialStatus.valid,
  r'duplicate': SerialStatus.duplicate,
  r'duplicateCrossItem': SerialStatus.duplicateCrossItem,
  r'invalid': SerialStatus.invalid,
  r'pendingValidation': SerialStatus.pendingValidation,
};
const _SerialNumberEntryModelsyncStateEnumValueMap = {
  r'pending': r'pending',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'failed': r'failed',
};
const _SerialNumberEntryModelsyncStateValueEnumMap = {
  r'pending': SyncState.pending,
  r'syncing': SyncState.syncing,
  r'synced': SyncState.synced,
  r'failed': SyncState.failed,
};

Id _serialNumberEntryModelGetId(SerialNumberEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _serialNumberEntryModelGetLinks(
  SerialNumberEntryModel object,
) {
  return [];
}

void _serialNumberEntryModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  SerialNumberEntryModel object,
) {
  object.id = id;
}

extension SerialNumberEntryModelByIndex
    on IsarCollection<SerialNumberEntryModel> {
  Future<SerialNumberEntryModel?> getBySerialNumberNormSessionLocalId(
    String serialNumberNorm,
    String sessionLocalId,
  ) {
    return getByIndex(r'serialNumberNorm_sessionLocalId', [
      serialNumberNorm,
      sessionLocalId,
    ]);
  }

  SerialNumberEntryModel? getBySerialNumberNormSessionLocalIdSync(
    String serialNumberNorm,
    String sessionLocalId,
  ) {
    return getByIndexSync(r'serialNumberNorm_sessionLocalId', [
      serialNumberNorm,
      sessionLocalId,
    ]);
  }

  Future<bool> deleteBySerialNumberNormSessionLocalId(
    String serialNumberNorm,
    String sessionLocalId,
  ) {
    return deleteByIndex(r'serialNumberNorm_sessionLocalId', [
      serialNumberNorm,
      sessionLocalId,
    ]);
  }

  bool deleteBySerialNumberNormSessionLocalIdSync(
    String serialNumberNorm,
    String sessionLocalId,
  ) {
    return deleteByIndexSync(r'serialNumberNorm_sessionLocalId', [
      serialNumberNorm,
      sessionLocalId,
    ]);
  }

  Future<List<SerialNumberEntryModel?>> getAllBySerialNumberNormSessionLocalId(
    List<String> serialNumberNormValues,
    List<String> sessionLocalIdValues,
  ) {
    final len = serialNumberNormValues.length;
    assert(
      sessionLocalIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([serialNumberNormValues[i], sessionLocalIdValues[i]]);
    }

    return getAllByIndex(r'serialNumberNorm_sessionLocalId', values);
  }

  List<SerialNumberEntryModel?> getAllBySerialNumberNormSessionLocalIdSync(
    List<String> serialNumberNormValues,
    List<String> sessionLocalIdValues,
  ) {
    final len = serialNumberNormValues.length;
    assert(
      sessionLocalIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([serialNumberNormValues[i], sessionLocalIdValues[i]]);
    }

    return getAllByIndexSync(r'serialNumberNorm_sessionLocalId', values);
  }

  Future<int> deleteAllBySerialNumberNormSessionLocalId(
    List<String> serialNumberNormValues,
    List<String> sessionLocalIdValues,
  ) {
    final len = serialNumberNormValues.length;
    assert(
      sessionLocalIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([serialNumberNormValues[i], sessionLocalIdValues[i]]);
    }

    return deleteAllByIndex(r'serialNumberNorm_sessionLocalId', values);
  }

  int deleteAllBySerialNumberNormSessionLocalIdSync(
    List<String> serialNumberNormValues,
    List<String> sessionLocalIdValues,
  ) {
    final len = serialNumberNormValues.length;
    assert(
      sessionLocalIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([serialNumberNormValues[i], sessionLocalIdValues[i]]);
    }

    return deleteAllByIndexSync(r'serialNumberNorm_sessionLocalId', values);
  }

  Future<Id> putBySerialNumberNormSessionLocalId(
    SerialNumberEntryModel object,
  ) {
    return putByIndex(r'serialNumberNorm_sessionLocalId', object);
  }

  Id putBySerialNumberNormSessionLocalIdSync(
    SerialNumberEntryModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(
      r'serialNumberNorm_sessionLocalId',
      object,
      saveLinks: saveLinks,
    );
  }

  Future<List<Id>> putAllBySerialNumberNormSessionLocalId(
    List<SerialNumberEntryModel> objects,
  ) {
    return putAllByIndex(r'serialNumberNorm_sessionLocalId', objects);
  }

  List<Id> putAllBySerialNumberNormSessionLocalIdSync(
    List<SerialNumberEntryModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(
      r'serialNumberNorm_sessionLocalId',
      objects,
      saveLinks: saveLinks,
    );
  }
}

extension SerialNumberEntryModelQueryWhereSort
    on QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QWhere> {
  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SerialNumberEntryModelQueryWhere
    on
        QueryBuilder<
          SerialNumberEntryModel,
          SerialNumberEntryModel,
          QWhereClause
        > {
  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  itemLocalIdEqualTo(String itemLocalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'itemLocalId',
          value: [itemLocalId],
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  itemLocalIdNotEqualTo(String itemLocalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'itemLocalId',
                lower: [],
                upper: [itemLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'itemLocalId',
                lower: [itemLocalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'itemLocalId',
                lower: [itemLocalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'itemLocalId',
                lower: [],
                upper: [itemLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  serialNumberNormEqualToAnySessionLocalId(String serialNumberNorm) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'serialNumberNorm_sessionLocalId',
          value: [serialNumberNorm],
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  serialNumberNormNotEqualToAnySessionLocalId(String serialNumberNorm) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [],
                upper: [serialNumberNorm],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [serialNumberNorm],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [serialNumberNorm],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [],
                upper: [serialNumberNorm],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  serialNumberNormSessionLocalIdEqualTo(
    String serialNumberNorm,
    String sessionLocalId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'serialNumberNorm_sessionLocalId',
          value: [serialNumberNorm, sessionLocalId],
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  serialNumberNormEqualToSessionLocalIdNotEqualTo(
    String serialNumberNorm,
    String sessionLocalId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [serialNumberNorm],
                upper: [serialNumberNorm, sessionLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [serialNumberNorm, sessionLocalId],
                includeLower: false,
                upper: [serialNumberNorm],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [serialNumberNorm, sessionLocalId],
                includeLower: false,
                upper: [serialNumberNorm],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serialNumberNorm_sessionLocalId',
                lower: [serialNumberNorm],
                upper: [serialNumberNorm, sessionLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
  syncStateEqualTo(SyncState syncState) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncState', value: [syncState]),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterWhereClause
  >
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

extension SerialNumberEntryModelQueryFilter
    on
        QueryBuilder<
          SerialNumberEntryModel,
          SerialNumberEntryModel,
          QFilterCondition
        > {
  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'deviceScanId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deviceScanId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deviceScanId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deviceScanId',
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'deviceScanId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'deviceScanId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'deviceScanId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'deviceScanId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deviceScanId', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScanIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'deviceScanId', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScannedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deviceScannedAt', value: value),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScannedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deviceScannedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScannedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deviceScannedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  deviceScannedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deviceScannedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'displaySerial',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'displaySerial',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'displaySerial',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'displaySerial',
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'displaySerial',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'displaySerial',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'displaySerial',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'displaySerial',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'displaySerial', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  displaySerialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'displaySerial', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  isDuplicateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDuplicate', value: value),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  isInvalidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isInvalid', value: value),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  isValidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isValid', value: value),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'itemLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemLocalId',
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'itemLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'itemLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'itemLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'itemLocalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  itemLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'itemLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scanSequenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scanSequence'),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scanSequenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scanSequence'),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scanSequenceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scanSequence', value: value),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scanSequenceGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scanSequence',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scanSequenceLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scanSequence',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scanSequenceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scanSequence',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scannedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scannedAt', value: value),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scannedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scannedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scannedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scannedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  scannedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scannedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'serialNumberNorm',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serialNumberNorm',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serialNumberNorm',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serialNumberNorm',
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'serialNumberNorm',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'serialNumberNorm',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'serialNumberNorm',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'serialNumberNorm',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serialNumberNorm', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberNormIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serialNumberNorm', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'serialNumberRaw',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serialNumberRaw',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serialNumberRaw',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serialNumberRaw',
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'serialNumberRaw',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'serialNumberRaw',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'serialNumberRaw',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'serialNumberRaw',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serialNumberRaw', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  serialNumberRawIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serialNumberRaw', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  sessionLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  sessionLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sessionLocalId', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  statusEqualTo(SerialStatus value, {bool caseSensitive = true}) {
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  statusGreaterThan(
    SerialStatus value, {
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  statusLessThan(
    SerialStatus value, {
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  statusBetween(
    SerialStatus lower,
    SerialStatus upper, {
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'validationError'),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'validationError'),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'validationError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'validationError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'validationError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'validationError',
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
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'validationError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'validationError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'validationError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'validationError',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'validationError', value: ''),
      );
    });
  }

  QueryBuilder<
    SerialNumberEntryModel,
    SerialNumberEntryModel,
    QAfterFilterCondition
  >
  validationErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'validationError', value: ''),
      );
    });
  }
}

extension SerialNumberEntryModelQueryObject
    on
        QueryBuilder<
          SerialNumberEntryModel,
          SerialNumberEntryModel,
          QFilterCondition
        > {}

extension SerialNumberEntryModelQueryLinks
    on
        QueryBuilder<
          SerialNumberEntryModel,
          SerialNumberEntryModel,
          QFilterCondition
        > {}

extension SerialNumberEntryModelQuerySortBy
    on QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QSortBy> {
  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByDeviceScanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScanId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByDeviceScanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScanId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByDeviceScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScannedAt', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByDeviceScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScannedAt', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByDisplaySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySerial', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByDisplaySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySerial', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByIsDuplicate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByIsDuplicateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByIsInvalid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByIsInvalidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByItemLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemLocalId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByItemLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemLocalId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByScanSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanSequence', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByScanSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanSequence', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySerialNumberNorm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberNorm', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySerialNumberNormDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberNorm', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySerialNumberRaw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberRaw', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySerialNumberRawDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberRaw', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySessionLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySessionLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByValidationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationError', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  sortByValidationErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationError', Sort.desc);
    });
  }
}

extension SerialNumberEntryModelQuerySortThenBy
    on
        QueryBuilder<
          SerialNumberEntryModel,
          SerialNumberEntryModel,
          QSortThenBy
        > {
  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByDeviceScanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScanId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByDeviceScanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScanId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByDeviceScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScannedAt', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByDeviceScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceScannedAt', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByDisplaySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySerial', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByDisplaySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySerial', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIsDuplicate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIsDuplicateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDuplicate', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIsInvalid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIsInvalidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByItemLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemLocalId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByItemLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemLocalId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByScanSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanSequence', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByScanSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanSequence', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySerialNumberNorm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberNorm', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySerialNumberNormDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberNorm', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySerialNumberRaw() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberRaw', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySerialNumberRawDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumberRaw', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySessionLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySessionLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionLocalId', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByValidationError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationError', Sort.asc);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QAfterSortBy>
  thenByValidationErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationError', Sort.desc);
    });
  }
}

extension SerialNumberEntryModelQueryWhereDistinct
    on QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct> {
  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByDeviceScanId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceScanId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByDeviceScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceScannedAt');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByDisplaySerial({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'displaySerial',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByIsDuplicate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDuplicate');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByIsInvalid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInvalid');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isValid');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByItemLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemLocalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByScanSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scanSequence');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scannedAt');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctBySerialNumberNorm({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'serialNumberNorm',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctBySerialNumberRaw({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'serialNumberRaw',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctBySessionLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'sessionLocalId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialNumberEntryModel, QDistinct>
  distinctByValidationError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'validationError',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension SerialNumberEntryModelQueryProperty
    on
        QueryBuilder<
          SerialNumberEntryModel,
          SerialNumberEntryModel,
          QQueryProperty
        > {
  QueryBuilder<SerialNumberEntryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  deviceScanIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceScanId');
    });
  }

  QueryBuilder<SerialNumberEntryModel, DateTime, QQueryOperations>
  deviceScannedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceScannedAt');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  displaySerialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displaySerial');
    });
  }

  QueryBuilder<SerialNumberEntryModel, bool, QQueryOperations>
  isDuplicateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDuplicate');
    });
  }

  QueryBuilder<SerialNumberEntryModel, bool, QQueryOperations>
  isInvalidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInvalid');
    });
  }

  QueryBuilder<SerialNumberEntryModel, bool, QQueryOperations>
  isValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isValid');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  itemLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemLocalId');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<SerialNumberEntryModel, int?, QQueryOperations>
  scanSequenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scanSequence');
    });
  }

  QueryBuilder<SerialNumberEntryModel, DateTime, QQueryOperations>
  scannedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scannedAt');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  serialNumberNormProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNumberNorm');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  serialNumberRawProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNumberRaw');
    });
  }

  QueryBuilder<SerialNumberEntryModel, int?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String, QQueryOperations>
  sessionLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionLocalId');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SerialStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<SerialNumberEntryModel, SyncState, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<SerialNumberEntryModel, String?, QQueryOperations>
  validationErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validationError');
    });
  }
}
