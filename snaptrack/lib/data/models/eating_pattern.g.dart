// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_pattern.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEatingPatternCollection on Isar {
  IsarCollection<EatingPattern> get eatingPatterns => this.collection();
}

const EatingPatternSchema = CollectionSchema(
  name: r'EatingPattern',
  id: 8673564809499313656,
  properties: {
    r'averageEatingWindowMinutes': PropertySchema(
      id: 0,
      name: r'averageEatingWindowMinutes',
      type: IsarType.long,
    ),
    r'averageFastingWindowMinutes': PropertySchema(
      id: 1,
      name: r'averageFastingWindowMinutes',
      type: IsarType.long,
    ),
    r'breakfastCarbs': PropertySchema(
      id: 2,
      name: r'breakfastCarbs',
      type: IsarType.double,
    ),
    r'breakfastFat': PropertySchema(
      id: 3,
      name: r'breakfastFat',
      type: IsarType.double,
    ),
    r'breakfastProtein': PropertySchema(
      id: 4,
      name: r'breakfastProtein',
      type: IsarType.double,
    ),
    r'consistencyScore': PropertySchema(
      id: 5,
      name: r'consistencyScore',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 6,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'detectedPattern': PropertySchema(
      id: 7,
      name: r'detectedPattern',
      type: IsarType.string,
    ),
    r'dinnerCarbs': PropertySchema(
      id: 8,
      name: r'dinnerCarbs',
      type: IsarType.double,
    ),
    r'dinnerFat': PropertySchema(
      id: 9,
      name: r'dinnerFat',
      type: IsarType.double,
    ),
    r'dinnerProtein': PropertySchema(
      id: 10,
      name: r'dinnerProtein',
      type: IsarType.double,
    ),
    r'isIntermittentFasting': PropertySchema(
      id: 11,
      name: r'isIntermittentFasting',
      type: IsarType.bool,
    ),
    r'lunchCarbs': PropertySchema(
      id: 12,
      name: r'lunchCarbs',
      type: IsarType.double,
    ),
    r'lunchFat': PropertySchema(
      id: 13,
      name: r'lunchFat',
      type: IsarType.double,
    ),
    r'lunchProtein': PropertySchema(
      id: 14,
      name: r'lunchProtein',
      type: IsarType.double,
    ),
    r'mealFrequency': PropertySchema(
      id: 15,
      name: r'mealFrequency',
      type: IsarType.double,
    ),
    r'metabolicOptimizationScore': PropertySchema(
      id: 16,
      name: r'metabolicOptimizationScore',
      type: IsarType.double,
    ),
    r'snackCarbs': PropertySchema(
      id: 17,
      name: r'snackCarbs',
      type: IsarType.double,
    ),
    r'snackFat': PropertySchema(
      id: 18,
      name: r'snackFat',
      type: IsarType.double,
    ),
    r'snackProtein': PropertySchema(
      id: 19,
      name: r'snackProtein',
      type: IsarType.double,
    ),
    r'typicalMealTimes': PropertySchema(
      id: 20,
      name: r'typicalMealTimes',
      type: IsarType.dateTimeList,
    )
  },
  estimateSize: _eatingPatternEstimateSize,
  serialize: _eatingPatternSerialize,
  deserialize: _eatingPatternDeserialize,
  deserializeProp: _eatingPatternDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _eatingPatternGetId,
  getLinks: _eatingPatternGetLinks,
  attach: _eatingPatternAttach,
  version: '3.1.0+1',
);

int _eatingPatternEstimateSize(
  EatingPattern object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.detectedPattern;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.typicalMealTimes.length * 8;
  return bytesCount;
}

void _eatingPatternSerialize(
  EatingPattern object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.averageEatingWindowMinutes);
  writer.writeLong(offsets[1], object.averageFastingWindowMinutes);
  writer.writeDouble(offsets[2], object.breakfastCarbs);
  writer.writeDouble(offsets[3], object.breakfastFat);
  writer.writeDouble(offsets[4], object.breakfastProtein);
  writer.writeDouble(offsets[5], object.consistencyScore);
  writer.writeDateTime(offsets[6], object.date);
  writer.writeString(offsets[7], object.detectedPattern);
  writer.writeDouble(offsets[8], object.dinnerCarbs);
  writer.writeDouble(offsets[9], object.dinnerFat);
  writer.writeDouble(offsets[10], object.dinnerProtein);
  writer.writeBool(offsets[11], object.isIntermittentFasting);
  writer.writeDouble(offsets[12], object.lunchCarbs);
  writer.writeDouble(offsets[13], object.lunchFat);
  writer.writeDouble(offsets[14], object.lunchProtein);
  writer.writeDouble(offsets[15], object.mealFrequency);
  writer.writeDouble(offsets[16], object.metabolicOptimizationScore);
  writer.writeDouble(offsets[17], object.snackCarbs);
  writer.writeDouble(offsets[18], object.snackFat);
  writer.writeDouble(offsets[19], object.snackProtein);
  writer.writeDateTimeList(offsets[20], object.typicalMealTimes);
}

EatingPattern _eatingPatternDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EatingPattern();
  object.averageEatingWindowMinutes = reader.readLong(offsets[0]);
  object.averageFastingWindowMinutes = reader.readLong(offsets[1]);
  object.breakfastCarbs = reader.readDouble(offsets[2]);
  object.breakfastFat = reader.readDouble(offsets[3]);
  object.breakfastProtein = reader.readDouble(offsets[4]);
  object.consistencyScore = reader.readDouble(offsets[5]);
  object.date = reader.readDateTime(offsets[6]);
  object.detectedPattern = reader.readStringOrNull(offsets[7]);
  object.dinnerCarbs = reader.readDouble(offsets[8]);
  object.dinnerFat = reader.readDouble(offsets[9]);
  object.dinnerProtein = reader.readDouble(offsets[10]);
  object.id = id;
  object.isIntermittentFasting = reader.readBool(offsets[11]);
  object.lunchCarbs = reader.readDouble(offsets[12]);
  object.lunchFat = reader.readDouble(offsets[13]);
  object.lunchProtein = reader.readDouble(offsets[14]);
  object.mealFrequency = reader.readDouble(offsets[15]);
  object.metabolicOptimizationScore = reader.readDouble(offsets[16]);
  object.snackCarbs = reader.readDouble(offsets[17]);
  object.snackFat = reader.readDouble(offsets[18]);
  object.snackProtein = reader.readDouble(offsets[19]);
  object.typicalMealTimes = reader.readDateTimeList(offsets[20]) ?? [];
  return object;
}

P _eatingPatternDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDateTimeList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _eatingPatternGetId(EatingPattern object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _eatingPatternGetLinks(EatingPattern object) {
  return [];
}

void _eatingPatternAttach(
    IsarCollection<dynamic> col, Id id, EatingPattern object) {
  object.id = id;
}

extension EatingPatternQueryWhereSort
    on QueryBuilder<EatingPattern, EatingPattern, QWhere> {
  QueryBuilder<EatingPattern, EatingPattern, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EatingPatternQueryWhere
    on QueryBuilder<EatingPattern, EatingPattern, QWhereClause> {
  QueryBuilder<EatingPattern, EatingPattern, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterWhereClause> idBetween(
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

extension EatingPatternQueryFilter
    on QueryBuilder<EatingPattern, EatingPattern, QFilterCondition> {
  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageEatingWindowMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageEatingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageEatingWindowMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageEatingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageEatingWindowMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageEatingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageEatingWindowMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageEatingWindowMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageFastingWindowMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageFastingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageFastingWindowMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageFastingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageFastingWindowMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageFastingWindowMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      averageFastingWindowMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageFastingWindowMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'breakfastCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'breakfastCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'breakfastCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'breakfastCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'breakfastFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'breakfastFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'breakfastFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'breakfastFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'breakfastProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'breakfastProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'breakfastProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      breakfastProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'breakfastProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      consistencyScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consistencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      consistencyScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consistencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      consistencyScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consistencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      consistencyScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consistencyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'detectedPattern',
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'detectedPattern',
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedPattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detectedPattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detectedPattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detectedPattern',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detectedPattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detectedPattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detectedPattern',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detectedPattern',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detectedPattern',
        value: '',
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      detectedPatternIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detectedPattern',
        value: '',
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dinnerCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dinnerCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dinnerCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dinnerCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dinnerFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dinnerFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dinnerFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dinnerFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dinnerProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dinnerProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dinnerProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      dinnerProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dinnerProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      isIntermittentFastingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isIntermittentFasting',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lunchCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lunchCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lunchCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lunchCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lunchFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lunchFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lunchFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lunchFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lunchProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lunchProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lunchProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      lunchProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lunchProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      mealFrequencyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealFrequency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      mealFrequencyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealFrequency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      mealFrequencyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealFrequency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      mealFrequencyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealFrequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      metabolicOptimizationScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metabolicOptimizationScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      metabolicOptimizationScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metabolicOptimizationScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      metabolicOptimizationScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metabolicOptimizationScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      metabolicOptimizationScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metabolicOptimizationScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snackCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snackCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snackCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snackCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snackFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snackFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snackFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snackFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snackProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snackProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snackProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      snackProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snackProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typicalMealTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typicalMealTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typicalMealTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typicalMealTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'typicalMealTimes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'typicalMealTimes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'typicalMealTimes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'typicalMealTimes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'typicalMealTimes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterFilterCondition>
      typicalMealTimesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'typicalMealTimes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension EatingPatternQueryObject
    on QueryBuilder<EatingPattern, EatingPattern, QFilterCondition> {}

extension EatingPatternQueryLinks
    on QueryBuilder<EatingPattern, EatingPattern, QFilterCondition> {}

extension EatingPatternQuerySortBy
    on QueryBuilder<EatingPattern, EatingPattern, QSortBy> {
  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByAverageEatingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEatingWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByAverageEatingWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEatingWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByAverageFastingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageFastingWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByAverageFastingWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageFastingWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByBreakfastCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByBreakfastCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByBreakfastFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByBreakfastFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByBreakfastProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByBreakfastProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastProtein', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByConsistencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByDetectedPattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedPattern', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByDetectedPatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedPattern', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortByDinnerCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByDinnerCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortByDinnerFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByDinnerFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByDinnerProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByDinnerProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerProtein', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByIsIntermittentFasting() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntermittentFasting', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByIsIntermittentFastingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntermittentFasting', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortByLunchCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByLunchCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortByLunchFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByLunchFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByLunchProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByLunchProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchProtein', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByMealFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFrequency', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByMealFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFrequency', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByMetabolicOptimizationScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metabolicOptimizationScore', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortByMetabolicOptimizationScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metabolicOptimizationScore', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortBySnackCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortBySnackCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> sortBySnackFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortBySnackFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortBySnackProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      sortBySnackProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackProtein', Sort.desc);
    });
  }
}

extension EatingPatternQuerySortThenBy
    on QueryBuilder<EatingPattern, EatingPattern, QSortThenBy> {
  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByAverageEatingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEatingWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByAverageEatingWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEatingWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByAverageFastingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageFastingWindowMinutes', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByAverageFastingWindowMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageFastingWindowMinutes', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByBreakfastCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByBreakfastCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByBreakfastFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByBreakfastFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByBreakfastProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByBreakfastProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakfastProtein', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByConsistencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistencyScore', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByDetectedPattern() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedPattern', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByDetectedPatternDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detectedPattern', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByDinnerCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByDinnerCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByDinnerFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByDinnerFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByDinnerProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByDinnerProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dinnerProtein', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByIsIntermittentFasting() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntermittentFasting', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByIsIntermittentFastingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntermittentFasting', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByLunchCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByLunchCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenByLunchFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByLunchFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByLunchProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByLunchProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lunchProtein', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByMealFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFrequency', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByMealFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealFrequency', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByMetabolicOptimizationScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metabolicOptimizationScore', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenByMetabolicOptimizationScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metabolicOptimizationScore', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenBySnackCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackCarbs', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenBySnackCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackCarbs', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy> thenBySnackFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackFat', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenBySnackFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackFat', Sort.desc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenBySnackProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackProtein', Sort.asc);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QAfterSortBy>
      thenBySnackProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snackProtein', Sort.desc);
    });
  }
}

extension EatingPatternQueryWhereDistinct
    on QueryBuilder<EatingPattern, EatingPattern, QDistinct> {
  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByAverageEatingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageEatingWindowMinutes');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByAverageFastingWindowMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageFastingWindowMinutes');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByBreakfastCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'breakfastCarbs');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByBreakfastFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'breakfastFat');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByBreakfastProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'breakfastProtein');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByConsistencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consistencyScore');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByDetectedPattern({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detectedPattern',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByDinnerCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dinnerCarbs');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct> distinctByDinnerFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dinnerFat');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByDinnerProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dinnerProtein');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByIsIntermittentFasting() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isIntermittentFasting');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct> distinctByLunchCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lunchCarbs');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct> distinctByLunchFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lunchFat');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByLunchProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lunchProtein');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByMealFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealFrequency');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByMetabolicOptimizationScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metabolicOptimizationScore');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct> distinctBySnackCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snackCarbs');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct> distinctBySnackFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snackFat');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctBySnackProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snackProtein');
    });
  }

  QueryBuilder<EatingPattern, EatingPattern, QDistinct>
      distinctByTypicalMealTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typicalMealTimes');
    });
  }
}

extension EatingPatternQueryProperty
    on QueryBuilder<EatingPattern, EatingPattern, QQueryProperty> {
  QueryBuilder<EatingPattern, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EatingPattern, int, QQueryOperations>
      averageEatingWindowMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageEatingWindowMinutes');
    });
  }

  QueryBuilder<EatingPattern, int, QQueryOperations>
      averageFastingWindowMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageFastingWindowMinutes');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations>
      breakfastCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'breakfastCarbs');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> breakfastFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'breakfastFat');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations>
      breakfastProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'breakfastProtein');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations>
      consistencyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consistencyScore');
    });
  }

  QueryBuilder<EatingPattern, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<EatingPattern, String?, QQueryOperations>
      detectedPatternProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detectedPattern');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> dinnerCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dinnerCarbs');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> dinnerFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dinnerFat');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations>
      dinnerProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dinnerProtein');
    });
  }

  QueryBuilder<EatingPattern, bool, QQueryOperations>
      isIntermittentFastingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isIntermittentFasting');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> lunchCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lunchCarbs');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> lunchFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lunchFat');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> lunchProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lunchProtein');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations>
      mealFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealFrequency');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations>
      metabolicOptimizationScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metabolicOptimizationScore');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> snackCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snackCarbs');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> snackFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snackFat');
    });
  }

  QueryBuilder<EatingPattern, double, QQueryOperations> snackProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snackProtein');
    });
  }

  QueryBuilder<EatingPattern, List<DateTime>, QQueryOperations>
      typicalMealTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typicalMealTimes');
    });
  }
}
