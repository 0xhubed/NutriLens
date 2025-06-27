// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_metrics.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserMetricsCollection on Isar {
  IsarCollection<UserMetrics> get userMetrics => this.collection();
}

const UserMetricsSchema = CollectionSchema(
  name: r'UserMetrics',
  id: 3450439425069738250,
  properties: {
    r'bmi': PropertySchema(
      id: 0,
      name: r'bmi',
      type: IsarType.double,
    ),
    r'bmiCategory': PropertySchema(
      id: 1,
      name: r'bmiCategory',
      type: IsarType.string,
    ),
    r'bmr': PropertySchema(
      id: 2,
      name: r'bmr',
      type: IsarType.double,
    ),
    r'bodyFatPercentage': PropertySchema(
      id: 3,
      name: r'bodyFatPercentage',
      type: IsarType.double,
    ),
    r'bodyMeasurementsData': PropertySchema(
      id: 4,
      name: r'bodyMeasurementsData',
      type: IsarType.string,
    ),
    r'dailyCalorieGoal': PropertySchema(
      id: 5,
      name: r'dailyCalorieGoal',
      type: IsarType.double,
    ),
    r'dailyStepGoal': PropertySchema(
      id: 6,
      name: r'dailyStepGoal',
      type: IsarType.double,
    ),
    r'dailyWaterGoal': PropertySchema(
      id: 7,
      name: r'dailyWaterGoal',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 8,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'height': PropertySchema(
      id: 9,
      name: r'height',
      type: IsarType.double,
    ),
    r'isCompleteProfile': PropertySchema(
      id: 10,
      name: r'isCompleteProfile',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 11,
      name: r'notes',
      type: IsarType.string,
    ),
    r'sleepHours': PropertySchema(
      id: 12,
      name: r'sleepHours',
      type: IsarType.double,
    ),
    r'stepCount': PropertySchema(
      id: 13,
      name: r'stepCount',
      type: IsarType.long,
    ),
    r'stepGoalProgress': PropertySchema(
      id: 14,
      name: r'stepGoalProgress',
      type: IsarType.double,
    ),
    r'waterGoalProgress': PropertySchema(
      id: 15,
      name: r'waterGoalProgress',
      type: IsarType.double,
    ),
    r'waterLiters': PropertySchema(
      id: 16,
      name: r'waterLiters',
      type: IsarType.double,
    ),
    r'weight': PropertySchema(
      id: 17,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _userMetricsEstimateSize,
  serialize: _userMetricsSerialize,
  deserialize: _userMetricsDeserialize,
  deserializeProp: _userMetricsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userMetricsGetId,
  getLinks: _userMetricsGetLinks,
  attach: _userMetricsAttach,
  version: '3.1.0+1',
);

int _userMetricsEstimateSize(
  UserMetrics object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bmiCategory.length * 3;
  {
    final value = object.bodyMeasurementsData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userMetricsSerialize(
  UserMetrics object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.bmi);
  writer.writeString(offsets[1], object.bmiCategory);
  writer.writeDouble(offsets[2], object.bmr);
  writer.writeDouble(offsets[3], object.bodyFatPercentage);
  writer.writeString(offsets[4], object.bodyMeasurementsData);
  writer.writeDouble(offsets[5], object.dailyCalorieGoal);
  writer.writeDouble(offsets[6], object.dailyStepGoal);
  writer.writeDouble(offsets[7], object.dailyWaterGoal);
  writer.writeDateTime(offsets[8], object.date);
  writer.writeDouble(offsets[9], object.height);
  writer.writeBool(offsets[10], object.isCompleteProfile);
  writer.writeString(offsets[11], object.notes);
  writer.writeDouble(offsets[12], object.sleepHours);
  writer.writeLong(offsets[13], object.stepCount);
  writer.writeDouble(offsets[14], object.stepGoalProgress);
  writer.writeDouble(offsets[15], object.waterGoalProgress);
  writer.writeDouble(offsets[16], object.waterLiters);
  writer.writeDouble(offsets[17], object.weight);
}

UserMetrics _userMetricsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserMetrics();
  object.bmi = reader.readDoubleOrNull(offsets[0]);
  object.bmr = reader.readDoubleOrNull(offsets[2]);
  object.bodyFatPercentage = reader.readDoubleOrNull(offsets[3]);
  object.bodyMeasurementsData = reader.readStringOrNull(offsets[4]);
  object.dailyCalorieGoal = reader.readDoubleOrNull(offsets[5]);
  object.dailyStepGoal = reader.readDoubleOrNull(offsets[6]);
  object.dailyWaterGoal = reader.readDoubleOrNull(offsets[7]);
  object.date = reader.readDateTime(offsets[8]);
  object.height = reader.readDoubleOrNull(offsets[9]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[11]);
  object.sleepHours = reader.readDoubleOrNull(offsets[12]);
  object.stepCount = reader.readLongOrNull(offsets[13]);
  object.waterLiters = reader.readDoubleOrNull(offsets[16]);
  object.weight = reader.readDoubleOrNull(offsets[17]);
  return object;
}

P _userMetricsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userMetricsGetId(UserMetrics object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userMetricsGetLinks(UserMetrics object) {
  return [];
}

void _userMetricsAttach(
    IsarCollection<dynamic> col, Id id, UserMetrics object) {
  object.id = id;
}

extension UserMetricsQueryWhereSort
    on QueryBuilder<UserMetrics, UserMetrics, QWhere> {
  QueryBuilder<UserMetrics, UserMetrics, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserMetricsQueryWhere
    on QueryBuilder<UserMetrics, UserMetrics, QWhereClause> {
  QueryBuilder<UserMetrics, UserMetrics, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserMetrics, UserMetrics, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterWhereClause> idBetween(
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

extension UserMetricsQueryFilter
    on QueryBuilder<UserMetrics, UserMetrics, QFilterCondition> {
  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bmi',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bmi',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bmi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bmi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bmi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bmi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bmiCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bmiCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bmiCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bmiCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bmiCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bmiCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bmiCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bmiCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bmiCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bmiCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bmiCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bmr',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bmr',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmrEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bmr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmrGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bmr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmrLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bmr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> bmrBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bmr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyFatPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bodyFatPercentage',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyFatPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bodyFatPercentage',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyFatPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyFatPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyFatPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyFatPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyFatPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyFatPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyFatPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyFatPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bodyMeasurementsData',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bodyMeasurementsData',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyMeasurementsData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyMeasurementsData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyMeasurementsData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyMeasurementsData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bodyMeasurementsData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bodyMeasurementsData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bodyMeasurementsData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bodyMeasurementsData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyMeasurementsData',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      bodyMeasurementsDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bodyMeasurementsData',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyCalorieGoalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyCalorieGoal',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyCalorieGoalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyCalorieGoal',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyCalorieGoalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyCalorieGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyCalorieGoalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyCalorieGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyCalorieGoalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyCalorieGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyCalorieGoalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyCalorieGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyStepGoalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyStepGoal',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyStepGoalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyStepGoal',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyStepGoalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyStepGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyStepGoalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyStepGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyStepGoalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyStepGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyStepGoalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyStepGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyWaterGoalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyWaterGoal',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyWaterGoalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyWaterGoal',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyWaterGoalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyWaterGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyWaterGoalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyWaterGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyWaterGoalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyWaterGoal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      dailyWaterGoalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyWaterGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> heightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      heightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> heightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> heightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      isCompleteProfileEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleteProfile',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      sleepHoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sleepHours',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      sleepHoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sleepHours',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      sleepHoursEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      sleepHoursGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      sleepHoursLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      sleepHoursBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stepCount',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stepCount',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stepCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stepCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stepCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stepCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepGoalProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stepGoalProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepGoalProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stepGoalProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepGoalProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stepGoalProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      stepGoalProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stepGoalProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterGoalProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterGoalProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterGoalProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterGoalProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterGoalProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterGoalProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterGoalProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterGoalProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterLitersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waterLiters',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterLitersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waterLiters',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterLitersEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterLiters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterLitersGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterLiters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterLitersLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterLiters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      waterLitersBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterLiters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> weightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition>
      weightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> weightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterFilterCondition> weightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension UserMetricsQueryObject
    on QueryBuilder<UserMetrics, UserMetrics, QFilterCondition> {}

extension UserMetricsQueryLinks
    on QueryBuilder<UserMetrics, UserMetrics, QFilterCondition> {}

extension UserMetricsQuerySortBy
    on QueryBuilder<UserMetrics, UserMetrics, QSortBy> {
  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByBmi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmi', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByBmiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmi', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByBmiCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiCategory', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByBmiCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiCategory', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByBmr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmr', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByBmrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmr', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByBodyFatPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyFatPercentage', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByBodyFatPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyFatPercentage', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByBodyMeasurementsData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyMeasurementsData', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByBodyMeasurementsDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyMeasurementsData', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByDailyCalorieGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCalorieGoal', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByDailyCalorieGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCalorieGoal', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByDailyStepGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyStepGoal', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByDailyStepGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyStepGoal', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByDailyWaterGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWaterGoal', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByDailyWaterGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWaterGoal', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByIsCompleteProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByIsCompleteProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortBySleepHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByStepCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepCount', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByStepCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepCount', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByStepGoalProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepGoalProgress', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByStepGoalProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepGoalProgress', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByWaterGoalProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGoalProgress', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      sortByWaterGoalProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGoalProgress', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByWaterLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterLiters', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByWaterLitersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterLiters', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension UserMetricsQuerySortThenBy
    on QueryBuilder<UserMetrics, UserMetrics, QSortThenBy> {
  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByBmi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmi', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByBmiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmi', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByBmiCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiCategory', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByBmiCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiCategory', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByBmr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmr', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByBmrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmr', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByBodyFatPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyFatPercentage', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByBodyFatPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyFatPercentage', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByBodyMeasurementsData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyMeasurementsData', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByBodyMeasurementsDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyMeasurementsData', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByDailyCalorieGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCalorieGoal', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByDailyCalorieGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyCalorieGoal', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByDailyStepGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyStepGoal', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByDailyStepGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyStepGoal', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByDailyWaterGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWaterGoal', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByDailyWaterGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWaterGoal', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByIsCompleteProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByIsCompleteProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleteProfile', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenBySleepHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByStepCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepCount', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByStepCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepCount', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByStepGoalProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepGoalProgress', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByStepGoalProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepGoalProgress', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByWaterGoalProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGoalProgress', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy>
      thenByWaterGoalProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGoalProgress', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByWaterLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterLiters', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByWaterLitersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterLiters', Sort.desc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension UserMetricsQueryWhereDistinct
    on QueryBuilder<UserMetrics, UserMetrics, QDistinct> {
  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByBmi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bmi');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByBmiCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bmiCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByBmr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bmr');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct>
      distinctByBodyFatPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyFatPercentage');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct>
      distinctByBodyMeasurementsData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyMeasurementsData',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct>
      distinctByDailyCalorieGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyCalorieGoal');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByDailyStepGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyStepGoal');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByDailyWaterGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyWaterGoal');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct>
      distinctByIsCompleteProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleteProfile');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepHours');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByStepCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stepCount');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct>
      distinctByStepGoalProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stepGoalProgress');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct>
      distinctByWaterGoalProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterGoalProgress');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByWaterLiters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterLiters');
    });
  }

  QueryBuilder<UserMetrics, UserMetrics, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension UserMetricsQueryProperty
    on QueryBuilder<UserMetrics, UserMetrics, QQueryProperty> {
  QueryBuilder<UserMetrics, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> bmiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bmi');
    });
  }

  QueryBuilder<UserMetrics, String, QQueryOperations> bmiCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bmiCategory');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> bmrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bmr');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations>
      bodyFatPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyFatPercentage');
    });
  }

  QueryBuilder<UserMetrics, String?, QQueryOperations>
      bodyMeasurementsDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyMeasurementsData');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations>
      dailyCalorieGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyCalorieGoal');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> dailyStepGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyStepGoal');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations>
      dailyWaterGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyWaterGoal');
    });
  }

  QueryBuilder<UserMetrics, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<UserMetrics, bool, QQueryOperations>
      isCompleteProfileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleteProfile');
    });
  }

  QueryBuilder<UserMetrics, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> sleepHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepHours');
    });
  }

  QueryBuilder<UserMetrics, int?, QQueryOperations> stepCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stepCount');
    });
  }

  QueryBuilder<UserMetrics, double, QQueryOperations>
      stepGoalProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stepGoalProgress');
    });
  }

  QueryBuilder<UserMetrics, double, QQueryOperations>
      waterGoalProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterGoalProgress');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> waterLitersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterLiters');
    });
  }

  QueryBuilder<UserMetrics, double?, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HealthGoalSchema = Schema(
  name: r'HealthGoal',
  id: -455216952977701995,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 1,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'targetDate': PropertySchema(
      id: 3,
      name: r'targetDate',
      type: IsarType.dateTime,
    ),
    r'targetValue': PropertySchema(
      id: 4,
      name: r'targetValue',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _HealthGoaltypeEnumValueMap,
    ),
    r'unit': PropertySchema(
      id: 6,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _healthGoalEstimateSize,
  serialize: _healthGoalSerialize,
  deserialize: _healthGoalDeserialize,
  deserializeProp: _healthGoalDeserializeProp,
);

int _healthGoalEstimateSize(
  HealthGoal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _healthGoalSerialize(
  HealthGoal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeBool(offsets[1], object.isActive);
  writer.writeString(offsets[2], object.name);
  writer.writeDateTime(offsets[3], object.targetDate);
  writer.writeDouble(offsets[4], object.targetValue);
  writer.writeByte(offsets[5], object.type.index);
  writer.writeString(offsets[6], object.unit);
}

HealthGoal _healthGoalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HealthGoal();
  object.description = reader.readString(offsets[0]);
  object.isActive = reader.readBool(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.targetDate = reader.readDateTime(offsets[3]);
  object.targetValue = reader.readDouble(offsets[4]);
  object.type =
      _HealthGoaltypeValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          GoalType.weightLoss;
  object.unit = reader.readString(offsets[6]);
  return object;
}

P _healthGoalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (_HealthGoaltypeValueEnumMap[reader.readByteOrNull(offset)] ??
          GoalType.weightLoss) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HealthGoaltypeEnumValueMap = {
  'weightLoss': 0,
  'weightGain': 1,
  'maintenance': 2,
  'performance': 3,
  'custom': 4,
};
const _HealthGoaltypeValueEnumMap = {
  0: GoalType.weightLoss,
  1: GoalType.weightGain,
  2: GoalType.maintenance,
  3: GoalType.performance,
  4: GoalType.custom,
};

extension HealthGoalQueryFilter
    on QueryBuilder<HealthGoal, HealthGoal, QFilterCondition> {
  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> targetDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetDate',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      targetDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetDate',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      targetDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetDate',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> targetDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      targetValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      targetValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      targetValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition>
      targetValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> typeEqualTo(
      GoalType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> typeGreaterThan(
    GoalType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> typeLessThan(
    GoalType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> typeBetween(
    GoalType lower,
    GoalType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<HealthGoal, HealthGoal, QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension HealthGoalQueryObject
    on QueryBuilder<HealthGoal, HealthGoal, QFilterCondition> {}
