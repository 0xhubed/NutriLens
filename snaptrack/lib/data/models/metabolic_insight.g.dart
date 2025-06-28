// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metabolic_insight.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMetabolicInsightCollection on Isar {
  IsarCollection<MetabolicInsight> get metabolicInsights => this.collection();
}

const MetabolicInsightSchema = CollectionSchema(
  name: r'MetabolicInsight',
  id: 2259374256680809887,
  properties: {
    r'actionItems': PropertySchema(
      id: 0,
      name: r'actionItems',
      type: IsarType.stringList,
    ),
    r'confidenceScore': PropertySchema(
      id: 1,
      name: r'confidenceScore',
      type: IsarType.long,
    ),
    r'contextHash': PropertySchema(
      id: 2,
      name: r'contextHash',
      type: IsarType.string,
    ),
    r'currentState': PropertySchema(
      id: 3,
      name: r'currentState',
      type: IsarType.string,
    ),
    r'fastingRecommendation': PropertySchema(
      id: 4,
      name: r'fastingRecommendation',
      type: IsarType.string,
    ),
    r'nextOptimalMealTime': PropertySchema(
      id: 5,
      name: r'nextOptimalMealTime',
      type: IsarType.string,
    ),
    r'reasoning': PropertySchema(
      id: 6,
      name: r'reasoning',
      type: IsarType.string,
    ),
    r'recommendation': PropertySchema(
      id: 7,
      name: r'recommendation',
      type: IsarType.string,
    ),
    r'recommendedCarbs': PropertySchema(
      id: 8,
      name: r'recommendedCarbs',
      type: IsarType.double,
    ),
    r'recommendedFat': PropertySchema(
      id: 9,
      name: r'recommendedFat',
      type: IsarType.double,
    ),
    r'recommendedProtein': PropertySchema(
      id: 10,
      name: r'recommendedProtein',
      type: IsarType.double,
    ),
    r'sleepOptimization': PropertySchema(
      id: 11,
      name: r'sleepOptimization',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 12,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 13,
      name: r'userId',
      type: IsarType.string,
    ),
    r'workoutTiming': PropertySchema(
      id: 14,
      name: r'workoutTiming',
      type: IsarType.string,
    )
  },
  estimateSize: _metabolicInsightEstimateSize,
  serialize: _metabolicInsightSerialize,
  deserialize: _metabolicInsightDeserialize,
  deserializeProp: _metabolicInsightDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _metabolicInsightGetId,
  getLinks: _metabolicInsightGetLinks,
  attach: _metabolicInsightAttach,
  version: '3.1.0+1',
);

int _metabolicInsightEstimateSize(
  MetabolicInsight object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actionItems.length * 3;
  {
    for (var i = 0; i < object.actionItems.length; i++) {
      final value = object.actionItems[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.contextHash.length * 3;
  bytesCount += 3 + object.currentState.length * 3;
  {
    final value = object.fastingRecommendation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nextOptimalMealTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.reasoning.length * 3;
  bytesCount += 3 + object.recommendation.length * 3;
  {
    final value = object.sleepOptimization;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  {
    final value = object.workoutTiming;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _metabolicInsightSerialize(
  MetabolicInsight object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.actionItems);
  writer.writeLong(offsets[1], object.confidenceScore);
  writer.writeString(offsets[2], object.contextHash);
  writer.writeString(offsets[3], object.currentState);
  writer.writeString(offsets[4], object.fastingRecommendation);
  writer.writeString(offsets[5], object.nextOptimalMealTime);
  writer.writeString(offsets[6], object.reasoning);
  writer.writeString(offsets[7], object.recommendation);
  writer.writeDouble(offsets[8], object.recommendedCarbs);
  writer.writeDouble(offsets[9], object.recommendedFat);
  writer.writeDouble(offsets[10], object.recommendedProtein);
  writer.writeString(offsets[11], object.sleepOptimization);
  writer.writeDateTime(offsets[12], object.timestamp);
  writer.writeString(offsets[13], object.userId);
  writer.writeString(offsets[14], object.workoutTiming);
}

MetabolicInsight _metabolicInsightDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MetabolicInsight();
  object.actionItems = reader.readStringList(offsets[0]) ?? [];
  object.confidenceScore = reader.readLong(offsets[1]);
  object.contextHash = reader.readString(offsets[2]);
  object.currentState = reader.readString(offsets[3]);
  object.fastingRecommendation = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.nextOptimalMealTime = reader.readStringOrNull(offsets[5]);
  object.reasoning = reader.readString(offsets[6]);
  object.recommendation = reader.readString(offsets[7]);
  object.recommendedCarbs = reader.readDouble(offsets[8]);
  object.recommendedFat = reader.readDouble(offsets[9]);
  object.recommendedProtein = reader.readDouble(offsets[10]);
  object.sleepOptimization = reader.readStringOrNull(offsets[11]);
  object.timestamp = reader.readDateTime(offsets[12]);
  object.userId = reader.readString(offsets[13]);
  object.workoutTiming = reader.readStringOrNull(offsets[14]);
  return object;
}

P _metabolicInsightDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _metabolicInsightGetId(MetabolicInsight object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _metabolicInsightGetLinks(MetabolicInsight object) {
  return [];
}

void _metabolicInsightAttach(
    IsarCollection<dynamic> col, Id id, MetabolicInsight object) {
  object.id = id;
}

extension MetabolicInsightQueryWhereSort
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QWhere> {
  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MetabolicInsightQueryWhere
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QWhereClause> {
  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterWhereClause>
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterWhereClause> idBetween(
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

extension MetabolicInsightQueryFilter
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QFilterCondition> {
  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actionItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actionItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actionItems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actionItems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionItems',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actionItems',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      actionItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actionItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      confidenceScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidenceScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      confidenceScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidenceScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      confidenceScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidenceScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      confidenceScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidenceScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contextHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contextHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contextHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contextHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contextHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contextHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contextHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contextHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contextHash',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      contextHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contextHash',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentState',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentState',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      currentStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentState',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fastingRecommendation',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fastingRecommendation',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fastingRecommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fastingRecommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fastingRecommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fastingRecommendation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fastingRecommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fastingRecommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fastingRecommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fastingRecommendation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fastingRecommendation',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      fastingRecommendationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fastingRecommendation',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextOptimalMealTime',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextOptimalMealTime',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextOptimalMealTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextOptimalMealTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextOptimalMealTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextOptimalMealTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nextOptimalMealTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nextOptimalMealTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nextOptimalMealTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nextOptimalMealTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextOptimalMealTime',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      nextOptimalMealTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nextOptimalMealTime',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasoning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasoning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasoning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasoning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasoning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasoning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasoning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasoning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasoning',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      reasoningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasoning',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recommendation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recommendation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recommendation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendation',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recommendation',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendedCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recommendedCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recommendedCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recommendedCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recommendedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recommendedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recommendedFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recommendedProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recommendedProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recommendedProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      recommendedProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recommendedProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sleepOptimization',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sleepOptimization',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepOptimization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepOptimization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepOptimization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepOptimization',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sleepOptimization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sleepOptimization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sleepOptimization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sleepOptimization',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepOptimization',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      sleepOptimizationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sleepOptimization',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
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

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workoutTiming',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workoutTiming',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workoutTiming',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workoutTiming',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workoutTiming',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workoutTiming',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workoutTiming',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workoutTiming',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workoutTiming',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workoutTiming',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workoutTiming',
        value: '',
      ));
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterFilterCondition>
      workoutTimingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workoutTiming',
        value: '',
      ));
    });
  }
}

extension MetabolicInsightQueryObject
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QFilterCondition> {}

extension MetabolicInsightQueryLinks
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QFilterCondition> {}

extension MetabolicInsightQuerySortBy
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QSortBy> {
  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByContextHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextHash', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByContextHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextHash', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByCurrentState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentState', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByCurrentStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentState', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByFastingRecommendation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingRecommendation', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByFastingRecommendationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingRecommendation', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByNextOptimalMealTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextOptimalMealTime', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByNextOptimalMealTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextOptimalMealTime', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByReasoning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasoning', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByReasoningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasoning', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendation', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendation', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendedCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedCarbs', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendedCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedCarbs', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendedFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedFat', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendedFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedFat', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendedProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedProtein', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByRecommendedProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedProtein', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortBySleepOptimization() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepOptimization', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortBySleepOptimizationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepOptimization', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByWorkoutTiming() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutTiming', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      sortByWorkoutTimingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutTiming', Sort.desc);
    });
  }
}

extension MetabolicInsightQuerySortThenBy
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QSortThenBy> {
  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidenceScore', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByContextHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextHash', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByContextHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contextHash', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByCurrentState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentState', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByCurrentStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentState', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByFastingRecommendation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingRecommendation', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByFastingRecommendationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fastingRecommendation', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByNextOptimalMealTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextOptimalMealTime', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByNextOptimalMealTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextOptimalMealTime', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByReasoning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasoning', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByReasoningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasoning', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendation', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendation', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendedCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedCarbs', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendedCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedCarbs', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendedFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedFat', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendedFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedFat', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendedProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedProtein', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByRecommendedProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recommendedProtein', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenBySleepOptimization() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepOptimization', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenBySleepOptimizationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepOptimization', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByWorkoutTiming() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutTiming', Sort.asc);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QAfterSortBy>
      thenByWorkoutTimingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutTiming', Sort.desc);
    });
  }
}

extension MetabolicInsightQueryWhereDistinct
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct> {
  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByActionItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actionItems');
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidenceScore');
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByContextHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contextHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByCurrentState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentState', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByFastingRecommendation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fastingRecommendation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByNextOptimalMealTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextOptimalMealTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByReasoning({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasoning', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByRecommendation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recommendation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByRecommendedCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recommendedCarbs');
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByRecommendedFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recommendedFat');
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByRecommendedProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recommendedProtein');
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctBySleepOptimization({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepOptimization',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetabolicInsight, MetabolicInsight, QDistinct>
      distinctByWorkoutTiming({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workoutTiming',
          caseSensitive: caseSensitive);
    });
  }
}

extension MetabolicInsightQueryProperty
    on QueryBuilder<MetabolicInsight, MetabolicInsight, QQueryProperty> {
  QueryBuilder<MetabolicInsight, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MetabolicInsight, List<String>, QQueryOperations>
      actionItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actionItems');
    });
  }

  QueryBuilder<MetabolicInsight, int, QQueryOperations>
      confidenceScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidenceScore');
    });
  }

  QueryBuilder<MetabolicInsight, String, QQueryOperations>
      contextHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contextHash');
    });
  }

  QueryBuilder<MetabolicInsight, String, QQueryOperations>
      currentStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentState');
    });
  }

  QueryBuilder<MetabolicInsight, String?, QQueryOperations>
      fastingRecommendationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fastingRecommendation');
    });
  }

  QueryBuilder<MetabolicInsight, String?, QQueryOperations>
      nextOptimalMealTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextOptimalMealTime');
    });
  }

  QueryBuilder<MetabolicInsight, String, QQueryOperations> reasoningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasoning');
    });
  }

  QueryBuilder<MetabolicInsight, String, QQueryOperations>
      recommendationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recommendation');
    });
  }

  QueryBuilder<MetabolicInsight, double, QQueryOperations>
      recommendedCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recommendedCarbs');
    });
  }

  QueryBuilder<MetabolicInsight, double, QQueryOperations>
      recommendedFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recommendedFat');
    });
  }

  QueryBuilder<MetabolicInsight, double, QQueryOperations>
      recommendedProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recommendedProtein');
    });
  }

  QueryBuilder<MetabolicInsight, String?, QQueryOperations>
      sleepOptimizationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepOptimization');
    });
  }

  QueryBuilder<MetabolicInsight, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<MetabolicInsight, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<MetabolicInsight, String?, QQueryOperations>
      workoutTimingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workoutTiming');
    });
  }
}
