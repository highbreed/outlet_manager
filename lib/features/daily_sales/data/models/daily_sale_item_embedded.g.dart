// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sale_item_embedded.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DailySaleItemEmbeddedSchema = Schema(
  name: r'DailySaleItemEmbedded',
  id: 4488756458595762432,
  properties: {
    r'dailySalesId': PropertySchema(
      id: 0,
      name: r'dailySalesId',
      type: IsarType.long,
    ),
    r'productCode': PropertySchema(
      id: 1,
      name: r'productCode',
      type: IsarType.string,
    ),
    r'productName': PropertySchema(
      id: 2,
      name: r'productName',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(id: 3, name: r'quantity', type: IsarType.long),
    r'serialNumbers': PropertySchema(
      id: 4,
      name: r'serialNumbers',
      type: IsarType.stringList,
    ),
    r'serverId': PropertySchema(id: 5, name: r'serverId', type: IsarType.long),
    r'totalPrice': PropertySchema(
      id: 6,
      name: r'totalPrice',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 7,
      name: r'unitPrice',
      type: IsarType.double,
    ),
  },

  estimateSize: _dailySaleItemEmbeddedEstimateSize,
  serialize: _dailySaleItemEmbeddedSerialize,
  deserialize: _dailySaleItemEmbeddedDeserialize,
  deserializeProp: _dailySaleItemEmbeddedDeserializeProp,
);

int _dailySaleItemEmbeddedEstimateSize(
  DailySaleItemEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.productCode.length * 3;
  bytesCount += 3 + object.productName.length * 3;
  bytesCount += 3 + object.serialNumbers.length * 3;
  {
    for (var i = 0; i < object.serialNumbers.length; i++) {
      final value = object.serialNumbers[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _dailySaleItemEmbeddedSerialize(
  DailySaleItemEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dailySalesId);
  writer.writeString(offsets[1], object.productCode);
  writer.writeString(offsets[2], object.productName);
  writer.writeLong(offsets[3], object.quantity);
  writer.writeStringList(offsets[4], object.serialNumbers);
  writer.writeLong(offsets[5], object.serverId);
  writer.writeDouble(offsets[6], object.totalPrice);
  writer.writeDouble(offsets[7], object.unitPrice);
}

DailySaleItemEmbedded _dailySaleItemEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailySaleItemEmbedded();
  object.dailySalesId = reader.readLong(offsets[0]);
  object.productCode = reader.readString(offsets[1]);
  object.productName = reader.readString(offsets[2]);
  object.quantity = reader.readLong(offsets[3]);
  object.serialNumbers = reader.readStringList(offsets[4]) ?? [];
  object.serverId = reader.readLong(offsets[5]);
  object.totalPrice = reader.readDouble(offsets[6]);
  object.unitPrice = reader.readDouble(offsets[7]);
  return object;
}

P _dailySaleItemEmbeddedDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DailySaleItemEmbeddedQueryFilter
    on
        QueryBuilder<
          DailySaleItemEmbedded,
          DailySaleItemEmbedded,
          QFilterCondition
        > {
  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  dailySalesIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dailySalesId', value: value),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  dailySalesIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dailySalesId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  dailySalesIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dailySalesId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  dailySalesIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dailySalesId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'productCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'productCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'productCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'productCode',
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'productCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'productCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'productCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'productCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'productCode', value: ''),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'productCode', value: ''),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'productName',
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'productName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'productName', value: ''),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'productName', value: ''),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
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

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'serialNumbers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serialNumbers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serialNumbers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serialNumbers',
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'serialNumbers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'serialNumbers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'serialNumbers',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'serialNumbers',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serialNumbers', value: ''),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serialNumbers', value: ''),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'serialNumbers', length, true, length, true);
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'serialNumbers', 0, true, 0, true);
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'serialNumbers', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'serialNumbers', 0, true, length, include);
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'serialNumbers', length, include, 999999, true);
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serialNumbersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'serialNumbers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serverIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serverIdGreaterThan(int value, {bool include = false}) {
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serverIdLessThan(int value, {bool include = false}) {
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  serverIdBetween(
    int lower,
    int upper, {
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  totalPriceEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  totalPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  totalPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  totalPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalPrice',
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
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  unitPriceEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unitPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  unitPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unitPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  unitPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unitPrice',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    DailySaleItemEmbedded,
    DailySaleItemEmbedded,
    QAfterFilterCondition
  >
  unitPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unitPrice',
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

extension DailySaleItemEmbeddedQueryObject
    on
        QueryBuilder<
          DailySaleItemEmbedded,
          DailySaleItemEmbedded,
          QFilterCondition
        > {}
