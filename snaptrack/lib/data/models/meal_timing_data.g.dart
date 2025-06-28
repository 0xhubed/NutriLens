// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_timing_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealTimingDataCollection on Isar {
  IsarCollection<MealTimingData> get mealTimingDatas => this.collection();
}

const MealTimingDataSchema = CollectionSchema(
  name: r'MealTimingData',
  id: -8112504537926956120,
  properties: {
    r'carbs': PropertySchema(
      id: 0,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'fastingWindowMinutes': PropertySchema(
      id: 1,
      name: r'fastingWindowMinutes',
      type: IsarType.long,
    ),
    r'fat': PropertySchema(
      id: 2,
      name: r'fat',
      type: IsarType.double,
    ),
    r'fiber': PropertySchema(
      id: 3,
      name: r'fiber',
      type: IsarType.double,
    ),
    r'foodEntryId': PropertySchema(
      id: 4,
      name: r'foodEntryId',
      type: IsarType.long,
    ),
    r'foodTypes': PropertySchema(
      id: 5,
      name: r'foodTypes',
      type: IsarType.stringList,
    ),
    r'mealType': PropertySchema(
      id: 6,
      name: r'mealType',
      type: IsarType.byte,
      enumMap: _MealTimingDatamealTypeEnumValueMap,
    ),
    r'protein': PropertySchema(
      id: 7,
      name: r'protein',
      type: IsarType.double,
    ),
    r'timeSinceLastMealMinutes': PropertySchema(
      id: 8,
      name: r'timeSinceLastMealMinutes',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 9,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'totalCalories': PropertySchema(
      id: 10,
      name: r'totalCalories',
      type: IsarType.double,
    )
  },
  estimateSize: _mealTimingDataEstimateSize,
  serialize: _mealTimingDataSerialize,
  deserialize: _mealTimingDataDeserialize,
  deserializeProp: _mealTimingDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mealTimingDataGetId,
  getLinks: _mealTimingDataGetLinks,
  attach: _mealTimingDataAttach,
  version: '3.1.0+1',
);

int _mealTimingDataEstimateSize(
  MealTimingData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.foodTypes.length * 3;
  {
    for (var i = 0; i < object.foodTypes.length; i++) {
      final value = object.foodTypes[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _mealTimingDataSerialize(
  MealTimingData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.carbs);
  writer.writeLong(offsets[1], object.fastingWindowMinutes);
  writer.writeDouble(offsets[2], object.fat);
  writer.writeDouble(offsets[3], object.fiber);
  writer.writeLong(offsets[4], object.foodEntryId);
  writer.writeStringList(offsets[5], object.foodTypes);
  writer.writeByte(offsets[6], object.mealType.index);
  writer.writeDouble(offsets[7], object.protein);
  writer.writeLong(offsets[8], object.timeSinceLastMealMinutes);
  writer.writeDateTime(offsets[9], object.timestamp);
  writer.writeDouble(offsets[10], object.totalCalories);
}

MealTimingData _mealTimingDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MealTimingData();
  object.carbs = reader.readDouble(offsets[0]);
  object.fastingWindowMinutes = reader.readLong(offsets[1]);
  object.fat = reader.readDouble(offsets[2]);
  object.fiber = reader.readDouble(offsets[3]);
  object.foodEntryId = reader.readLongOrNull(offsets[4]);
  object.foodTypes = reader.readStringList(offsets[5]) ?? [];
  object.id = id;
  object.mealType =
      _MealTimingDatamealTypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          MealType.breakfast;
  object.protein = reader.readDouble(offsets[7]);
  object.timeSinceLastMealMinutes = reader.readLong(offsets[8]);
  object.timestamp = reader.readDateTime(offsets[9]);
  object.totalCalories = reader.readDouble(offsets[10]);
  return object;
}

P _mealTimingDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (_MealTimingDatamealTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MealType.breakfast) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MealTimingDatamealTypeEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
  'snack': 3,
};
const _MealTimingDatamealTypeValueEnumMap = {
  0: MealType.breakfast,
  1: MealType.lunch,
  2: MealType.dinner,
  3: MealType.snack,
};

Id _mealTimingDataGetId(MealTimingData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealTimingDataGetLinks(MealTimingData object) {
  return [];
}

void _mealTimingDataAttach(
    IsarCollection<dynamic> col, Id id, MealTimingData object) {
  object.id = id;
}

extension MealTimingDataQueryWhereSort
    on QueryBuilder<MealTimingData, MealTimingData, QWhere> {
  QueryBuilder<MealTimingData, MealTimingData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealTimingDataQueryWhere
    on QueryBuilder<MealTimingData, MealTimingData, QWhereClause> {
  QueryBuilder<MealTimingData, MealTimingData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<MealTimingData, MealTimingData, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MealTimingDataQueryFilter
    on QueryBuilder<MealTimingData, MealTimingData, QFilterCondition> {
  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      carbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      carbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      carbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      carbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fastingWindowMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fastingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fastingWindowMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fastingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fastingWindowMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fastingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fastingWindowMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fastingWindowMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fiberEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fiberGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fiberLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fiber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      fiberBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fiber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodEntryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodEntryId',
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodEntryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodEntryId',
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodEntryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodEntryId',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodEntryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodEntryId',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodEntryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodEntryId',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodEntryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodEntryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      foodTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      mealTypeEqualTo(MealType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      mealTypeGreaterThan(
    MealType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      mealTypeLessThan(
    MealType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      mealTypeBetween(
    MealType lower,
    MealType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      proteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      proteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      proteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      proteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timeSinceLastMealMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeSinceLastMealMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timeSinceLastMealMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeSinceLastMealMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timeSinceLastMealMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeSinceLastMealMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timeSinceLastMealMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeSinceLastMealMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      totalCaloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      totalCaloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      totalCaloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterFilterCondition>
      totalCaloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MealTimingDataQueryObject
    on QueryBuilder<MealTimingData, MealTimingData, QFilterCondition> {}

extension MealTimingDataQueryLinks
    on QueryBuilder<MealTimingData, MealTimingData, QFilterCondition> {}

extension MealTimingDataQuerySortBy
    on QueryBuilder<MealTimingData, MealTimingData, QSortBy> {
  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByFastingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByFastingWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByFoodEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodEntryId', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByFoodEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodEntryId', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByTimeSinceLastMealMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByTimeSinceLastMealMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByTotalCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      sortByTotalCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.desc);
    });
  }
}

extension MealTimingDataQuerySortThenBy
    on QueryBuilder<MealTimingData, MealTimingData, QSortThenBy> {
  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByFastingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByFastingWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByFiberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fiber', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByFoodEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodEntryId', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByFoodEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodEntryId', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByTimeSinceLastMealMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByTimeSinceLastMealMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByTotalCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.asc);
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QAfterSortBy>
      thenByTotalCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCalories', Sort.desc);
    });
  }
}

extension MealTimingDataQueryWhereDistinct
    on QueryBuilder<MealTimingData, MealTimingData, QDistinct> {
  QueryBuilder<MealTimingData, MealTimingData, QDistinct> distinctByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbs');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct>
      distinctByFastingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fastingWindowMinutes');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct> distinctByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fat');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct> distinctByFiber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fiber');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct>
      distinctByFoodEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodEntryId');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct>
      distinctByFoodTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodTypes');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct> distinctByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealType');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct> distinctByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protein');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct>
      distinctByTimeSinceLastMealMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeSinceLastMealMinutes');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<MealTimingData, MealTimingData, QDistinct>
      distinctByTotalCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCalories');
    });
  }
}

extension MealTimingDataQueryProperty
    on QueryBuilder<MealTimingData, MealTimingData, QQueryProperty> {
  QueryBuilder<MealTimingData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MealTimingData, double, QQueryOperations> carbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbs');
    });
  }

  QueryBuilder<MealTimingData, int, QQueryOperations>
      fastingWindowMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fastingWindowMinutes');
    });
  }

  QueryBuilder<MealTimingData, double, QQueryOperations> fatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fat');
    });
  }

  QueryBuilder<MealTimingData, double, QQueryOperations> fiberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiber');
    });
  }

  QueryBuilder<MealTimingData, int?, QQueryOperations> foodEntryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodEntryId');
    });
  }

  QueryBuilder<MealTimingData, List<String>, QQueryOperations>
      foodTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodTypes');
    });
  }

  QueryBuilder<MealTimingData, MealType, QQueryOperations> mealTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealType');
    });
  }

  QueryBuilder<MealTimingData, double, QQueryOperations> proteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protein');
    });
  }

  QueryBuilder<MealTimingData, int, QQueryOperations>
      timeSinceLastMealMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeSinceLastMealMinutes');
    });
  }

  QueryBuilder<MealTimingData, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<MealTimingData, double, QQueryOperations>
      totalCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCalories');
    });
  }
}
