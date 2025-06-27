// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_guide.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMeasurementGuideCollection on Isar {
  IsarCollection<MeasurementGuide> get measurementGuides => this.collection();
}

const MeasurementGuideSchema = CollectionSchema(
  name: r'MeasurementGuide',
  id: -4850968210295224094,
  properties: {
    r'accuracyTips': PropertySchema(
      id: 0,
      name: r'accuracyTips',
      type: IsarType.string,
    ),
    r'approximateCalories': PropertySchema(
      id: 1,
      name: r'approximateCalories',
      type: IsarType.double,
    ),
    r'approximateGrams': PropertySchema(
      id: 2,
      name: r'approximateGrams',
      type: IsarType.double,
    ),
    r'bestFor': PropertySchema(
      id: 3,
      name: r'bestFor',
      type: IsarType.stringList,
    ),
    r'category': PropertySchema(
      id: 4,
      name: r'category',
      type: IsarType.byte,
      enumMap: _MeasurementGuidecategoryEnumValueMap,
    ),
    r'commonMistakes': PropertySchema(
      id: 5,
      name: r'commonMistakes',
      type: IsarType.string,
    ),
    r'commonObjects': PropertySchema(
      id: 6,
      name: r'commonObjects',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 7,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 8,
      name: r'description',
      type: IsarType.string,
    ),
    r'examples': PropertySchema(
      id: 9,
      name: r'examples',
      type: IsarType.stringList,
    ),
    r'handComparisons': PropertySchema(
      id: 10,
      name: r'handComparisons',
      type: IsarType.stringList,
    ),
    r'hasMeasurementTips': PropertySchema(
      id: 11,
      name: r'hasMeasurementTips',
      type: IsarType.bool,
    ),
    r'hasVisualReferences': PropertySchema(
      id: 12,
      name: r'hasVisualReferences',
      type: IsarType.bool,
    ),
    r'helpText': PropertySchema(
      id: 13,
      name: r'helpText',
      type: IsarType.string,
    ),
    r'howToMeasure': PropertySchema(
      id: 14,
      name: r'howToMeasure',
      type: IsarType.string,
    ),
    r'isUserFavorite': PropertySchema(
      id: 15,
      name: r'isUserFavorite',
      type: IsarType.bool,
    ),
    r'lastViewed': PropertySchema(
      id: 16,
      name: r'lastViewed',
      type: IsarType.dateTime,
    ),
    r'primaryExample': PropertySchema(
      id: 17,
      name: r'primaryExample',
      type: IsarType.string,
    ),
    r'primaryVisualComparison': PropertySchema(
      id: 18,
      name: r'primaryVisualComparison',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 19,
      name: r'title',
      type: IsarType.string,
    ),
    r'unitDisplayName': PropertySchema(
      id: 20,
      name: r'unitDisplayName',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 21,
      name: r'unitId',
      type: IsarType.string,
    ),
    r'viewCount': PropertySchema(
      id: 22,
      name: r'viewCount',
      type: IsarType.long,
    ),
    r'visualComparison': PropertySchema(
      id: 23,
      name: r'visualComparison',
      type: IsarType.string,
    ),
    r'visualComparisons': PropertySchema(
      id: 24,
      name: r'visualComparisons',
      type: IsarType.stringList,
    )
  },
  estimateSize: _measurementGuideEstimateSize,
  serialize: _measurementGuideSerialize,
  deserialize: _measurementGuideDeserialize,
  deserializeProp: _measurementGuideDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _measurementGuideGetId,
  getLinks: _measurementGuideGetLinks,
  attach: _measurementGuideAttach,
  version: '3.1.0+1',
);

int _measurementGuideEstimateSize(
  MeasurementGuide object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accuracyTips;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.bestFor.length * 3;
  {
    for (var i = 0; i < object.bestFor.length; i++) {
      final value = object.bestFor[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.commonMistakes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.commonObjects.length * 3;
  {
    for (var i = 0; i < object.commonObjects.length; i++) {
      final value = object.commonObjects[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.examples.length * 3;
  {
    for (var i = 0; i < object.examples.length; i++) {
      final value = object.examples[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.handComparisons.length * 3;
  {
    for (var i = 0; i < object.handComparisons.length; i++) {
      final value = object.handComparisons[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.helpText.length * 3;
  {
    final value = object.howToMeasure;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.primaryExample.length * 3;
  bytesCount += 3 + object.primaryVisualComparison.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.unitDisplayName.length * 3;
  bytesCount += 3 + object.unitId.length * 3;
  bytesCount += 3 + object.visualComparison.length * 3;
  bytesCount += 3 + object.visualComparisons.length * 3;
  {
    for (var i = 0; i < object.visualComparisons.length; i++) {
      final value = object.visualComparisons[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _measurementGuideSerialize(
  MeasurementGuide object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accuracyTips);
  writer.writeDouble(offsets[1], object.approximateCalories);
  writer.writeDouble(offsets[2], object.approximateGrams);
  writer.writeStringList(offsets[3], object.bestFor);
  writer.writeByte(offsets[4], object.category.index);
  writer.writeString(offsets[5], object.commonMistakes);
  writer.writeStringList(offsets[6], object.commonObjects);
  writer.writeDateTime(offsets[7], object.createdAt);
  writer.writeString(offsets[8], object.description);
  writer.writeStringList(offsets[9], object.examples);
  writer.writeStringList(offsets[10], object.handComparisons);
  writer.writeBool(offsets[11], object.hasMeasurementTips);
  writer.writeBool(offsets[12], object.hasVisualReferences);
  writer.writeString(offsets[13], object.helpText);
  writer.writeString(offsets[14], object.howToMeasure);
  writer.writeBool(offsets[15], object.isUserFavorite);
  writer.writeDateTime(offsets[16], object.lastViewed);
  writer.writeString(offsets[17], object.primaryExample);
  writer.writeString(offsets[18], object.primaryVisualComparison);
  writer.writeString(offsets[19], object.title);
  writer.writeString(offsets[20], object.unitDisplayName);
  writer.writeString(offsets[21], object.unitId);
  writer.writeLong(offsets[22], object.viewCount);
  writer.writeString(offsets[23], object.visualComparison);
  writer.writeStringList(offsets[24], object.visualComparisons);
}

MeasurementGuide _measurementGuideDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MeasurementGuide();
  object.accuracyTips = reader.readStringOrNull(offsets[0]);
  object.approximateCalories = reader.readDoubleOrNull(offsets[1]);
  object.approximateGrams = reader.readDoubleOrNull(offsets[2]);
  object.bestFor = reader.readStringList(offsets[3]) ?? [];
  object.category = _MeasurementGuidecategoryValueEnumMap[
          reader.readByteOrNull(offsets[4])] ??
      MeasurementCategory.liquid;
  object.commonMistakes = reader.readStringOrNull(offsets[5]);
  object.commonObjects = reader.readStringList(offsets[6]) ?? [];
  object.createdAt = reader.readDateTime(offsets[7]);
  object.description = reader.readString(offsets[8]);
  object.examples = reader.readStringList(offsets[9]) ?? [];
  object.handComparisons = reader.readStringList(offsets[10]) ?? [];
  object.helpText = reader.readString(offsets[13]);
  object.howToMeasure = reader.readStringOrNull(offsets[14]);
  object.id = id;
  object.isUserFavorite = reader.readBool(offsets[15]);
  object.lastViewed = reader.readDateTimeOrNull(offsets[16]);
  object.title = reader.readString(offsets[19]);
  object.unitDisplayName = reader.readString(offsets[20]);
  object.unitId = reader.readString(offsets[21]);
  object.viewCount = reader.readLong(offsets[22]);
  object.visualComparison = reader.readString(offsets[23]);
  object.visualComparisons = reader.readStringList(offsets[24]) ?? [];
  return object;
}

P _measurementGuideDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (_MeasurementGuidecategoryValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MeasurementCategory.liquid) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MeasurementGuidecategoryEnumValueMap = {
  'liquid': 0,
  'powder': 1,
  'solid': 2,
  'bulk': 3,
  'custom': 4,
};
const _MeasurementGuidecategoryValueEnumMap = {
  0: MeasurementCategory.liquid,
  1: MeasurementCategory.powder,
  2: MeasurementCategory.solid,
  3: MeasurementCategory.bulk,
  4: MeasurementCategory.custom,
};

Id _measurementGuideGetId(MeasurementGuide object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _measurementGuideGetLinks(MeasurementGuide object) {
  return [];
}

void _measurementGuideAttach(
    IsarCollection<dynamic> col, Id id, MeasurementGuide object) {
  object.id = id;
}

extension MeasurementGuideQueryWhereSort
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QWhere> {
  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeasurementGuideQueryWhere
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QWhereClause> {
  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterWhereClause>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterWhereClause> idBetween(
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

extension MeasurementGuideQueryFilter
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QFilterCondition> {
  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accuracyTips',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accuracyTips',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracyTips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracyTips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracyTips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracyTips',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accuracyTips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accuracyTips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accuracyTips',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accuracyTips',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracyTips',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      accuracyTipsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accuracyTips',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateCaloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approximateCalories',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateCaloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approximateCalories',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateCaloriesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approximateCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateCaloriesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approximateCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateCaloriesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approximateCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateCaloriesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approximateCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateGramsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approximateGrams',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateGramsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approximateGrams',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateGramsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approximateGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateGramsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approximateGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateGramsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approximateGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      approximateGramsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approximateGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestFor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bestFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bestFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bestFor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bestFor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestFor',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bestFor',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bestFor',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bestFor',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bestFor',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bestFor',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bestFor',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      bestForLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bestFor',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      categoryEqualTo(MeasurementCategory value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      categoryGreaterThan(
    MeasurementCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      categoryLessThan(
    MeasurementCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      categoryBetween(
    MeasurementCategory lower,
    MeasurementCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commonMistakes',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commonMistakes',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commonMistakes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commonMistakes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commonMistakes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonMistakes',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonMistakesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commonMistakes',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonObjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commonObjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commonObjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commonObjects',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commonObjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commonObjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commonObjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commonObjects',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonObjects',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commonObjects',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonObjects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonObjects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonObjects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonObjects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonObjects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      commonObjectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'commonObjects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examples',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examples',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examples',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examples',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      examplesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examples',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'handComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'handComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'handComparisons',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'handComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'handComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handComparisons',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handComparisons',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handComparisons',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'handComparisons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'handComparisons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'handComparisons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'handComparisons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'handComparisons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      handComparisonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'handComparisons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      hasMeasurementTipsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasMeasurementTips',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      hasVisualReferencesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasVisualReferences',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'helpText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'helpText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'helpText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'helpText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'helpText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'helpText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'helpText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'helpText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'helpText',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      helpTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'helpText',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'howToMeasure',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'howToMeasure',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'howToMeasure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'howToMeasure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'howToMeasure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'howToMeasure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'howToMeasure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'howToMeasure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'howToMeasure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'howToMeasure',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'howToMeasure',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      howToMeasureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'howToMeasure',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
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

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      isUserFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUserFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      lastViewedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastViewed',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      lastViewedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastViewed',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      lastViewedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastViewed',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      lastViewedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastViewed',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      lastViewedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastViewed',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      lastViewedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastViewed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryExample',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryExample',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryExample',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryExample',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'primaryExample',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'primaryExample',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'primaryExample',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'primaryExample',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryExample',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryExampleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'primaryExample',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryVisualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryVisualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryVisualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryVisualComparison',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'primaryVisualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'primaryVisualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'primaryVisualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'primaryVisualComparison',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryVisualComparison',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      primaryVisualComparisonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'primaryVisualComparison',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDisplayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitDisplayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDisplayName',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitDisplayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitDisplayName',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      viewCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      viewCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      viewCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      viewCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visualComparison',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visualComparison',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visualComparison',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualComparison',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visualComparison',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visualComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visualComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visualComparisons',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visualComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visualComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visualComparisons',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visualComparisons',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualComparisons',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visualComparisons',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visualComparisons',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visualComparisons',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visualComparisons',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visualComparisons',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visualComparisons',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterFilterCondition>
      visualComparisonsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visualComparisons',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MeasurementGuideQueryObject
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QFilterCondition> {}

extension MeasurementGuideQueryLinks
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QFilterCondition> {}

extension MeasurementGuideQuerySortBy
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QSortBy> {
  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByAccuracyTips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyTips', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByAccuracyTipsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyTips', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByApproximateCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateCalories', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByApproximateCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateCalories', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByApproximateGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateGrams', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByApproximateGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateGrams', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByCommonMistakes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonMistakes', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByCommonMistakesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonMistakes', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHasMeasurementTips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMeasurementTips', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHasMeasurementTipsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMeasurementTips', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHasVisualReferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualReferences', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHasVisualReferencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualReferences', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHelpText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpText', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHelpTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpText', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHowToMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howToMeasure', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByHowToMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howToMeasure', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByIsUserFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserFavorite', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByIsUserFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserFavorite', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByLastViewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewed', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByLastViewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewed', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByPrimaryExample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryExample', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByPrimaryExampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryExample', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByPrimaryVisualComparison() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryVisualComparison', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByPrimaryVisualComparisonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryVisualComparison', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByUnitDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDisplayName', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByUnitDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDisplayName', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByViewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByVisualComparison() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualComparison', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      sortByVisualComparisonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualComparison', Sort.desc);
    });
  }
}

extension MeasurementGuideQuerySortThenBy
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QSortThenBy> {
  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByAccuracyTips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyTips', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByAccuracyTipsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyTips', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByApproximateCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateCalories', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByApproximateCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateCalories', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByApproximateGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateGrams', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByApproximateGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approximateGrams', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByCommonMistakes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonMistakes', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByCommonMistakesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonMistakes', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHasMeasurementTips() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMeasurementTips', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHasMeasurementTipsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMeasurementTips', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHasVisualReferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualReferences', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHasVisualReferencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVisualReferences', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHelpText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpText', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHelpTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'helpText', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHowToMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howToMeasure', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByHowToMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howToMeasure', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByIsUserFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserFavorite', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByIsUserFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserFavorite', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByLastViewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewed', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByLastViewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewed', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByPrimaryExample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryExample', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByPrimaryExampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryExample', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByPrimaryVisualComparison() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryVisualComparison', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByPrimaryVisualComparisonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryVisualComparison', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByUnitDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDisplayName', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByUnitDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDisplayName', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByViewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.desc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByVisualComparison() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualComparison', Sort.asc);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QAfterSortBy>
      thenByVisualComparisonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualComparison', Sort.desc);
    });
  }
}

extension MeasurementGuideQueryWhereDistinct
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct> {
  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByAccuracyTips({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracyTips', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByApproximateCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approximateCalories');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByApproximateGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approximateGrams');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByBestFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bestFor');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByCommonMistakes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonMistakes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByCommonObjects() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonObjects');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByExamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examples');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByHandComparisons() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handComparisons');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByHasMeasurementTips() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasMeasurementTips');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByHasVisualReferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasVisualReferences');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByHelpText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'helpText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByHowToMeasure({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'howToMeasure', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByIsUserFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUserFavorite');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByLastViewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastViewed');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByPrimaryExample({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryExample',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByPrimaryVisualComparison({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryVisualComparison',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByUnitDisplayName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDisplayName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct> distinctByUnitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewCount');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByVisualComparison({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visualComparison',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementGuide, QDistinct>
      distinctByVisualComparisons() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visualComparisons');
    });
  }
}

extension MeasurementGuideQueryProperty
    on QueryBuilder<MeasurementGuide, MeasurementGuide, QQueryProperty> {
  QueryBuilder<MeasurementGuide, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MeasurementGuide, String?, QQueryOperations>
      accuracyTipsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracyTips');
    });
  }

  QueryBuilder<MeasurementGuide, double?, QQueryOperations>
      approximateCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approximateCalories');
    });
  }

  QueryBuilder<MeasurementGuide, double?, QQueryOperations>
      approximateGramsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approximateGrams');
    });
  }

  QueryBuilder<MeasurementGuide, List<String>, QQueryOperations>
      bestForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bestFor');
    });
  }

  QueryBuilder<MeasurementGuide, MeasurementCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<MeasurementGuide, String?, QQueryOperations>
      commonMistakesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonMistakes');
    });
  }

  QueryBuilder<MeasurementGuide, List<String>, QQueryOperations>
      commonObjectsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonObjects');
    });
  }

  QueryBuilder<MeasurementGuide, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MeasurementGuide, List<String>, QQueryOperations>
      examplesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examples');
    });
  }

  QueryBuilder<MeasurementGuide, List<String>, QQueryOperations>
      handComparisonsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handComparisons');
    });
  }

  QueryBuilder<MeasurementGuide, bool, QQueryOperations>
      hasMeasurementTipsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasMeasurementTips');
    });
  }

  QueryBuilder<MeasurementGuide, bool, QQueryOperations>
      hasVisualReferencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasVisualReferences');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations> helpTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'helpText');
    });
  }

  QueryBuilder<MeasurementGuide, String?, QQueryOperations>
      howToMeasureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'howToMeasure');
    });
  }

  QueryBuilder<MeasurementGuide, bool, QQueryOperations>
      isUserFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUserFavorite');
    });
  }

  QueryBuilder<MeasurementGuide, DateTime?, QQueryOperations>
      lastViewedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastViewed');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations>
      primaryExampleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryExample');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations>
      primaryVisualComparisonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryVisualComparison');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations>
      unitDisplayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDisplayName');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }

  QueryBuilder<MeasurementGuide, int, QQueryOperations> viewCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewCount');
    });
  }

  QueryBuilder<MeasurementGuide, String, QQueryOperations>
      visualComparisonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visualComparison');
    });
  }

  QueryBuilder<MeasurementGuide, List<String>, QQueryOperations>
      visualComparisonsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visualComparisons');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VisualReferenceSchema = Schema(
  name: r'VisualReference',
  id: 41053854604668473,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'iconName': PropertySchema(
      id: 1,
      name: r'iconName',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 2,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'size': PropertySchema(
      id: 3,
      name: r'size',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _visualReferenceEstimateSize,
  serialize: _visualReferenceSerialize,
  deserialize: _visualReferenceDeserialize,
  deserializeProp: _visualReferenceDeserializeProp,
);

int _visualReferenceEstimateSize(
  VisualReference object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.iconName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _visualReferenceSerialize(
  VisualReference object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeString(offsets[1], object.iconName);
  writer.writeString(offsets[2], object.imagePath);
  writer.writeDouble(offsets[3], object.size);
  writer.writeString(offsets[4], object.type);
}

VisualReference _visualReferenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisualReference();
  object.description = reader.readString(offsets[0]);
  object.iconName = reader.readStringOrNull(offsets[1]);
  object.imagePath = reader.readStringOrNull(offsets[2]);
  object.size = reader.readDoubleOrNull(offsets[3]);
  object.type = reader.readString(offsets[4]);
  return object;
}

P _visualReferenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VisualReferenceQueryFilter
    on QueryBuilder<VisualReference, VisualReference, QFilterCondition> {
  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
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

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
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

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
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

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
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

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
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

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
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

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconName',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconName',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconName',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      iconNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconName',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      sizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      sizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      sizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      sizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualReference, VisualReference, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension VisualReferenceQueryObject
    on QueryBuilder<VisualReference, VisualReference, QFilterCondition> {}
