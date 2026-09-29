// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_visit_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutletVisitModelCollection on Isar {
  IsarCollection<OutletVisitModel> get outletVisitModels => this.collection();
}

const OutletVisitModelSchema = CollectionSchema(
  name: r'OutletVisitModel',
  id: 1909673386254107785,
  properties: {
    r'actualClockIn': PropertySchema(
      id: 0,
      name: r'actualClockIn',
      type: IsarType.dateTime,
    ),
    r'actualClockOut': PropertySchema(
      id: 1,
      name: r'actualClockOut',
      type: IsarType.dateTime,
    ),
    r'allocatedMinutes': PropertySchema(
      id: 2,
      name: r'allocatedMinutes',
      type: IsarType.long,
    ),
    r'clockInAccuracyMeters': PropertySchema(
      id: 3,
      name: r'clockInAccuracyMeters',
      type: IsarType.double,
    ),
    r'clockInDistanceMeters': PropertySchema(
      id: 4,
      name: r'clockInDistanceMeters',
      type: IsarType.double,
    ),
    r'clockInLatitude': PropertySchema(
      id: 5,
      name: r'clockInLatitude',
      type: IsarType.double,
    ),
    r'clockInLongitude': PropertySchema(
      id: 6,
      name: r'clockInLongitude',
      type: IsarType.double,
    ),
    r'clockInNotes': PropertySchema(
      id: 7,
      name: r'clockInNotes',
      type: IsarType.string,
    ),
    r'clockOutAccuracyMeters': PropertySchema(
      id: 8,
      name: r'clockOutAccuracyMeters',
      type: IsarType.double,
    ),
    r'clockOutDistanceMeters': PropertySchema(
      id: 9,
      name: r'clockOutDistanceMeters',
      type: IsarType.double,
    ),
    r'clockOutLatitude': PropertySchema(
      id: 10,
      name: r'clockOutLatitude',
      type: IsarType.double,
    ),
    r'clockOutLongitude': PropertySchema(
      id: 11,
      name: r'clockOutLongitude',
      type: IsarType.double,
    ),
    r'clockOutNotes': PropertySchema(
      id: 12,
      name: r'clockOutNotes',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 13,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dailyRouteLocalId': PropertySchema(
      id: 14,
      name: r'dailyRouteLocalId',
      type: IsarType.string,
    ),
    r'dailyRouteServerId': PropertySchema(
      id: 15,
      name: r'dailyRouteServerId',
      type: IsarType.string,
    ),
    r'geofenceOverride': PropertySchema(
      id: 16,
      name: r'geofenceOverride',
      type: IsarType.bool,
    ),
    r'geofenceRadiusMeters': PropertySchema(
      id: 17,
      name: r'geofenceRadiusMeters',
      type: IsarType.double,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 18,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'localId': PropertySchema(id: 19, name: r'localId', type: IsarType.string),
    r'mappingFootprintId': PropertySchema(
      id: 20,
      name: r'mappingFootprintId',
      type: IsarType.long,
    ),
    r'mappingFootprintStatus': PropertySchema(
      id: 21,
      name: r'mappingFootprintStatus',
      type: IsarType.string,
    ),
    r'mappingRequestId': PropertySchema(
      id: 22,
      name: r'mappingRequestId',
      type: IsarType.long,
    ),
    r'outletCode': PropertySchema(
      id: 23,
      name: r'outletCode',
      type: IsarType.string,
    ),
    r'outletId': PropertySchema(
      id: 24,
      name: r'outletId',
      type: IsarType.string,
    ),
    r'outletLatitude': PropertySchema(
      id: 25,
      name: r'outletLatitude',
      type: IsarType.double,
    ),
    r'outletLongitude': PropertySchema(
      id: 26,
      name: r'outletLongitude',
      type: IsarType.double,
    ),
    r'outletName': PropertySchema(
      id: 27,
      name: r'outletName',
      type: IsarType.string,
    ),
    r'overrideRequestId': PropertySchema(
      id: 28,
      name: r'overrideRequestId',
      type: IsarType.string,
    ),
    r'scheduleServerId': PropertySchema(
      id: 29,
      name: r'scheduleServerId',
      type: IsarType.string,
    ),
    r'scheduledClockIn': PropertySchema(
      id: 30,
      name: r'scheduledClockIn',
      type: IsarType.string,
    ),
    r'scheduledClockOut': PropertySchema(
      id: 31,
      name: r'scheduledClockOut',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 32,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'skipNotes': PropertySchema(
      id: 33,
      name: r'skipNotes',
      type: IsarType.string,
    ),
    r'skipReasonCode': PropertySchema(
      id: 34,
      name: r'skipReasonCode',
      type: IsarType.string,
    ),
    r'skipReasonId': PropertySchema(
      id: 35,
      name: r'skipReasonId',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 36,
      name: r'status',
      type: IsarType.string,
      enumMap: _OutletVisitModelstatusEnumValueMap,
    ),
    r'syncError': PropertySchema(
      id: 37,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'syncState': PropertySchema(
      id: 38,
      name: r'syncState',
      type: IsarType.string,
      enumMap: _OutletVisitModelsyncStateEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 39,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'visitDurationMins': PropertySchema(
      id: 40,
      name: r'visitDurationMins',
      type: IsarType.long,
    ),
    r'visitNotes': PropertySchema(
      id: 41,
      name: r'visitNotes',
      type: IsarType.string,
    ),
    r'visitOrder': PropertySchema(
      id: 42,
      name: r'visitOrder',
      type: IsarType.long,
    ),
    r'visitPriority': PropertySchema(
      id: 43,
      name: r'visitPriority',
      type: IsarType.long,
    ),
    r'visitType': PropertySchema(
      id: 44,
      name: r'visitType',
      type: IsarType.string,
      enumMap: _OutletVisitModelvisitTypeEnumValueMap,
    ),
  },

  estimateSize: _outletVisitModelEstimateSize,
  serialize: _outletVisitModelSerialize,
  deserialize: _outletVisitModelDeserialize,
  deserializeProp: _outletVisitModelDeserializeProp,
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
    r'dailyRouteLocalId': IndexSchema(
      id: -6838450319727359219,
      name: r'dailyRouteLocalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dailyRouteLocalId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'outletId': IndexSchema(
      id: -1197630030247531768,
      name: r'outletId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'outletId',
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

  getId: _outletVisitModelGetId,
  getLinks: _outletVisitModelGetLinks,
  attach: _outletVisitModelAttach,
  version: '3.3.2',
);

int _outletVisitModelEstimateSize(
  OutletVisitModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clockInNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.clockOutNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dailyRouteLocalId.length * 3;
  {
    final value = object.dailyRouteServerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localId.length * 3;
  {
    final value = object.mappingFootprintStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.outletCode.length * 3;
  bytesCount += 3 + object.outletId.length * 3;
  bytesCount += 3 + object.outletName.length * 3;
  {
    final value = object.overrideRequestId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scheduleServerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scheduledClockIn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scheduledClockOut;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.skipNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.skipReasonCode;
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
  {
    final value = object.visitNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.visitType.name.length * 3;
  return bytesCount;
}

void _outletVisitModelSerialize(
  OutletVisitModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualClockIn);
  writer.writeDateTime(offsets[1], object.actualClockOut);
  writer.writeLong(offsets[2], object.allocatedMinutes);
  writer.writeDouble(offsets[3], object.clockInAccuracyMeters);
  writer.writeDouble(offsets[4], object.clockInDistanceMeters);
  writer.writeDouble(offsets[5], object.clockInLatitude);
  writer.writeDouble(offsets[6], object.clockInLongitude);
  writer.writeString(offsets[7], object.clockInNotes);
  writer.writeDouble(offsets[8], object.clockOutAccuracyMeters);
  writer.writeDouble(offsets[9], object.clockOutDistanceMeters);
  writer.writeDouble(offsets[10], object.clockOutLatitude);
  writer.writeDouble(offsets[11], object.clockOutLongitude);
  writer.writeString(offsets[12], object.clockOutNotes);
  writer.writeDateTime(offsets[13], object.createdAt);
  writer.writeString(offsets[14], object.dailyRouteLocalId);
  writer.writeString(offsets[15], object.dailyRouteServerId);
  writer.writeBool(offsets[16], object.geofenceOverride);
  writer.writeDouble(offsets[17], object.geofenceRadiusMeters);
  writer.writeDateTime(offsets[18], object.lastSyncedAt);
  writer.writeString(offsets[19], object.localId);
  writer.writeLong(offsets[20], object.mappingFootprintId);
  writer.writeString(offsets[21], object.mappingFootprintStatus);
  writer.writeLong(offsets[22], object.mappingRequestId);
  writer.writeString(offsets[23], object.outletCode);
  writer.writeString(offsets[24], object.outletId);
  writer.writeDouble(offsets[25], object.outletLatitude);
  writer.writeDouble(offsets[26], object.outletLongitude);
  writer.writeString(offsets[27], object.outletName);
  writer.writeString(offsets[28], object.overrideRequestId);
  writer.writeString(offsets[29], object.scheduleServerId);
  writer.writeString(offsets[30], object.scheduledClockIn);
  writer.writeString(offsets[31], object.scheduledClockOut);
  writer.writeString(offsets[32], object.serverId);
  writer.writeString(offsets[33], object.skipNotes);
  writer.writeString(offsets[34], object.skipReasonCode);
  writer.writeLong(offsets[35], object.skipReasonId);
  writer.writeString(offsets[36], object.status.name);
  writer.writeString(offsets[37], object.syncError);
  writer.writeString(offsets[38], object.syncState.name);
  writer.writeDateTime(offsets[39], object.updatedAt);
  writer.writeLong(offsets[40], object.visitDurationMins);
  writer.writeString(offsets[41], object.visitNotes);
  writer.writeLong(offsets[42], object.visitOrder);
  writer.writeLong(offsets[43], object.visitPriority);
  writer.writeString(offsets[44], object.visitType.name);
}

OutletVisitModel _outletVisitModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutletVisitModel();
  object.actualClockIn = reader.readDateTimeOrNull(offsets[0]);
  object.actualClockOut = reader.readDateTimeOrNull(offsets[1]);
  object.allocatedMinutes = reader.readLong(offsets[2]);
  object.clockInAccuracyMeters = reader.readDoubleOrNull(offsets[3]);
  object.clockInDistanceMeters = reader.readDoubleOrNull(offsets[4]);
  object.clockInLatitude = reader.readDoubleOrNull(offsets[5]);
  object.clockInLongitude = reader.readDoubleOrNull(offsets[6]);
  object.clockInNotes = reader.readStringOrNull(offsets[7]);
  object.clockOutAccuracyMeters = reader.readDoubleOrNull(offsets[8]);
  object.clockOutDistanceMeters = reader.readDoubleOrNull(offsets[9]);
  object.clockOutLatitude = reader.readDoubleOrNull(offsets[10]);
  object.clockOutLongitude = reader.readDoubleOrNull(offsets[11]);
  object.clockOutNotes = reader.readStringOrNull(offsets[12]);
  object.createdAt = reader.readDateTime(offsets[13]);
  object.dailyRouteLocalId = reader.readString(offsets[14]);
  object.dailyRouteServerId = reader.readStringOrNull(offsets[15]);
  object.geofenceOverride = reader.readBool(offsets[16]);
  object.geofenceRadiusMeters = reader.readDouble(offsets[17]);
  object.id = id;
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[18]);
  object.localId = reader.readString(offsets[19]);
  object.mappingFootprintId = reader.readLongOrNull(offsets[20]);
  object.mappingFootprintStatus = reader.readStringOrNull(offsets[21]);
  object.mappingRequestId = reader.readLongOrNull(offsets[22]);
  object.outletCode = reader.readString(offsets[23]);
  object.outletId = reader.readString(offsets[24]);
  object.outletLatitude = reader.readDouble(offsets[25]);
  object.outletLongitude = reader.readDouble(offsets[26]);
  object.outletName = reader.readString(offsets[27]);
  object.overrideRequestId = reader.readStringOrNull(offsets[28]);
  object.scheduleServerId = reader.readStringOrNull(offsets[29]);
  object.scheduledClockIn = reader.readStringOrNull(offsets[30]);
  object.scheduledClockOut = reader.readStringOrNull(offsets[31]);
  object.serverId = reader.readStringOrNull(offsets[32]);
  object.skipNotes = reader.readStringOrNull(offsets[33]);
  object.skipReasonCode = reader.readStringOrNull(offsets[34]);
  object.skipReasonId = reader.readLongOrNull(offsets[35]);
  object.status =
      _OutletVisitModelstatusValueEnumMap[reader.readStringOrNull(
        offsets[36],
      )] ??
      VisitStatusModel.pending;
  object.syncError = reader.readStringOrNull(offsets[37]);
  object.syncState =
      _OutletVisitModelsyncStateValueEnumMap[reader.readStringOrNull(
        offsets[38],
      )] ??
      SyncStateModel.localOnly;
  object.updatedAt = reader.readDateTime(offsets[39]);
  object.visitDurationMins = reader.readLongOrNull(offsets[40]);
  object.visitNotes = reader.readStringOrNull(offsets[41]);
  object.visitOrder = reader.readLong(offsets[42]);
  object.visitPriority = reader.readLong(offsets[43]);
  object.visitType =
      _OutletVisitModelvisitTypeValueEnumMap[reader.readStringOrNull(
        offsets[44],
      )] ??
      VisitTypeModel.scheduled;
  return object;
}

P _outletVisitModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readLongOrNull(offset)) as P;
    case 36:
      return (_OutletVisitModelstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              VisitStatusModel.pending)
          as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (_OutletVisitModelsyncStateValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SyncStateModel.localOnly)
          as P;
    case 39:
      return (reader.readDateTime(offset)) as P;
    case 40:
      return (reader.readLongOrNull(offset)) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    case 42:
      return (reader.readLong(offset)) as P;
    case 43:
      return (reader.readLong(offset)) as P;
    case 44:
      return (_OutletVisitModelvisitTypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              VisitTypeModel.scheduled)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _OutletVisitModelstatusEnumValueMap = {
  r'pending': r'pending',
  r'inProgress': r'inProgress',
  r'completed': r'completed',
  r'skipped': r'skipped',
};
const _OutletVisitModelstatusValueEnumMap = {
  r'pending': VisitStatusModel.pending,
  r'inProgress': VisitStatusModel.inProgress,
  r'completed': VisitStatusModel.completed,
  r'skipped': VisitStatusModel.skipped,
};
const _OutletVisitModelsyncStateEnumValueMap = {
  r'localOnly': r'localOnly',
  r'syncing': r'syncing',
  r'synced': r'synced',
  r'syncFailed': r'syncFailed',
  r'needsAttention': r'needsAttention',
};
const _OutletVisitModelsyncStateValueEnumMap = {
  r'localOnly': SyncStateModel.localOnly,
  r'syncing': SyncStateModel.syncing,
  r'synced': SyncStateModel.synced,
  r'syncFailed': SyncStateModel.syncFailed,
  r'needsAttention': SyncStateModel.needsAttention,
};
const _OutletVisitModelvisitTypeEnumValueMap = {
  r'scheduled': r'scheduled',
  r'adHoc': r'adHoc',
};
const _OutletVisitModelvisitTypeValueEnumMap = {
  r'scheduled': VisitTypeModel.scheduled,
  r'adHoc': VisitTypeModel.adHoc,
};

Id _outletVisitModelGetId(OutletVisitModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _outletVisitModelGetLinks(OutletVisitModel object) {
  return [];
}

void _outletVisitModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  OutletVisitModel object,
) {
  object.id = id;
}

extension OutletVisitModelByIndex on IsarCollection<OutletVisitModel> {
  Future<OutletVisitModel?> getByLocalId(String localId) {
    return getByIndex(r'localId', [localId]);
  }

  OutletVisitModel? getByLocalIdSync(String localId) {
    return getByIndexSync(r'localId', [localId]);
  }

  Future<bool> deleteByLocalId(String localId) {
    return deleteByIndex(r'localId', [localId]);
  }

  bool deleteByLocalIdSync(String localId) {
    return deleteByIndexSync(r'localId', [localId]);
  }

  Future<List<OutletVisitModel?>> getAllByLocalId(List<String> localIdValues) {
    final values = localIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'localId', values);
  }

  List<OutletVisitModel?> getAllByLocalIdSync(List<String> localIdValues) {
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

  Future<Id> putByLocalId(OutletVisitModel object) {
    return putByIndex(r'localId', object);
  }

  Id putByLocalIdSync(OutletVisitModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'localId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLocalId(List<OutletVisitModel> objects) {
    return putAllByIndex(r'localId', objects);
  }

  List<Id> putAllByLocalIdSync(
    List<OutletVisitModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'localId', objects, saveLinks: saveLinks);
  }
}

extension OutletVisitModelQueryWhereSort
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QWhere> {
  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OutletVisitModelQueryWhere
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QWhereClause> {
  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  localIdEqualTo(String localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'localId', value: [localId]),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  dailyRouteLocalIdEqualTo(String dailyRouteLocalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'dailyRouteLocalId',
          value: [dailyRouteLocalId],
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  dailyRouteLocalIdNotEqualTo(String dailyRouteLocalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dailyRouteLocalId',
                lower: [],
                upper: [dailyRouteLocalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dailyRouteLocalId',
                lower: [dailyRouteLocalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dailyRouteLocalId',
                lower: [dailyRouteLocalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dailyRouteLocalId',
                lower: [],
                upper: [dailyRouteLocalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  outletIdEqualTo(String outletId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'outletId', value: [outletId]),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  outletIdNotEqualTo(String outletId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [],
                upper: [outletId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [outletId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [outletId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'outletId',
                lower: [],
                upper: [outletId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  statusEqualTo(VisitStatusModel status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterWhereClause>
  statusNotEqualTo(VisitStatusModel status) {
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

extension OutletVisitModelQueryFilter
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QFilterCondition> {
  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'actualClockIn'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'actualClockIn'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockInEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'actualClockIn', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockInGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'actualClockIn',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockInLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'actualClockIn',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockInBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'actualClockIn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'actualClockOut'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'actualClockOut'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockOutEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'actualClockOut', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockOutGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'actualClockOut',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockOutLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'actualClockOut',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  actualClockOutBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'actualClockOut',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  allocatedMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'allocatedMinutes', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  allocatedMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'allocatedMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  allocatedMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'allocatedMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  allocatedMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'allocatedMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInAccuracyMetersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockInAccuracyMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInAccuracyMetersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockInAccuracyMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInAccuracyMetersEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInAccuracyMetersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInAccuracyMetersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInAccuracyMetersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInAccuracyMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInDistanceMetersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockInDistanceMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInDistanceMetersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockInDistanceMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInDistanceMetersEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInDistanceMetersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInDistanceMetersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInDistanceMetersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInDistanceMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockInLatitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockInLatitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLatitudeEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInLatitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockInLongitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockInLongitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLongitudeEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInLongitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockInNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockInNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockInNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockInNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockInNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockInNotes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clockInNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clockInNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clockInNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clockInNotes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockInNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockInNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'clockInNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutAccuracyMetersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutAccuracyMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutAccuracyMetersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutAccuracyMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutAccuracyMetersEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutAccuracyMetersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutAccuracyMetersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutAccuracyMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutAccuracyMetersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutAccuracyMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutDistanceMetersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutDistanceMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutDistanceMetersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutDistanceMeters'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutDistanceMetersEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutDistanceMetersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutDistanceMetersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutDistanceMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutDistanceMetersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutDistanceMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutLatitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutLatitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLatitudeEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutLatitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutLongitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutLongitude'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLongitudeEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutLongitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockOutNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockOutNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clockOutNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockOutNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockOutNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockOutNotes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clockOutNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clockOutNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clockOutNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clockOutNotes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockOutNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  clockOutNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'clockOutNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dailyRouteLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dailyRouteLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dailyRouteLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dailyRouteLocalId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dailyRouteLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dailyRouteLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dailyRouteLocalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dailyRouteLocalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dailyRouteLocalId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteLocalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dailyRouteLocalId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dailyRouteServerId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dailyRouteServerId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dailyRouteServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dailyRouteServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dailyRouteServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dailyRouteServerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dailyRouteServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dailyRouteServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dailyRouteServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dailyRouteServerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dailyRouteServerId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  dailyRouteServerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dailyRouteServerId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  geofenceOverrideEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'geofenceOverride', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  geofenceRadiusMetersEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'geofenceRadiusMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  geofenceRadiusMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'geofenceRadiusMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  geofenceRadiusMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'geofenceRadiusMeters',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  geofenceRadiusMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'geofenceRadiusMeters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  localIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  localIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mappingFootprintId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mappingFootprintId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mappingFootprintId', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mappingFootprintId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mappingFootprintId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mappingFootprintId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mappingFootprintStatus'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mappingFootprintStatus'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'mappingFootprintStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mappingFootprintStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mappingFootprintStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mappingFootprintStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'mappingFootprintStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'mappingFootprintStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'mappingFootprintStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'mappingFootprintStatus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mappingFootprintStatus', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingFootprintStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'mappingFootprintStatus',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingRequestIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mappingRequestId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingRequestIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mappingRequestId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingRequestIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mappingRequestId', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingRequestIdGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingRequestIdLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  mappingRequestIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLatitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLatitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLatitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletLatitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLatitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletLatitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLongitudeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLongitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLongitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletLongitude',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletLongitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletLongitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  outletNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'overrideRequestId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'overrideRequestId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'overrideRequestId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'overrideRequestId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'overrideRequestId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'overrideRequestId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'overrideRequestId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'overrideRequestId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'overrideRequestId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'overrideRequestId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'overrideRequestId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  overrideRequestIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'overrideRequestId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scheduleServerId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scheduleServerId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scheduleServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scheduleServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scheduleServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scheduleServerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'scheduleServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'scheduleServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'scheduleServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'scheduleServerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduleServerId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduleServerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scheduleServerId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scheduledClockIn'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scheduledClockIn'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scheduledClockIn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scheduledClockIn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scheduledClockIn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scheduledClockIn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'scheduledClockIn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'scheduledClockIn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'scheduledClockIn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'scheduledClockIn',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduledClockIn', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockInIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scheduledClockIn', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scheduledClockOut'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scheduledClockOut'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scheduledClockOut',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scheduledClockOut',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scheduledClockOut',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scheduledClockOut',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'scheduledClockOut',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'scheduledClockOut',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'scheduledClockOut',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'scheduledClockOut',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduledClockOut', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  scheduledClockOutIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scheduledClockOut', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'skipNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'skipNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'skipNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skipNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skipNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skipNotes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'skipNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'skipNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'skipNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'skipNotes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skipNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'skipNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'skipReasonCode'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'skipReasonCode'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'skipReasonCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skipReasonCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skipReasonCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skipReasonCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'skipReasonCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'skipReasonCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'skipReasonCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'skipReasonCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skipReasonCode', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'skipReasonCode', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'skipReasonId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'skipReasonId'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skipReasonId', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skipReasonId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skipReasonId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  skipReasonIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skipReasonId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  statusEqualTo(VisitStatusModel value, {bool caseSensitive = true}) {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  statusGreaterThan(
    VisitStatusModel value, {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  statusLessThan(
    VisitStatusModel value, {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  statusBetween(
    VisitStatusModel lower,
    VisitStatusModel upper, {
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'syncError'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncError', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  syncStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  syncStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncState', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
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

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitDurationMinsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visitDurationMins'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitDurationMinsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visitDurationMins'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitDurationMinsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitDurationMins', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitDurationMinsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitDurationMins',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitDurationMinsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitDurationMins',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitDurationMinsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitDurationMins',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visitNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visitNotes'),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'visitNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitNotes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'visitNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'visitNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'visitNotes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'visitNotes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'visitNotes', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitOrder', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitOrderGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitOrder',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitOrderLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitOrder',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitOrder',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitPriorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitPriority', value: value),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitPriorityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitPriority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitPriorityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitPriority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitPriorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitPriority',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeEqualTo(VisitTypeModel value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'visitType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeGreaterThan(
    VisitTypeModel value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visitType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeLessThan(
    VisitTypeModel value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visitType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeBetween(
    VisitTypeModel lower,
    VisitTypeModel upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visitType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'visitType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'visitType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'visitType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'visitType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitType', value: ''),
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterFilterCondition>
  visitTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'visitType', value: ''),
      );
    });
  }
}

extension OutletVisitModelQueryObject
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QFilterCondition> {}

extension OutletVisitModelQueryLinks
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QFilterCondition> {}

extension OutletVisitModelQuerySortBy
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QSortBy> {
  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByActualClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockIn', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByActualClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockIn', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByActualClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockOut', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByActualClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockOut', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByAllocatedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInDistanceMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInDistanceMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockInNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutDistanceMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutDistanceMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByClockOutNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByDailyRouteLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteLocalId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByDailyRouteLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteLocalId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByDailyRouteServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteServerId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByDailyRouteServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteServerId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByGeofenceOverride() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceOverride', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByGeofenceOverrideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceOverride', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByGeofenceRadiusMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByGeofenceRadiusMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByMappingFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByMappingFootprintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByMappingFootprintStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintStatus', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByMappingFootprintStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintStatus', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByMappingRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByMappingRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOverrideRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overrideRequestId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByOverrideRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overrideRequestId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByScheduleServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleServerId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByScheduleServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleServerId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByScheduledClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByScheduledClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByScheduledClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByScheduledClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySkipNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySkipNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySkipReasonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonCode', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySkipReasonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonCode', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySkipReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySkipReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitDurationMins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitDurationMins', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitDurationMinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitDurationMins', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitType', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  sortByVisitTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitType', Sort.desc);
    });
  }
}

extension OutletVisitModelQuerySortThenBy
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QSortThenBy> {
  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByActualClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockIn', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByActualClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockIn', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByActualClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockOut', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByActualClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualClockOut', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByAllocatedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInAccuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInDistanceMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInDistanceMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLatitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInLongitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockInNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockInNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutAccuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutDistanceMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutDistanceMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLatitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutLongitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByClockOutNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOutNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByDailyRouteLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteLocalId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByDailyRouteLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteLocalId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByDailyRouteServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteServerId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByDailyRouteServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyRouteServerId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByGeofenceOverride() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceOverride', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByGeofenceOverrideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceOverride', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByGeofenceRadiusMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByGeofenceRadiusMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geofenceRadiusMeters', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByMappingFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByMappingFootprintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByMappingFootprintStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintStatus', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByMappingFootprintStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFootprintStatus', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByMappingRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByMappingRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingRequestId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOverrideRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overrideRequestId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByOverrideRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overrideRequestId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByScheduleServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleServerId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByScheduleServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleServerId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByScheduledClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByScheduledClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByScheduledClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByScheduledClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySkipNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySkipNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySkipReasonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonCode', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySkipReasonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonCode', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySkipReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonId', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySkipReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipReasonId', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySyncState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenBySyncStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncState', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitDurationMins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitDurationMins', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitDurationMinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitDurationMins', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitNotes', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitNotes', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.desc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitType', Sort.asc);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QAfterSortBy>
  thenByVisitTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitType', Sort.desc);
    });
  }
}

extension OutletVisitModelQueryWhereDistinct
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct> {
  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByActualClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualClockIn');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByActualClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualClockOut');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allocatedMinutes');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockInAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInAccuracyMeters');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockInDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInDistanceMeters');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockInLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInLatitude');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockInLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInLongitude');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockInNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockInNotes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockOutAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutAccuracyMeters');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockOutDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutDistanceMeters');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockOutLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutLatitude');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockOutLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOutLongitude');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByClockOutNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'clockOutNotes',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByDailyRouteLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'dailyRouteLocalId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByDailyRouteServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'dailyRouteServerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByGeofenceOverride() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geofenceOverride');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByGeofenceRadiusMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geofenceRadiusMeters');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByLocalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByMappingFootprintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mappingFootprintId');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByMappingFootprintStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'mappingFootprintStatus',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByMappingRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mappingRequestId');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByOutletCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByOutletId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByOutletLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletLatitude');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByOutletLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletLongitude');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByOutletName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByOverrideRequestId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'overrideRequestId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByScheduleServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'scheduleServerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByScheduledClockIn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'scheduledClockIn',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByScheduledClockOut({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'scheduledClockOut',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctBySkipNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skipNotes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctBySkipReasonCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'skipReasonCode',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctBySkipReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skipReasonId');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct> distinctByStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctBySyncError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctBySyncState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByVisitDurationMins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitDurationMins');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByVisitNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitNotes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByVisitOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitOrder');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByVisitPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitPriority');
    });
  }

  QueryBuilder<OutletVisitModel, OutletVisitModel, QDistinct>
  distinctByVisitType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitType', caseSensitive: caseSensitive);
    });
  }
}

extension OutletVisitModelQueryProperty
    on QueryBuilder<OutletVisitModel, OutletVisitModel, QQueryProperty> {
  QueryBuilder<OutletVisitModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutletVisitModel, DateTime?, QQueryOperations>
  actualClockInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualClockIn');
    });
  }

  QueryBuilder<OutletVisitModel, DateTime?, QQueryOperations>
  actualClockOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualClockOut');
    });
  }

  QueryBuilder<OutletVisitModel, int, QQueryOperations>
  allocatedMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allocatedMinutes');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockInAccuracyMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInAccuracyMeters');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockInDistanceMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInDistanceMeters');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockInLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInLatitude');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockInLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInLongitude');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  clockInNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockInNotes');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockOutAccuracyMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutAccuracyMeters');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockOutDistanceMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutDistanceMeters');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockOutLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutLatitude');
    });
  }

  QueryBuilder<OutletVisitModel, double?, QQueryOperations>
  clockOutLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutLongitude');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  clockOutNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOutNotes');
    });
  }

  QueryBuilder<OutletVisitModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OutletVisitModel, String, QQueryOperations>
  dailyRouteLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyRouteLocalId');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  dailyRouteServerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyRouteServerId');
    });
  }

  QueryBuilder<OutletVisitModel, bool, QQueryOperations>
  geofenceOverrideProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geofenceOverride');
    });
  }

  QueryBuilder<OutletVisitModel, double, QQueryOperations>
  geofenceRadiusMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geofenceRadiusMeters');
    });
  }

  QueryBuilder<OutletVisitModel, DateTime?, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<OutletVisitModel, String, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<OutletVisitModel, int?, QQueryOperations>
  mappingFootprintIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mappingFootprintId');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  mappingFootprintStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mappingFootprintStatus');
    });
  }

  QueryBuilder<OutletVisitModel, int?, QQueryOperations>
  mappingRequestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mappingRequestId');
    });
  }

  QueryBuilder<OutletVisitModel, String, QQueryOperations>
  outletCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletCode');
    });
  }

  QueryBuilder<OutletVisitModel, String, QQueryOperations> outletIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletId');
    });
  }

  QueryBuilder<OutletVisitModel, double, QQueryOperations>
  outletLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletLatitude');
    });
  }

  QueryBuilder<OutletVisitModel, double, QQueryOperations>
  outletLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletLongitude');
    });
  }

  QueryBuilder<OutletVisitModel, String, QQueryOperations>
  outletNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletName');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  overrideRequestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overrideRequestId');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  scheduleServerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleServerId');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  scheduledClockInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledClockIn');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  scheduledClockOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledClockOut');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  skipNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skipNotes');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  skipReasonCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skipReasonCode');
    });
  }

  QueryBuilder<OutletVisitModel, int?, QQueryOperations>
  skipReasonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skipReasonId');
    });
  }

  QueryBuilder<OutletVisitModel, VisitStatusModel, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<OutletVisitModel, SyncStateModel, QQueryOperations>
  syncStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncState');
    });
  }

  QueryBuilder<OutletVisitModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<OutletVisitModel, int?, QQueryOperations>
  visitDurationMinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitDurationMins');
    });
  }

  QueryBuilder<OutletVisitModel, String?, QQueryOperations>
  visitNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitNotes');
    });
  }

  QueryBuilder<OutletVisitModel, int, QQueryOperations> visitOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitOrder');
    });
  }

  QueryBuilder<OutletVisitModel, int, QQueryOperations>
  visitPriorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitPriority');
    });
  }

  QueryBuilder<OutletVisitModel, VisitTypeModel, QQueryOperations>
  visitTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitType');
    });
  }
}
