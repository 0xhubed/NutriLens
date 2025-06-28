// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metabolic_state.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMetabolicStateCollection on Isar {
  IsarCollection<MetabolicState> get metabolicStates => this.collection();
}

const MetabolicStateSchema = CollectionSchema(
  name: r'MetabolicState',
  id: -1125601761992864404,
  properties: {
    r'activeProcesses': PropertySchema(
      id: 0,
      name: r'activeProcesses',
      type: IsarType.stringList,
    ),
    r'digestiveLoad': PropertySchema(
      id: 1,
      name: r'digestiveLoad',
      type: IsarType.double,
    ),
    r'estimatedInsulinLevel': PropertySchema(
      id: 2,
      name: r'estimatedInsulinLevel',
      type: IsarType.byte,
      enumMap: _MetabolicStateestimatedInsulinLevelEnumValueMap,
    ),
    r'fatBurningPotential': PropertySchema(
      id: 3,
      name: r'fatBurningPotential',
      type: IsarType.double,
    ),
    r'lastMealCalories': PropertySchema(
      id: 4,
      name: r'lastMealCalories',
      type: IsarType.double,
    ),
    r'lastMealCarbs': PropertySchema(
      id: 5,
      name: r'lastMealCarbs',
      type: IsarType.double,
    ),
    r'muscleBuildinPotential': PropertySchema(
      id: 6,
      name: r'muscleBuildinPotential',
      type: IsarType.double,
    ),
    r'phase': PropertySchema(
      id: 7,
      name: r'phase',
      type: IsarType.byte,
      enumMap: _MetabolicStatephaseEnumValueMap,
    ),
    r'timeInCurrentStateMinutes': PropertySchema(
      id: 8,
      name: r'timeInCurrentStateMinutes',
      type: IsarType.long,
    ),
    r'timeSinceLastMealMinutes': PropertySchema(
      id: 9,
      name: r'timeSinceLastMealMinutes',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 10,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _metabolicStateEstimateSize,
  serialize: _metabolicStateSerialize,
  deserialize: _metabolicStateDeserialize,
  deserializeProp: _metabolicStateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _metabolicStateGetId,
  getLinks: _metabolicStateGetLinks,
  attach: _metabolicStateAttach,
  version: '3.1.0+1',
);

int _metabolicStateEstimateSize(
  MetabolicState object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeProcesses.length * 3;
  {
    for (var i = 0; i < object.activeProcesses.length; i++) {
      final value = object.activeProcesses[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _metabolicStateSerialize(
  MetabolicState object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.activeProcesses);
  writer.writeDouble(offsets[1], object.digestiveLoad);
  writer.writeByte(offsets[2], object.estimatedInsulinLevel.index);
  writer.writeDouble(offsets[3], object.fatBurningPotential);
  writer.writeDouble(offsets[4], object.lastMealCalories);
  writer.writeDouble(offsets[5], object.lastMealCarbs);
  writer.writeDouble(offsets[6], object.muscleBuildinPotential);
  writer.writeByte(offsets[7], object.phase.index);
  writer.writeLong(offsets[8], object.timeInCurrentStateMinutes);
  writer.writeLong(offsets[9], object.timeSinceLastMealMinutes);
  writer.writeDateTime(offsets[10], object.timestamp);
}

MetabolicState _metabolicStateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MetabolicState();
  object.activeProcesses = reader.readStringList(offsets[0]) ?? [];
  object.digestiveLoad = reader.readDouble(offsets[1]);
  object.estimatedInsulinLevel =
      _MetabolicStateestimatedInsulinLevelValueEnumMap[
              reader.readByteOrNull(offsets[2])] ??
          InsulinLevel.low;
  object.fatBurningPotential = reader.readDouble(offsets[3]);
  object.id = id;
  object.lastMealCalories = reader.readDouble(offsets[4]);
  object.lastMealCarbs = reader.readDouble(offsets[5]);
  object.muscleBuildinPotential = reader.readDouble(offsets[6]);
  object.phase =
      _MetabolicStatephaseValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          MetabolicPhase.fed;
  object.timeInCurrentStateMinutes = reader.readLong(offsets[8]);
  object.timeSinceLastMealMinutes = reader.readLong(offsets[9]);
  object.timestamp = reader.readDateTime(offsets[10]);
  return object;
}

P _metabolicStateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (_MetabolicStateestimatedInsulinLevelValueEnumMap[
              reader.readByteOrNull(offset)] ??
          InsulinLevel.low) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (_MetabolicStatephaseValueEnumMap[reader.readByteOrNull(offset)] ??
          MetabolicPhase.fed) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MetabolicStateestimatedInsulinLevelEnumValueMap = {
  'low': 0,
  'medium': 1,
  'high': 2,
};
const _MetabolicStateestimatedInsulinLevelValueEnumMap = {
  0: InsulinLevel.low,
  1: InsulinLevel.medium,
  2: InsulinLevel.high,
};
const _MetabolicStatephaseEnumValueMap = {
  'fed': 0,
  'fasting': 1,
  'fatBurning': 2,
  'muscleBuilding': 3,
};
const _MetabolicStatephaseValueEnumMap = {
  0: MetabolicPhase.fed,
  1: MetabolicPhase.fasting,
  2: MetabolicPhase.fatBurning,
  3: MetabolicPhase.muscleBuilding,
};

Id _metabolicStateGetId(MetabolicState object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _metabolicStateGetLinks(MetabolicState object) {
  return [];
}

void _metabolicStateAttach(
    IsarCollection<dynamic> col, Id id, MetabolicState object) {
  object.id = id;
}

extension MetabolicStateQueryWhereSort
    on QueryBuilder<MetabolicState, MetabolicState, QWhere> {
  QueryBuilder<MetabolicState, MetabolicState, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MetabolicStateQueryWhere
    on QueryBuilder<MetabolicState, MetabolicState, QWhereClause> {
  QueryBuilder<MetabolicState, MetabolicState, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterWhereClause> idBetween(
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

extension MetabolicStateQueryFilter
    on QueryBuilder<MetabolicState, MetabolicState, QFilterCondition> {
  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeProcesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeProcesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeProcesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeProcesses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeProcesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeProcesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeProcesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeProcesses',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeProcesses',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeProcesses',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeProcesses',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeProcesses',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeProcesses',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeProcesses',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeProcesses',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      activeProcessesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeProcesses',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      digestiveLoadEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'digestiveLoad',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      digestiveLoadGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'digestiveLoad',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      digestiveLoadLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'digestiveLoad',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      digestiveLoadBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'digestiveLoad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      estimatedInsulinLevelEqualTo(InsulinLevel value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedInsulinLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      estimatedInsulinLevelGreaterThan(
    InsulinLevel value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedInsulinLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      estimatedInsulinLevelLessThan(
    InsulinLevel value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedInsulinLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      estimatedInsulinLevelBetween(
    InsulinLevel lower,
    InsulinLevel upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedInsulinLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      fatBurningPotentialEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatBurningPotential',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      fatBurningPotentialGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatBurningPotential',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      fatBurningPotentialLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatBurningPotential',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      fatBurningPotentialBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatBurningPotential',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCaloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMealCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCaloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMealCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCaloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMealCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCaloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMealCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMealCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMealCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMealCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      lastMealCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMealCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      muscleBuildinPotentialEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'muscleBuildinPotential',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      muscleBuildinPotentialGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'muscleBuildinPotential',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      muscleBuildinPotentialLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'muscleBuildinPotential',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      muscleBuildinPotentialBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'muscleBuildinPotential',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      phaseEqualTo(MetabolicPhase value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phase',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      phaseGreaterThan(
    MetabolicPhase value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phase',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      phaseLessThan(
    MetabolicPhase value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phase',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      phaseBetween(
    MetabolicPhase lower,
    MetabolicPhase upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phase',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      timeInCurrentStateMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeInCurrentStateMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      timeInCurrentStateMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeInCurrentStateMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      timeInCurrentStateMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeInCurrentStateMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      timeInCurrentStateMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeInCurrentStateMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      timeSinceLastMealMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeSinceLastMealMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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

  QueryBuilder<MetabolicState, MetabolicState, QAfterFilterCondition>
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
}

extension MetabolicStateQueryObject
    on QueryBuilder<MetabolicState, MetabolicState, QFilterCondition> {}

extension MetabolicStateQueryLinks
    on QueryBuilder<MetabolicState, MetabolicState, QFilterCondition> {}

extension MetabolicStateQuerySortBy
    on QueryBuilder<MetabolicState, MetabolicState, QSortBy> {
  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByDigestiveLoad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'digestiveLoad', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByDigestiveLoadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'digestiveLoad', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByEstimatedInsulinLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedInsulinLevel', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByEstimatedInsulinLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedInsulinLevel', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByFatBurningPotential() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatBurningPotential', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByFatBurningPotentialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatBurningPotential', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByLastMealCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCalories', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByLastMealCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCalories', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByLastMealCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCarbs', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByLastMealCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCarbs', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByMuscleBuildinPotential() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleBuildinPotential', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByMuscleBuildinPotentialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleBuildinPotential', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> sortByPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> sortByPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByTimeInCurrentStateMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInCurrentStateMinutes', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByTimeInCurrentStateMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInCurrentStateMinutes', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByTimeSinceLastMealMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByTimeSinceLastMealMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MetabolicStateQuerySortThenBy
    on QueryBuilder<MetabolicState, MetabolicState, QSortThenBy> {
  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByDigestiveLoad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'digestiveLoad', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByDigestiveLoadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'digestiveLoad', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByEstimatedInsulinLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedInsulinLevel', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByEstimatedInsulinLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedInsulinLevel', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByFatBurningPotential() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatBurningPotential', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByFatBurningPotentialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatBurningPotential', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByLastMealCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCalories', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByLastMealCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCalories', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByLastMealCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCarbs', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByLastMealCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMealCarbs', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByMuscleBuildinPotential() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleBuildinPotential', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByMuscleBuildinPotentialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleBuildinPotential', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> thenByPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> thenByPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByTimeInCurrentStateMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInCurrentStateMinutes', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByTimeInCurrentStateMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInCurrentStateMinutes', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByTimeSinceLastMealMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByTimeSinceLastMealMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSinceLastMealMinutes', Sort.desc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MetabolicStateQueryWhereDistinct
    on QueryBuilder<MetabolicState, MetabolicState, QDistinct> {
  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByActiveProcesses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeProcesses');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByDigestiveLoad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'digestiveLoad');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByEstimatedInsulinLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedInsulinLevel');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByFatBurningPotential() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fatBurningPotential');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByLastMealCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMealCalories');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByLastMealCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMealCarbs');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByMuscleBuildinPotential() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'muscleBuildinPotential');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct> distinctByPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phase');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByTimeInCurrentStateMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeInCurrentStateMinutes');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByTimeSinceLastMealMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeSinceLastMealMinutes');
    });
  }

  QueryBuilder<MetabolicState, MetabolicState, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension MetabolicStateQueryProperty
    on QueryBuilder<MetabolicState, MetabolicState, QQueryProperty> {
  QueryBuilder<MetabolicState, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MetabolicState, List<String>, QQueryOperations>
      activeProcessesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeProcesses');
    });
  }

  QueryBuilder<MetabolicState, double, QQueryOperations>
      digestiveLoadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'digestiveLoad');
    });
  }

  QueryBuilder<MetabolicState, InsulinLevel, QQueryOperations>
      estimatedInsulinLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedInsulinLevel');
    });
  }

  QueryBuilder<MetabolicState, double, QQueryOperations>
      fatBurningPotentialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatBurningPotential');
    });
  }

  QueryBuilder<MetabolicState, double, QQueryOperations>
      lastMealCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMealCalories');
    });
  }

  QueryBuilder<MetabolicState, double, QQueryOperations>
      lastMealCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMealCarbs');
    });
  }

  QueryBuilder<MetabolicState, double, QQueryOperations>
      muscleBuildinPotentialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'muscleBuildinPotential');
    });
  }

  QueryBuilder<MetabolicState, MetabolicPhase, QQueryOperations>
      phaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phase');
    });
  }

  QueryBuilder<MetabolicState, int, QQueryOperations>
      timeInCurrentStateMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeInCurrentStateMinutes');
    });
  }

  QueryBuilder<MetabolicState, int, QQueryOperations>
      timeSinceLastMealMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeSinceLastMealMinutes');
    });
  }

  QueryBuilder<MetabolicState, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
