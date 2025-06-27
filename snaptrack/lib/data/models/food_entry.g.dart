// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodEntryCollection on Isar {
  IsarCollection<FoodEntry> get foodEntrys => this.collection();
}

const FoodEntrySchema = CollectionSchema(
  name: r'FoodEntry',
  id: -3633015723928946904,
  properties: {
    r'actualWeight': PropertySchema(
      id: 0,
      name: r'actualWeight',
      type: IsarType.double,
    ),
    r'aiProvider': PropertySchema(
      id: 1,
      name: r'aiProvider',
      type: IsarType.string,
    ),
    r'calories': PropertySchema(
      id: 2,
      name: r'calories',
      type: IsarType.double,
    ),
    r'carbs': PropertySchema(
      id: 3,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'cookingMethod': PropertySchema(
      id: 4,
      name: r'cookingMethod',
      type: IsarType.string,
    ),
    r'cuisine': PropertySchema(
      id: 5,
      name: r'cuisine',
      type: IsarType.byte,
      enumMap: _FoodEntrycuisineEnumValueMap,
    ),
    r'detectedItems': PropertySchema(
      id: 6,
      name: r'detectedItems',
      type: IsarType.objectList,
      target: r'DetectedFoodItem',
    ),
    r'dietaryTags': PropertySchema(
      id: 7,
      name: r'dietaryTags',
      type: IsarType.byteList,
      enumMap: _FoodEntrydietaryTagsEnumValueMap,
    ),
    r'effectiveCalories': PropertySchema(
      id: 8,
      name: r'effectiveCalories',
      type: IsarType.double,
    ),
    r'effectiveCarbs': PropertySchema(
      id: 9,
      name: r'effectiveCarbs',
      type: IsarType.double,
    ),
    r'effectiveFat': PropertySchema(
      id: 10,
      name: r'effectiveFat',
      type: IsarType.double,
    ),
    r'effectiveProtein': PropertySchema(
      id: 11,
      name: r'effectiveProtein',
      type: IsarType.double,
    ),
    r'effectiveWeight': PropertySchema(
      id: 12,
      name: r'effectiveWeight',
      type: IsarType.double,
    ),
    r'estimatedWeight': PropertySchema(
      id: 13,
      name: r'estimatedWeight',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 14,
      name: r'fat',
      type: IsarType.double,
    ),
    r'foodGroups': PropertySchema(
      id: 15,
      name: r'foodGroups',
      type: IsarType.byteList,
      enumMap: _FoodEntryfoodGroupsEnumValueMap,
    ),
    r'imageBase64': PropertySchema(
      id: 16,
      name: r'imageBase64',
      type: IsarType.string,
    ),
    r'mealType': PropertySchema(
      id: 17,
      name: r'mealType',
      type: IsarType.byte,
      enumMap: _FoodEntrymealTypeEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 18,
      name: r'name',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 19,
      name: r'notes',
      type: IsarType.string,
    ),
    r'portionCalories': PropertySchema(
      id: 20,
      name: r'portionCalories',
      type: IsarType.double,
    ),
    r'portionCarbs': PropertySchema(
      id: 21,
      name: r'portionCarbs',
      type: IsarType.double,
    ),
    r'portionFat': PropertySchema(
      id: 22,
      name: r'portionFat',
      type: IsarType.double,
    ),
    r'portionProtein': PropertySchema(
      id: 23,
      name: r'portionProtein',
      type: IsarType.double,
    ),
    r'portionSize': PropertySchema(
      id: 24,
      name: r'portionSize',
      type: IsarType.string,
    ),
    r'portionSummary': PropertySchema(
      id: 25,
      name: r'portionSummary',
      type: IsarType.string,
    ),
    r'portions': PropertySchema(
      id: 26,
      name: r'portions',
      type: IsarType.objectList,
      target: r'FoodPortion',
    ),
    r'protein': PropertySchema(
      id: 27,
      name: r'protein',
      type: IsarType.double,
    ),
    r'timestamp': PropertySchema(
      id: 28,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'totalMacros': PropertySchema(
      id: 29,
      name: r'totalMacros',
      type: IsarType.double,
    ),
    r'totalPortionWeight': PropertySchema(
      id: 30,
      name: r'totalPortionWeight',
      type: IsarType.double,
    ),
    r'usePortions': PropertySchema(
      id: 31,
      name: r'usePortions',
      type: IsarType.bool,
    ),
    r'userWeight': PropertySchema(
      id: 32,
      name: r'userWeight',
      type: IsarType.double,
    )
  },
  estimateSize: _foodEntryEstimateSize,
  serialize: _foodEntrySerialize,
  deserialize: _foodEntryDeserialize,
  deserializeProp: _foodEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'DetectedFoodItem': DetectedFoodItemSchema,
    r'FoodPortion': FoodPortionSchema
  },
  getId: _foodEntryGetId,
  getLinks: _foodEntryGetLinks,
  attach: _foodEntryAttach,
  version: '3.1.0+1',
);

int _foodEntryEstimateSize(
  FoodEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aiProvider;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cookingMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.detectedItems.length * 3;
  {
    final offsets = allOffsets[DetectedFoodItem]!;
    for (var i = 0; i < object.detectedItems.length; i++) {
      final value = object.detectedItems[i];
      bytesCount +=
          DetectedFoodItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.dietaryTags.length;
  bytesCount += 3 + object.foodGroups.length;
  bytesCount += 3 + object.imageBase64.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.portionSize;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.portionSummary.length * 3;
  bytesCount += 3 + object.portions.length * 3;
  {
    final offsets = allOffsets[FoodPortion]!;
    for (var i = 0; i < object.portions.length; i++) {
      final value = object.portions[i];
      bytesCount += FoodPortionSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _foodEntrySerialize(
  FoodEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actualWeight);
  writer.writeString(offsets[1], object.aiProvider);
  writer.writeDouble(offsets[2], object.calories);
  writer.writeDouble(offsets[3], object.carbs);
  writer.writeString(offsets[4], object.cookingMethod);
  writer.writeByte(offsets[5], object.cuisine.index);
  writer.writeObjectList<DetectedFoodItem>(
    offsets[6],
    allOffsets,
    DetectedFoodItemSchema.serialize,
    object.detectedItems,
  );
  writer.writeByteList(
      offsets[7], object.dietaryTags.map((e) => e.index).toList());
  writer.writeDouble(offsets[8], object.effectiveCalories);
  writer.writeDouble(offsets[9], object.effectiveCarbs);
  writer.writeDouble(offsets[10], object.effectiveFat);
  writer.writeDouble(offsets[11], object.effectiveProtein);
  writer.writeDouble(offsets[12], object.effectiveWeight);
  writer.writeDouble(offsets[13], object.estimatedWeight);
  writer.writeDouble(offsets[14], object.fat);
  writer.writeByteList(
      offsets[15], object.foodGroups.map((e) => e.index).toList());
  writer.writeString(offsets[16], object.imageBase64);
  writer.writeByte(offsets[17], object.mealType.index);
  writer.writeString(offsets[18], object.name);
  writer.writeString(offsets[19], object.notes);
  writer.writeDouble(offsets[20], object.portionCalories);
  writer.writeDouble(offsets[21], object.portionCarbs);
  writer.writeDouble(offsets[22], object.portionFat);
  writer.writeDouble(offsets[23], object.portionProtein);
  writer.writeString(offsets[24], object.portionSize);
  writer.writeString(offsets[25], object.portionSummary);
  writer.writeObjectList<FoodPortion>(
    offsets[26],
    allOffsets,
    FoodPortionSchema.serialize,
    object.portions,
  );
  writer.writeDouble(offsets[27], object.protein);
  writer.writeDateTime(offsets[28], object.timestamp);
  writer.writeDouble(offsets[29], object.totalMacros);
  writer.writeDouble(offsets[30], object.totalPortionWeight);
  writer.writeBool(offsets[31], object.usePortions);
  writer.writeDouble(offsets[32], object.userWeight);
}

FoodEntry _foodEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodEntry();
  object.aiProvider = reader.readStringOrNull(offsets[1]);
  object.calories = reader.readDouble(offsets[2]);
  object.carbs = reader.readDouble(offsets[3]);
  object.cookingMethod = reader.readStringOrNull(offsets[4]);
  object.cuisine =
      _FoodEntrycuisineValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          CuisineType.italian;
  object.detectedItems = reader.readObjectList<DetectedFoodItem>(
        offsets[6],
        DetectedFoodItemSchema.deserialize,
        allOffsets,
        DetectedFoodItem(),
      ) ??
      [];
  object.dietaryTags = reader
          .readByteList(offsets[7])
          ?.map((e) =>
              _FoodEntrydietaryTagsValueEnumMap[e] ?? DietaryTag.vegetarian)
          .toList() ??
      [];
  object.estimatedWeight = reader.readDoubleOrNull(offsets[13]);
  object.fat = reader.readDouble(offsets[14]);
  object.foodGroups = reader
          .readByteList(offsets[15])
          ?.map(
              (e) => _FoodEntryfoodGroupsValueEnumMap[e] ?? FoodGroup.proteins)
          .toList() ??
      [];
  object.id = id;
  object.imageBase64 = reader.readString(offsets[16]);
  object.mealType =
      _FoodEntrymealTypeValueEnumMap[reader.readByteOrNull(offsets[17])] ??
          MealType.breakfast;
  object.name = reader.readString(offsets[18]);
  object.notes = reader.readStringOrNull(offsets[19]);
  object.portionSize = reader.readStringOrNull(offsets[24]);
  object.portions = reader.readObjectList<FoodPortion>(
        offsets[26],
        FoodPortionSchema.deserialize,
        allOffsets,
        FoodPortion(),
      ) ??
      [];
  object.protein = reader.readDouble(offsets[27]);
  object.timestamp = reader.readDateTime(offsets[28]);
  object.usePortions = reader.readBool(offsets[31]);
  object.userWeight = reader.readDoubleOrNull(offsets[32]);
  return object;
}

P _foodEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_FoodEntrycuisineValueEnumMap[reader.readByteOrNull(offset)] ??
          CuisineType.italian) as P;
    case 6:
      return (reader.readObjectList<DetectedFoodItem>(
            offset,
            DetectedFoodItemSchema.deserialize,
            allOffsets,
            DetectedFoodItem(),
          ) ??
          []) as P;
    case 7:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _FoodEntrydietaryTagsValueEnumMap[e] ?? DietaryTag.vegetarian)
              .toList() ??
          []) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _FoodEntryfoodGroupsValueEnumMap[e] ?? FoodGroup.proteins)
              .toList() ??
          []) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (_FoodEntrymealTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          MealType.breakfast) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readObjectList<FoodPortion>(
            offset,
            FoodPortionSchema.deserialize,
            allOffsets,
            FoodPortion(),
          ) ??
          []) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readDateTime(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readBool(offset)) as P;
    case 32:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FoodEntrycuisineEnumValueMap = {
  'italian': 0,
  'asian': 1,
  'american': 2,
  'mexican': 3,
  'indian': 4,
  'mediterranean': 5,
  'other': 6,
};
const _FoodEntrycuisineValueEnumMap = {
  0: CuisineType.italian,
  1: CuisineType.asian,
  2: CuisineType.american,
  3: CuisineType.mexican,
  4: CuisineType.indian,
  5: CuisineType.mediterranean,
  6: CuisineType.other,
};
const _FoodEntrydietaryTagsEnumValueMap = {
  'vegetarian': 0,
  'vegan': 1,
  'glutenFree': 2,
  'ketoFriendly': 3,
  'lowCarb': 4,
  'highProtein': 5,
  'none': 6,
};
const _FoodEntrydietaryTagsValueEnumMap = {
  0: DietaryTag.vegetarian,
  1: DietaryTag.vegan,
  2: DietaryTag.glutenFree,
  3: DietaryTag.ketoFriendly,
  4: DietaryTag.lowCarb,
  5: DietaryTag.highProtein,
  6: DietaryTag.none,
};
const _FoodEntryfoodGroupsEnumValueMap = {
  'proteins': 0,
  'grains': 1,
  'vegetables': 2,
  'fruits': 3,
  'dairy': 4,
  'fats': 5,
  'other': 6,
};
const _FoodEntryfoodGroupsValueEnumMap = {
  0: FoodGroup.proteins,
  1: FoodGroup.grains,
  2: FoodGroup.vegetables,
  3: FoodGroup.fruits,
  4: FoodGroup.dairy,
  5: FoodGroup.fats,
  6: FoodGroup.other,
};
const _FoodEntrymealTypeEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
  'snack': 3,
};
const _FoodEntrymealTypeValueEnumMap = {
  0: MealType.breakfast,
  1: MealType.lunch,
  2: MealType.dinner,
  3: MealType.snack,
};

Id _foodEntryGetId(FoodEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodEntryGetLinks(FoodEntry object) {
  return [];
}

void _foodEntryAttach(IsarCollection<dynamic> col, Id id, FoodEntry object) {
  object.id = id;
}

extension FoodEntryQueryWhereSort
    on QueryBuilder<FoodEntry, FoodEntry, QWhere> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodEntryQueryWhere
    on QueryBuilder<FoodEntry, FoodEntry, QWhereClause> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idBetween(
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

extension FoodEntryQueryFilter
    on QueryBuilder<FoodEntry, FoodEntry, QFilterCondition> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> actualWeightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      actualWeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      actualWeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> actualWeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aiProvider',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      aiProviderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aiProvider',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      aiProviderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aiProvider',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      aiProviderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aiProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> aiProviderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aiProvider',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      aiProviderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiProvider',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      aiProviderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aiProvider',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> caloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> caloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> caloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> caloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> carbsEqualTo(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> carbsGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> carbsLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> carbsBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cookingMethod',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cookingMethod',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cookingMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cookingMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cookingMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cookingMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cookingMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cookingMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cookingMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cookingMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cookingMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      cookingMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cookingMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> cuisineEqualTo(
      CuisineType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuisine',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> cuisineGreaterThan(
    CuisineType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cuisine',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> cuisineLessThan(
    CuisineType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cuisine',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> cuisineBetween(
    CuisineType lower,
    CuisineType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cuisine',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detectedItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detectedItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detectedItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detectedItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detectedItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'detectedItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsElementEqualTo(DietaryTag value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dietaryTags',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsElementGreaterThan(
    DietaryTag value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dietaryTags',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsElementLessThan(
    DietaryTag value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dietaryTags',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsElementBetween(
    DietaryTag lower,
    DietaryTag upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dietaryTags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      dietaryTagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dietaryTags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCaloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCaloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCaloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCaloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> effectiveFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> effectiveFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveWeightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveWeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveWeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      effectiveWeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      estimatedWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedWeight',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      estimatedWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedWeight',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      estimatedWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      estimatedWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      estimatedWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      estimatedWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> fatEqualTo(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> fatGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> fatLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> fatBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsElementEqualTo(FoodGroup value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsElementGreaterThan(
    FoodGroup value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsElementLessThan(
    FoodGroup value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsElementBetween(
    FoodGroup lower,
    FoodGroup upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodGroups',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      foodGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> imageBase64EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      imageBase64GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> imageBase64LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> imageBase64Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageBase64',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      imageBase64StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> imageBase64EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> imageBase64Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> imageBase64Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageBase64',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      imageBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      imageBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> mealTypeEqualTo(
      MealType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> mealTypeGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> mealTypeLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> mealTypeBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameContains(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesContains(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionCaloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionCaloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionCaloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionCaloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portionSize',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portionSize',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionSizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionSizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionSizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portionSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionSizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portionSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionSizeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portionSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionSizeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portionSize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionSize',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portionSize',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionSummary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portionSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portionSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portionSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portionSummary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionSummaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portionSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'portions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'portions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'portions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'portions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'portions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      portionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'portions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinEqualTo(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> timestampLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> timestampBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> totalMacrosEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalMacros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      totalMacrosGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalMacros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> totalMacrosLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalMacros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> totalMacrosBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalMacros',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      totalPortionWeightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPortionWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      totalPortionWeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPortionWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      totalPortionWeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPortionWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      totalPortionWeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPortionWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> usePortionsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usePortions',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> userWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userWeight',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      userWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userWeight',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> userWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      userWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> userWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> userWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension FoodEntryQueryObject
    on QueryBuilder<FoodEntry, FoodEntry, QFilterCondition> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      detectedItemsElement(FilterQuery<DetectedFoodItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'detectedItems');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> portionsElement(
      FilterQuery<FoodPortion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'portions');
    });
  }
}

extension FoodEntryQueryLinks
    on QueryBuilder<FoodEntry, FoodEntry, QFilterCondition> {}

extension FoodEntryQuerySortBy on QueryBuilder<FoodEntry, FoodEntry, QSortBy> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByActualWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByActualWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByAiProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiProvider', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByAiProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiProvider', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCookingMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMethod', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCookingMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMethod', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCuisine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByCuisineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCalories', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy>
      sortByEffectiveCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCalories', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCarbs', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCarbs', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveProtein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy>
      sortByEffectiveProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveProtein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEffectiveWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEstimatedWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByEstimatedWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByImageBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByImageBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCalories', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCalories', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCarbs', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCarbs', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionFat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionFat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionProtein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionProtein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSize', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSize', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSummary', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPortionSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSummary', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByTotalMacros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByTotalMacrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByTotalPortionWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPortionWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy>
      sortByTotalPortionWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPortionWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByUsePortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByUsePortionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByUserWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByUserWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userWeight', Sort.desc);
    });
  }
}

extension FoodEntryQuerySortThenBy
    on QueryBuilder<FoodEntry, FoodEntry, QSortThenBy> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByActualWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByActualWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByAiProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiProvider', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByAiProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiProvider', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCookingMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMethod', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCookingMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookingMethod', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCuisine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByCuisineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCalories', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy>
      thenByEffectiveCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCalories', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCarbs', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveCarbs', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveFat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveProtein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy>
      thenByEffectiveProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveProtein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEffectiveWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEstimatedWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByEstimatedWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByImageBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByImageBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCalories', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCalories', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCarbs', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionCarbs', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionFat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionFat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionProtein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionProtein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSize', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSize', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSummary', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPortionSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portionSummary', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByTotalMacros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByTotalMacrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByTotalPortionWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPortionWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy>
      thenByTotalPortionWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPortionWeight', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByUsePortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByUsePortionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByUserWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userWeight', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByUserWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userWeight', Sort.desc);
    });
  }
}

extension FoodEntryQueryWhereDistinct
    on QueryBuilder<FoodEntry, FoodEntry, QDistinct> {
  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByActualWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualWeight');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByAiProvider(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiProvider', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbs');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByCookingMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cookingMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByCuisine() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuisine');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByDietaryTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dietaryTags');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByEffectiveCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveCalories');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByEffectiveCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveCarbs');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByEffectiveFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveFat');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByEffectiveProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveProtein');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByEffectiveWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveWeight');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByEstimatedWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedWeight');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fat');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByFoodGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodGroups');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByImageBase64(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageBase64', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealType');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPortionCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portionCalories');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPortionCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portionCarbs');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPortionFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portionFat');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPortionProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portionProtein');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPortionSize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portionSize', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPortionSummary(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portionSummary',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protein');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByTotalMacros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMacros');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByTotalPortionWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPortionWeight');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByUsePortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usePortions');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByUserWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userWeight');
    });
  }
}

extension FoodEntryQueryProperty
    on QueryBuilder<FoodEntry, FoodEntry, QQueryProperty> {
  QueryBuilder<FoodEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> actualWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualWeight');
    });
  }

  QueryBuilder<FoodEntry, String?, QQueryOperations> aiProviderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiProvider');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> carbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbs');
    });
  }

  QueryBuilder<FoodEntry, String?, QQueryOperations> cookingMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cookingMethod');
    });
  }

  QueryBuilder<FoodEntry, CuisineType, QQueryOperations> cuisineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuisine');
    });
  }

  QueryBuilder<FoodEntry, List<DetectedFoodItem>, QQueryOperations>
      detectedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detectedItems');
    });
  }

  QueryBuilder<FoodEntry, List<DietaryTag>, QQueryOperations>
      dietaryTagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dietaryTags');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations>
      effectiveCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveCalories');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> effectiveCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveCarbs');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> effectiveFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveFat');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> effectiveProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveProtein');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> effectiveWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveWeight');
    });
  }

  QueryBuilder<FoodEntry, double?, QQueryOperations> estimatedWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedWeight');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> fatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fat');
    });
  }

  QueryBuilder<FoodEntry, List<FoodGroup>, QQueryOperations>
      foodGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodGroups');
    });
  }

  QueryBuilder<FoodEntry, String, QQueryOperations> imageBase64Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageBase64');
    });
  }

  QueryBuilder<FoodEntry, MealType, QQueryOperations> mealTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealType');
    });
  }

  QueryBuilder<FoodEntry, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FoodEntry, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> portionCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portionCalories');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> portionCarbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portionCarbs');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> portionFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portionFat');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> portionProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portionProtein');
    });
  }

  QueryBuilder<FoodEntry, String?, QQueryOperations> portionSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portionSize');
    });
  }

  QueryBuilder<FoodEntry, String, QQueryOperations> portionSummaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portionSummary');
    });
  }

  QueryBuilder<FoodEntry, List<FoodPortion>, QQueryOperations>
      portionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portions');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> proteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protein');
    });
  }

  QueryBuilder<FoodEntry, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> totalMacrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMacros');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations>
      totalPortionWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPortionWeight');
    });
  }

  QueryBuilder<FoodEntry, bool, QQueryOperations> usePortionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usePortions');
    });
  }

  QueryBuilder<FoodEntry, double?, QQueryOperations> userWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userWeight');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DetectedFoodItemSchema = Schema(
  name: r'DetectedFoodItem',
  id: 1689963897730571920,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.double,
    ),
    r'carbs': PropertySchema(
      id: 1,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 2,
      name: r'fat',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'portion': PropertySchema(
      id: 4,
      name: r'portion',
      type: IsarType.string,
    ),
    r'protein': PropertySchema(
      id: 5,
      name: r'protein',
      type: IsarType.double,
    ),
    r'weight': PropertySchema(
      id: 6,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _detectedFoodItemEstimateSize,
  serialize: _detectedFoodItemSerialize,
  deserialize: _detectedFoodItemDeserialize,
  deserializeProp: _detectedFoodItemDeserializeProp,
);

int _detectedFoodItemEstimateSize(
  DetectedFoodItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.portion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _detectedFoodItemSerialize(
  DetectedFoodItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calories);
  writer.writeDouble(offsets[1], object.carbs);
  writer.writeDouble(offsets[2], object.fat);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.portion);
  writer.writeDouble(offsets[5], object.protein);
  writer.writeDouble(offsets[6], object.weight);
}

DetectedFoodItem _detectedFoodItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DetectedFoodItem();
  object.calories = reader.readDouble(offsets[0]);
  object.carbs = reader.readDouble(offsets[1]);
  object.fat = reader.readDouble(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.portion = reader.readStringOrNull(offsets[4]);
  object.protein = reader.readDouble(offsets[5]);
  object.weight = reader.readDoubleOrNull(offsets[6]);
  return object;
}

P _detectedFoodItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DetectedFoodItemQueryFilter
    on QueryBuilder<DetectedFoodItem, DetectedFoodItem, QFilterCondition> {
  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      caloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      caloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      caloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      caloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portion',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portion',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portion',
        value: '',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      portionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portion',
        value: '',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      weightEqualTo(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      weightLessThan(
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

  QueryBuilder<DetectedFoodItem, DetectedFoodItem, QAfterFilterCondition>
      weightBetween(
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

extension DetectedFoodItemQueryObject
    on QueryBuilder<DetectedFoodItem, DetectedFoodItem, QFilterCondition> {}
