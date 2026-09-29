// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_schedule_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVisitScheduleModelCollection on Isar {
  IsarCollection<VisitScheduleModel> get visitScheduleModels =>
      this.collection();
}

const VisitScheduleModelSchema = CollectionSchema(
  name: r'VisitScheduleModel',
  id: -2701620214413338957,
  properties: {
    r'allocatedMinutes': PropertySchema(
      id: 0,
      name: r'allocatedMinutes',
      type: IsarType.long,
    ),
    r'dayOfWeek': PropertySchema(
      id: 1,
      name: r'dayOfWeek',
      type: IsarType.long,
    ),
    r'effectiveFrom': PropertySchema(
      id: 2,
      name: r'effectiveFrom',
      type: IsarType.dateTime,
    ),
    r'effectiveTo': PropertySchema(
      id: 3,
      name: r'effectiveTo',
      type: IsarType.dateTime,
    ),
    r'isActive': PropertySchema(id: 4, name: r'isActive', type: IsarType.bool),
    r'lastSyncedAt': PropertySchema(
      id: 5,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'outletAddress': PropertySchema(
      id: 6,
      name: r'outletAddress',
      type: IsarType.string,
    ),
    r'outletCode': PropertySchema(
      id: 7,
      name: r'outletCode',
      type: IsarType.string,
    ),
    r'outletId': PropertySchema(
      id: 8,
      name: r'outletId',
      type: IsarType.string,
    ),
    r'outletLatitude': PropertySchema(
      id: 9,
      name: r'outletLatitude',
      type: IsarType.double,
    ),
    r'outletLongitude': PropertySchema(
      id: 10,
      name: r'outletLongitude',
      type: IsarType.double,
    ),
    r'outletName': PropertySchema(
      id: 11,
      name: r'outletName',
      type: IsarType.string,
    ),
    r'salesAgentServerId': PropertySchema(
      id: 12,
      name: r'salesAgentServerId',
      type: IsarType.string,
    ),
    r'scheduledClockIn': PropertySchema(
      id: 13,
      name: r'scheduledClockIn',
      type: IsarType.string,
    ),
    r'scheduledClockOut': PropertySchema(
      id: 14,
      name: r'scheduledClockOut',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 15,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'visitOrder': PropertySchema(
      id: 16,
      name: r'visitOrder',
      type: IsarType.long,
    ),
    r'visitPriority': PropertySchema(
      id: 17,
      name: r'visitPriority',
      type: IsarType.long,
    ),
  },

  estimateSize: _visitScheduleModelEstimateSize,
  serialize: _visitScheduleModelSerialize,
  deserialize: _visitScheduleModelDeserialize,
  deserializeProp: _visitScheduleModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'salesAgentServerId': IndexSchema(
      id: 6657415511504365680,
      name: r'salesAgentServerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'salesAgentServerId',
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
    r'dayOfWeek': IndexSchema(
      id: -5516657708462385134,
      name: r'dayOfWeek',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dayOfWeek',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _visitScheduleModelGetId,
  getLinks: _visitScheduleModelGetLinks,
  attach: _visitScheduleModelAttach,
  version: '3.3.2',
);

int _visitScheduleModelEstimateSize(
  VisitScheduleModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.outletAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.outletCode.length * 3;
  bytesCount += 3 + object.outletId.length * 3;
  bytesCount += 3 + object.outletName.length * 3;
  bytesCount += 3 + object.salesAgentServerId.length * 3;
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
  bytesCount += 3 + object.serverId.length * 3;
  return bytesCount;
}

void _visitScheduleModelSerialize(
  VisitScheduleModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.allocatedMinutes);
  writer.writeLong(offsets[1], object.dayOfWeek);
  writer.writeDateTime(offsets[2], object.effectiveFrom);
  writer.writeDateTime(offsets[3], object.effectiveTo);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeDateTime(offsets[5], object.lastSyncedAt);
  writer.writeString(offsets[6], object.outletAddress);
  writer.writeString(offsets[7], object.outletCode);
  writer.writeString(offsets[8], object.outletId);
  writer.writeDouble(offsets[9], object.outletLatitude);
  writer.writeDouble(offsets[10], object.outletLongitude);
  writer.writeString(offsets[11], object.outletName);
  writer.writeString(offsets[12], object.salesAgentServerId);
  writer.writeString(offsets[13], object.scheduledClockIn);
  writer.writeString(offsets[14], object.scheduledClockOut);
  writer.writeString(offsets[15], object.serverId);
  writer.writeLong(offsets[16], object.visitOrder);
  writer.writeLong(offsets[17], object.visitPriority);
}

VisitScheduleModel _visitScheduleModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisitScheduleModel();
  object.allocatedMinutes = reader.readLong(offsets[0]);
  object.dayOfWeek = reader.readLong(offsets[1]);
  object.effectiveFrom = reader.readDateTime(offsets[2]);
  object.effectiveTo = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.isActive = reader.readBool(offsets[4]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[5]);
  object.outletAddress = reader.readStringOrNull(offsets[6]);
  object.outletCode = reader.readString(offsets[7]);
  object.outletId = reader.readString(offsets[8]);
  object.outletLatitude = reader.readDouble(offsets[9]);
  object.outletLongitude = reader.readDouble(offsets[10]);
  object.outletName = reader.readString(offsets[11]);
  object.salesAgentServerId = reader.readString(offsets[12]);
  object.scheduledClockIn = reader.readStringOrNull(offsets[13]);
  object.scheduledClockOut = reader.readStringOrNull(offsets[14]);
  object.serverId = reader.readString(offsets[15]);
  object.visitOrder = reader.readLong(offsets[16]);
  object.visitPriority = reader.readLong(offsets[17]);
  return object;
}

P _visitScheduleModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _visitScheduleModelGetId(VisitScheduleModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _visitScheduleModelGetLinks(
  VisitScheduleModel object,
) {
  return [];
}

void _visitScheduleModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  VisitScheduleModel object,
) {
  object.id = id;
}

extension VisitScheduleModelByIndex on IsarCollection<VisitScheduleModel> {
  Future<VisitScheduleModel?> getByServerId(String serverId) {
    return getByIndex(r'serverId', [serverId]);
  }

  VisitScheduleModel? getByServerIdSync(String serverId) {
    return getByIndexSync(r'serverId', [serverId]);
  }

  Future<bool> deleteByServerId(String serverId) {
    return deleteByIndex(r'serverId', [serverId]);
  }

  bool deleteByServerIdSync(String serverId) {
    return deleteByIndexSync(r'serverId', [serverId]);
  }

  Future<List<VisitScheduleModel?>> getAllByServerId(
    List<String> serverIdValues,
  ) {
    final values = serverIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'serverId', values);
  }

  List<VisitScheduleModel?> getAllByServerIdSync(List<String> serverIdValues) {
    final values = serverIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'serverId', values);
  }

  Future<int> deleteAllByServerId(List<String> serverIdValues) {
    final values = serverIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'serverId', values);
  }

  int deleteAllByServerIdSync(List<String> serverIdValues) {
    final values = serverIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'serverId', values);
  }

  Future<Id> putByServerId(VisitScheduleModel object) {
    return putByIndex(r'serverId', object);
  }

  Id putByServerIdSync(VisitScheduleModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'serverId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByServerId(List<VisitScheduleModel> objects) {
    return putAllByIndex(r'serverId', objects);
  }

  List<Id> putAllByServerIdSync(
    List<VisitScheduleModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'serverId', objects, saveLinks: saveLinks);
  }
}

extension VisitScheduleModelQueryWhereSort
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QWhere> {
  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhere>
  anyDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dayOfWeek'),
      );
    });
  }
}

extension VisitScheduleModelQueryWhere
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QWhereClause> {
  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  serverIdEqualTo(String serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  serverIdNotEqualTo(String serverId) {
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  salesAgentServerIdEqualTo(String salesAgentServerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'salesAgentServerId',
          value: [salesAgentServerId],
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  salesAgentServerIdNotEqualTo(String salesAgentServerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentServerId',
                lower: [],
                upper: [salesAgentServerId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentServerId',
                lower: [salesAgentServerId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentServerId',
                lower: [salesAgentServerId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'salesAgentServerId',
                lower: [],
                upper: [salesAgentServerId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  outletIdEqualTo(String outletId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'outletId', value: [outletId]),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  dayOfWeekEqualTo(int dayOfWeek) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'dayOfWeek', value: [dayOfWeek]),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  dayOfWeekNotEqualTo(int dayOfWeek) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dayOfWeek',
                lower: [],
                upper: [dayOfWeek],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dayOfWeek',
                lower: [dayOfWeek],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dayOfWeek',
                lower: [dayOfWeek],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dayOfWeek',
                lower: [],
                upper: [dayOfWeek],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  dayOfWeekGreaterThan(int dayOfWeek, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dayOfWeek',
          lower: [dayOfWeek],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  dayOfWeekLessThan(int dayOfWeek, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dayOfWeek',
          lower: [],
          upper: [dayOfWeek],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterWhereClause>
  dayOfWeekBetween(
    int lowerDayOfWeek,
    int upperDayOfWeek, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dayOfWeek',
          lower: [lowerDayOfWeek],
          includeLower: includeLower,
          upper: [upperDayOfWeek],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension VisitScheduleModelQueryFilter
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QFilterCondition> {
  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  allocatedMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'allocatedMinutes', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  dayOfWeekEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dayOfWeek', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  dayOfWeekGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dayOfWeek',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  dayOfWeekLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dayOfWeek',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  dayOfWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dayOfWeek',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveFromEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'effectiveFrom', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveFromGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'effectiveFrom',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveFromLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'effectiveFrom',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveFromBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'effectiveFrom',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'effectiveTo'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'effectiveTo'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveToEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'effectiveTo', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveToGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'effectiveTo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveToLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'effectiveTo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  effectiveToBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'effectiveTo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'outletAddress'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'outletAddress'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outletAddress',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outletAddress',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outletAddress',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outletAddress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'outletAddress',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'outletAddress',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'outletAddress',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'outletAddress',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletAddress', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletAddress', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletCode', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletId', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  outletNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'outletName', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'salesAgentServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'salesAgentServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'salesAgentServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'salesAgentServerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'salesAgentServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'salesAgentServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'salesAgentServerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'salesAgentServerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'salesAgentServerId', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  salesAgentServerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'salesAgentServerId', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scheduledClockIn'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scheduledClockIn'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockInIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduledClockIn', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockInIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scheduledClockIn', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scheduledClockOut'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scheduledClockOut'),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockOutIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduledClockOut', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  scheduledClockOutIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scheduledClockOut', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  serverIdEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  serverIdGreaterThan(
    String value, {
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  serverIdLessThan(
    String value, {
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  serverIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  visitOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitOrder', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
  visitPriorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visitPriority', value: value),
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterFilterCondition>
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
}

extension VisitScheduleModelQueryObject
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QFilterCondition> {}

extension VisitScheduleModelQueryLinks
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QFilterCondition> {}

extension VisitScheduleModelQuerySortBy
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QSortBy> {
  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByAllocatedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByEffectiveFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByEffectiveToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletAddress', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletAddress', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortBySalesAgentServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentServerId', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortBySalesAgentServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentServerId', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByScheduledClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByScheduledClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByScheduledClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByScheduledClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByVisitOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByVisitOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByVisitPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  sortByVisitPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.desc);
    });
  }
}

extension VisitScheduleModelQuerySortThenBy
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QSortThenBy> {
  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByAllocatedMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedMinutes', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByEffectiveFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFrom', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByEffectiveToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveTo', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletAddress', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletAddress', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletCode', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletId', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLatitude', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletLongitude', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByOutletNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outletName', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenBySalesAgentServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentServerId', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenBySalesAgentServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesAgentServerId', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByScheduledClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByScheduledClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockIn', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByScheduledClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByScheduledClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledClockOut', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByVisitOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByVisitOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitOrder', Sort.desc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByVisitPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.asc);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QAfterSortBy>
  thenByVisitPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitPriority', Sort.desc);
    });
  }
}

extension VisitScheduleModelQueryWhereDistinct
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct> {
  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByAllocatedMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allocatedMinutes');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfWeek');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByEffectiveFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveFrom');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByEffectiveTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveTo');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByOutletAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'outletAddress',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByOutletCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByOutletId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByOutletLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletLatitude');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByOutletLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletLongitude');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByOutletName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outletName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctBySalesAgentServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'salesAgentServerId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByScheduledClockIn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'scheduledClockIn',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByScheduledClockOut({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'scheduledClockOut',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByVisitOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitOrder');
    });
  }

  QueryBuilder<VisitScheduleModel, VisitScheduleModel, QDistinct>
  distinctByVisitPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitPriority');
    });
  }
}

extension VisitScheduleModelQueryProperty
    on QueryBuilder<VisitScheduleModel, VisitScheduleModel, QQueryProperty> {
  QueryBuilder<VisitScheduleModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VisitScheduleModel, int, QQueryOperations>
  allocatedMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allocatedMinutes');
    });
  }

  QueryBuilder<VisitScheduleModel, int, QQueryOperations> dayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfWeek');
    });
  }

  QueryBuilder<VisitScheduleModel, DateTime, QQueryOperations>
  effectiveFromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveFrom');
    });
  }

  QueryBuilder<VisitScheduleModel, DateTime?, QQueryOperations>
  effectiveToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveTo');
    });
  }

  QueryBuilder<VisitScheduleModel, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<VisitScheduleModel, DateTime?, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<VisitScheduleModel, String?, QQueryOperations>
  outletAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletAddress');
    });
  }

  QueryBuilder<VisitScheduleModel, String, QQueryOperations>
  outletCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletCode');
    });
  }

  QueryBuilder<VisitScheduleModel, String, QQueryOperations>
  outletIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletId');
    });
  }

  QueryBuilder<VisitScheduleModel, double, QQueryOperations>
  outletLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletLatitude');
    });
  }

  QueryBuilder<VisitScheduleModel, double, QQueryOperations>
  outletLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletLongitude');
    });
  }

  QueryBuilder<VisitScheduleModel, String, QQueryOperations>
  outletNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outletName');
    });
  }

  QueryBuilder<VisitScheduleModel, String, QQueryOperations>
  salesAgentServerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesAgentServerId');
    });
  }

  QueryBuilder<VisitScheduleModel, String?, QQueryOperations>
  scheduledClockInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledClockIn');
    });
  }

  QueryBuilder<VisitScheduleModel, String?, QQueryOperations>
  scheduledClockOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledClockOut');
    });
  }

  QueryBuilder<VisitScheduleModel, String, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<VisitScheduleModel, int, QQueryOperations> visitOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitOrder');
    });
  }

  QueryBuilder<VisitScheduleModel, int, QQueryOperations>
  visitPriorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitPriority');
    });
  }
}
