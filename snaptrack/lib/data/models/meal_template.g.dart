// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_template.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealTemplateCollection on Isar {
  IsarCollection<MealTemplate> get mealTemplates => this.collection();
}

const MealTemplateSchema = CollectionSchema(
  name: r'MealTemplate',
  id: 6500026431527828693,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.double,
    ),
    r'caloriesPerServing': PropertySchema(
      id: 1,
      name: r'caloriesPerServing',
      type: IsarType.double,
    ),
    r'carbs': PropertySchema(
      id: 2,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'carbsPerServing': PropertySchema(
      id: 3,
      name: r'carbsPerServing',
      type: IsarType.double,
    ),
    r'cookTimeMinutes': PropertySchema(
      id: 4,
      name: r'cookTimeMinutes',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'cuisine': PropertySchema(
      id: 6,
      name: r'cuisine',
      type: IsarType.byte,
      enumMap: _MealTemplatecuisineEnumValueMap,
    ),
    r'description': PropertySchema(
      id: 7,
      name: r'description',
      type: IsarType.string,
    ),
    r'dietaryTags': PropertySchema(
      id: 8,
      name: r'dietaryTags',
      type: IsarType.byteList,
      enumMap: _MealTemplatedietaryTagsEnumValueMap,
    ),
    r'fat': PropertySchema(
      id: 9,
      name: r'fat',
      type: IsarType.double,
    ),
    r'fatPerServing': PropertySchema(
      id: 10,
      name: r'fatPerServing',
      type: IsarType.double,
    ),
    r'foodGroups': PropertySchema(
      id: 11,
      name: r'foodGroups',
      type: IsarType.byteList,
      enumMap: _MealTemplatefoodGroupsEnumValueMap,
    ),
    r'imageBase64': PropertySchema(
      id: 12,
      name: r'imageBase64',
      type: IsarType.string,
    ),
    r'ingredients': PropertySchema(
      id: 13,
      name: r'ingredients',
      type: IsarType.objectList,
      target: r'TemplateIngredient',
    ),
    r'instructions': PropertySchema(
      id: 14,
      name: r'instructions',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 15,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 16,
      name: r'items',
      type: IsarType.objectList,
      target: r'TemplateItem',
    ),
    r'lastUsed': PropertySchema(
      id: 17,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'mealType': PropertySchema(
      id: 18,
      name: r'mealType',
      type: IsarType.byte,
      enumMap: _MealTemplatemealTypeEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 19,
      name: r'name',
      type: IsarType.string,
    ),
    r'prepTimeMinutes': PropertySchema(
      id: 20,
      name: r'prepTimeMinutes',
      type: IsarType.long,
    ),
    r'protein': PropertySchema(
      id: 21,
      name: r'protein',
      type: IsarType.double,
    ),
    r'proteinPerServing': PropertySchema(
      id: 22,
      name: r'proteinPerServing',
      type: IsarType.double,
    ),
    r'servings': PropertySchema(
      id: 23,
      name: r'servings',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 24,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'totalMacros': PropertySchema(
      id: 25,
      name: r'totalMacros',
      type: IsarType.double,
    ),
    r'totalTimeMinutes': PropertySchema(
      id: 26,
      name: r'totalTimeMinutes',
      type: IsarType.long,
    ),
    r'usageCount': PropertySchema(
      id: 27,
      name: r'usageCount',
      type: IsarType.long,
    ),
    r'usePortions': PropertySchema(
      id: 28,
      name: r'usePortions',
      type: IsarType.bool,
    )
  },
  estimateSize: _mealTemplateEstimateSize,
  serialize: _mealTemplateSerialize,
  deserialize: _mealTemplateDeserialize,
  deserializeProp: _mealTemplateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'TemplateItem': TemplateItemSchema,
    r'TemplateIngredient': TemplateIngredientSchema
  },
  getId: _mealTemplateGetId,
  getLinks: _mealTemplateGetLinks,
  attach: _mealTemplateAttach,
  version: '3.1.0+1',
);

int _mealTemplateEstimateSize(
  MealTemplate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.dietaryTags.length;
  bytesCount += 3 + object.foodGroups.length;
  {
    final value = object.imageBase64;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ingredients.length * 3;
  {
    final offsets = allOffsets[TemplateIngredient]!;
    for (var i = 0; i < object.ingredients.length; i++) {
      final value = object.ingredients[i];
      bytesCount +=
          TemplateIngredientSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.instructions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[TemplateItem]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount += TemplateItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _mealTemplateSerialize(
  MealTemplate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calories);
  writer.writeDouble(offsets[1], object.caloriesPerServing);
  writer.writeDouble(offsets[2], object.carbs);
  writer.writeDouble(offsets[3], object.carbsPerServing);
  writer.writeLong(offsets[4], object.cookTimeMinutes);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeByte(offsets[6], object.cuisine.index);
  writer.writeString(offsets[7], object.description);
  writer.writeByteList(
      offsets[8], object.dietaryTags.map((e) => e.index).toList());
  writer.writeDouble(offsets[9], object.fat);
  writer.writeDouble(offsets[10], object.fatPerServing);
  writer.writeByteList(
      offsets[11], object.foodGroups.map((e) => e.index).toList());
  writer.writeString(offsets[12], object.imageBase64);
  writer.writeObjectList<TemplateIngredient>(
    offsets[13],
    allOffsets,
    TemplateIngredientSchema.serialize,
    object.ingredients,
  );
  writer.writeString(offsets[14], object.instructions);
  writer.writeBool(offsets[15], object.isFavorite);
  writer.writeObjectList<TemplateItem>(
    offsets[16],
    allOffsets,
    TemplateItemSchema.serialize,
    object.items,
  );
  writer.writeDateTime(offsets[17], object.lastUsed);
  writer.writeByte(offsets[18], object.mealType.index);
  writer.writeString(offsets[19], object.name);
  writer.writeLong(offsets[20], object.prepTimeMinutes);
  writer.writeDouble(offsets[21], object.protein);
  writer.writeDouble(offsets[22], object.proteinPerServing);
  writer.writeLong(offsets[23], object.servings);
  writer.writeStringList(offsets[24], object.tags);
  writer.writeDouble(offsets[25], object.totalMacros);
  writer.writeLong(offsets[26], object.totalTimeMinutes);
  writer.writeLong(offsets[27], object.usageCount);
  writer.writeBool(offsets[28], object.usePortions);
}

MealTemplate _mealTemplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MealTemplate();
  object.calories = reader.readDouble(offsets[0]);
  object.carbs = reader.readDouble(offsets[2]);
  object.cookTimeMinutes = reader.readLongOrNull(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.cuisine =
      _MealTemplatecuisineValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          CuisineType.italian;
  object.description = reader.readString(offsets[7]);
  object.dietaryTags = reader
          .readByteList(offsets[8])
          ?.map((e) =>
              _MealTemplatedietaryTagsValueEnumMap[e] ?? DietaryTag.vegetarian)
          .toList() ??
      [];
  object.fat = reader.readDouble(offsets[9]);
  object.foodGroups = reader
          .readByteList(offsets[11])
          ?.map((e) =>
              _MealTemplatefoodGroupsValueEnumMap[e] ?? FoodGroup.proteins)
          .toList() ??
      [];
  object.id = id;
  object.imageBase64 = reader.readStringOrNull(offsets[12]);
  object.ingredients = reader.readObjectList<TemplateIngredient>(
        offsets[13],
        TemplateIngredientSchema.deserialize,
        allOffsets,
        TemplateIngredient(),
      ) ??
      [];
  object.instructions = reader.readStringOrNull(offsets[14]);
  object.isFavorite = reader.readBool(offsets[15]);
  object.items = reader.readObjectList<TemplateItem>(
        offsets[16],
        TemplateItemSchema.deserialize,
        allOffsets,
        TemplateItem(),
      ) ??
      [];
  object.lastUsed = reader.readDateTimeOrNull(offsets[17]);
  object.mealType =
      _MealTemplatemealTypeValueEnumMap[reader.readByteOrNull(offsets[18])] ??
          MealType.breakfast;
  object.name = reader.readString(offsets[19]);
  object.prepTimeMinutes = reader.readLongOrNull(offsets[20]);
  object.protein = reader.readDouble(offsets[21]);
  object.servings = reader.readLong(offsets[23]);
  object.tags = reader.readStringList(offsets[24]) ?? [];
  object.usageCount = reader.readLong(offsets[27]);
  object.usePortions = reader.readBool(offsets[28]);
  return object;
}

P _mealTemplateDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (_MealTemplatecuisineValueEnumMap[reader.readByteOrNull(offset)] ??
          CuisineType.italian) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _MealTemplatedietaryTagsValueEnumMap[e] ??
                  DietaryTag.vegetarian)
              .toList() ??
          []) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _MealTemplatefoodGroupsValueEnumMap[e] ?? FoodGroup.proteins)
              .toList() ??
          []) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readObjectList<TemplateIngredient>(
            offset,
            TemplateIngredientSchema.deserialize,
            allOffsets,
            TemplateIngredient(),
          ) ??
          []) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readObjectList<TemplateItem>(
            offset,
            TemplateItemSchema.deserialize,
            allOffsets,
            TemplateItem(),
          ) ??
          []) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (_MealTemplatemealTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MealType.breakfast) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readStringList(offset) ?? []) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readLong(offset)) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MealTemplatecuisineEnumValueMap = {
  'italian': 0,
  'asian': 1,
  'american': 2,
  'mexican': 3,
  'indian': 4,
  'mediterranean': 5,
  'other': 6,
};
const _MealTemplatecuisineValueEnumMap = {
  0: CuisineType.italian,
  1: CuisineType.asian,
  2: CuisineType.american,
  3: CuisineType.mexican,
  4: CuisineType.indian,
  5: CuisineType.mediterranean,
  6: CuisineType.other,
};
const _MealTemplatedietaryTagsEnumValueMap = {
  'vegetarian': 0,
  'vegan': 1,
  'glutenFree': 2,
  'ketoFriendly': 3,
  'lowCarb': 4,
  'highProtein': 5,
  'none': 6,
};
const _MealTemplatedietaryTagsValueEnumMap = {
  0: DietaryTag.vegetarian,
  1: DietaryTag.vegan,
  2: DietaryTag.glutenFree,
  3: DietaryTag.ketoFriendly,
  4: DietaryTag.lowCarb,
  5: DietaryTag.highProtein,
  6: DietaryTag.none,
};
const _MealTemplatefoodGroupsEnumValueMap = {
  'proteins': 0,
  'grains': 1,
  'vegetables': 2,
  'fruits': 3,
  'dairy': 4,
  'fats': 5,
  'other': 6,
};
const _MealTemplatefoodGroupsValueEnumMap = {
  0: FoodGroup.proteins,
  1: FoodGroup.grains,
  2: FoodGroup.vegetables,
  3: FoodGroup.fruits,
  4: FoodGroup.dairy,
  5: FoodGroup.fats,
  6: FoodGroup.other,
};
const _MealTemplatemealTypeEnumValueMap = {
  'breakfast': 0,
  'lunch': 1,
  'dinner': 2,
  'snack': 3,
};
const _MealTemplatemealTypeValueEnumMap = {
  0: MealType.breakfast,
  1: MealType.lunch,
  2: MealType.dinner,
  3: MealType.snack,
};

Id _mealTemplateGetId(MealTemplate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealTemplateGetLinks(MealTemplate object) {
  return [];
}

void _mealTemplateAttach(
    IsarCollection<dynamic> col, Id id, MealTemplate object) {
  object.id = id;
}

extension MealTemplateQueryWhereSort
    on QueryBuilder<MealTemplate, MealTemplate, QWhere> {
  QueryBuilder<MealTemplate, MealTemplate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealTemplateQueryWhere
    on QueryBuilder<MealTemplate, MealTemplate, QWhereClause> {
  QueryBuilder<MealTemplate, MealTemplate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterWhereClause> idBetween(
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

extension MealTemplateQueryFilter
    on QueryBuilder<MealTemplate, MealTemplate, QFilterCondition> {
  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      caloriesPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caloriesPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      caloriesPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caloriesPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      caloriesPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caloriesPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      caloriesPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caloriesPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> carbsEqualTo(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> carbsLessThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> carbsBetween(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      carbsPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      carbsPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      carbsPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbsPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      carbsPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbsPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cookTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cookTimeMinutes',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cookTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cookTimeMinutes',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cookTimeMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cookTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cookTimeMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cookTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cookTimeMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cookTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cookTimeMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cookTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cuisineEqualTo(CuisineType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cuisine',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cuisineGreaterThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cuisineLessThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      cuisineBetween(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      dietaryTagsElementEqualTo(DietaryTag value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dietaryTags',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> fatEqualTo(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> fatLessThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> fatBetween(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      fatPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      fatPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      fatPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      fatPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      foodGroupsElementEqualTo(FoodGroup value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageBase64',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageBase64',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64EqualTo(
    String? value, {
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64GreaterThan(
    String? value, {
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64LessThan(
    String? value, {
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64Between(
    String? lower,
    String? upper, {
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64EndsWith(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageBase64',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      imageBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instructions',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instructions',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instructions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instructions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructions',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      instructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instructions',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      lastUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      lastUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUsed',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      lastUsedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      lastUsedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      lastUsedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      lastUsedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      mealTypeEqualTo(MealType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealType',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      prepTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prepTimeMinutes',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      prepTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prepTimeMinutes',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      prepTimeMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prepTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      prepTimeMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prepTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      prepTimeMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prepTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      prepTimeMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prepTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      proteinPerServingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proteinPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      proteinPerServingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proteinPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      proteinPerServingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proteinPerServing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      proteinPerServingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proteinPerServing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      servingsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      servingsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      servingsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'servings',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      servingsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'servings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalMacrosEqualTo(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalMacrosLessThan(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalMacrosBetween(
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

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalTimeMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalTimeMinutes',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalTimeMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalTimeMinutes',
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalTimeMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalTimeMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalTimeMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      totalTimeMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      usageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      usageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      usageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      usageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      usePortionsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usePortions',
        value: value,
      ));
    });
  }
}

extension MealTemplateQueryObject
    on QueryBuilder<MealTemplate, MealTemplate, QFilterCondition> {
  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition>
      ingredientsElement(FilterQuery<TemplateIngredient> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ingredients');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterFilterCondition> itemsElement(
      FilterQuery<TemplateItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension MealTemplateQueryLinks
    on QueryBuilder<MealTemplate, MealTemplate, QFilterCondition> {}

extension MealTemplateQuerySortBy
    on QueryBuilder<MealTemplate, MealTemplate, QSortBy> {
  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByCaloriesPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByCaloriesPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByCarbsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByCarbsPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByCookTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByCookTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCuisine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByCuisineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByFatPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByFatPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByImageBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByImageBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByPrepTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prepTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByPrepTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prepTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByProteinPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByProteinPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByServingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByTotalMacros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByTotalMacrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByTotalTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByTotalTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> sortByUsePortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      sortByUsePortionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.desc);
    });
  }
}

extension MealTemplateQuerySortThenBy
    on QueryBuilder<MealTemplate, MealTemplate, QSortThenBy> {
  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByCaloriesPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByCaloriesPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCarbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbs', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByCarbsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByCarbsPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbsPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByCookTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByCookTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cookTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCuisine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByCuisineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cuisine', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByFatPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByFatPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByImageBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByImageBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageBase64', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByMealTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealType', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByPrepTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prepTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByPrepTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prepTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByProteinPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByProteinPerServingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proteinPerServing', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByServingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'servings', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByTotalMacros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByTotalMacrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMacros', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByTotalTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByTotalTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy> thenByUsePortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.asc);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QAfterSortBy>
      thenByUsePortionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usePortions', Sort.desc);
    });
  }
}

extension MealTemplateQueryWhereDistinct
    on QueryBuilder<MealTemplate, MealTemplate, QDistinct> {
  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByCaloriesPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caloriesPerServing');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByCarbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbs');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByCarbsPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbsPerServing');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByCookTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cookTimeMinutes');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByCuisine() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cuisine');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByDietaryTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dietaryTags');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fat');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByFatPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fatPerServing');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByFoodGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodGroups');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByImageBase64(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageBase64', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByInstructions(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instructions', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByMealType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealType');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByPrepTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prepTimeMinutes');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protein');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByProteinPerServing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proteinPerServing');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByServings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'servings');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByTotalMacros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMacros');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct>
      distinctByTotalTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTimeMinutes');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageCount');
    });
  }

  QueryBuilder<MealTemplate, MealTemplate, QDistinct> distinctByUsePortions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usePortions');
    });
  }
}

extension MealTemplateQueryProperty
    on QueryBuilder<MealTemplate, MealTemplate, QQueryProperty> {
  QueryBuilder<MealTemplate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations>
      caloriesPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caloriesPerServing');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations> carbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbs');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations>
      carbsPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbsPerServing');
    });
  }

  QueryBuilder<MealTemplate, int?, QQueryOperations> cookTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cookTimeMinutes');
    });
  }

  QueryBuilder<MealTemplate, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MealTemplate, CuisineType, QQueryOperations> cuisineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cuisine');
    });
  }

  QueryBuilder<MealTemplate, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MealTemplate, List<DietaryTag>, QQueryOperations>
      dietaryTagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dietaryTags');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations> fatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fat');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations> fatPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatPerServing');
    });
  }

  QueryBuilder<MealTemplate, List<FoodGroup>, QQueryOperations>
      foodGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodGroups');
    });
  }

  QueryBuilder<MealTemplate, String?, QQueryOperations> imageBase64Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageBase64');
    });
  }

  QueryBuilder<MealTemplate, List<TemplateIngredient>, QQueryOperations>
      ingredientsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredients');
    });
  }

  QueryBuilder<MealTemplate, String?, QQueryOperations> instructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructions');
    });
  }

  QueryBuilder<MealTemplate, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<MealTemplate, List<TemplateItem>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<MealTemplate, DateTime?, QQueryOperations> lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<MealTemplate, MealType, QQueryOperations> mealTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealType');
    });
  }

  QueryBuilder<MealTemplate, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MealTemplate, int?, QQueryOperations> prepTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prepTimeMinutes');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations> proteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protein');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations>
      proteinPerServingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proteinPerServing');
    });
  }

  QueryBuilder<MealTemplate, int, QQueryOperations> servingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'servings');
    });
  }

  QueryBuilder<MealTemplate, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<MealTemplate, double, QQueryOperations> totalMacrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMacros');
    });
  }

  QueryBuilder<MealTemplate, int?, QQueryOperations>
      totalTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTimeMinutes');
    });
  }

  QueryBuilder<MealTemplate, int, QQueryOperations> usageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageCount');
    });
  }

  QueryBuilder<MealTemplate, bool, QQueryOperations> usePortionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usePortions');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TemplateItemSchema = Schema(
  name: r'TemplateItem',
  id: 3492042616796161138,
  properties: {
    r'adjustedCalories': PropertySchema(
      id: 0,
      name: r'adjustedCalories',
      type: IsarType.double,
    ),
    r'adjustedCarbs': PropertySchema(
      id: 1,
      name: r'adjustedCarbs',
      type: IsarType.double,
    ),
    r'adjustedFat': PropertySchema(
      id: 2,
      name: r'adjustedFat',
      type: IsarType.double,
    ),
    r'adjustedProtein': PropertySchema(
      id: 3,
      name: r'adjustedProtein',
      type: IsarType.double,
    ),
    r'calories': PropertySchema(
      id: 4,
      name: r'calories',
      type: IsarType.double,
    ),
    r'carbs': PropertySchema(
      id: 5,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 6,
      name: r'fat',
      type: IsarType.double,
    ),
    r'isAdjustable': PropertySchema(
      id: 7,
      name: r'isAdjustable',
      type: IsarType.bool,
    ),
    r'multiplier': PropertySchema(
      id: 8,
      name: r'multiplier',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'portion': PropertySchema(
      id: 10,
      name: r'portion',
      type: IsarType.string,
    ),
    r'protein': PropertySchema(
      id: 11,
      name: r'protein',
      type: IsarType.double,
    )
  },
  estimateSize: _templateItemEstimateSize,
  serialize: _templateItemSerialize,
  deserialize: _templateItemDeserialize,
  deserializeProp: _templateItemDeserializeProp,
);

int _templateItemEstimateSize(
  TemplateItem object,
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

void _templateItemSerialize(
  TemplateItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.adjustedCalories);
  writer.writeDouble(offsets[1], object.adjustedCarbs);
  writer.writeDouble(offsets[2], object.adjustedFat);
  writer.writeDouble(offsets[3], object.adjustedProtein);
  writer.writeDouble(offsets[4], object.calories);
  writer.writeDouble(offsets[5], object.carbs);
  writer.writeDouble(offsets[6], object.fat);
  writer.writeBool(offsets[7], object.isAdjustable);
  writer.writeDouble(offsets[8], object.multiplier);
  writer.writeString(offsets[9], object.name);
  writer.writeString(offsets[10], object.portion);
  writer.writeDouble(offsets[11], object.protein);
}

TemplateItem _templateItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TemplateItem();
  object.calories = reader.readDouble(offsets[4]);
  object.carbs = reader.readDouble(offsets[5]);
  object.fat = reader.readDouble(offsets[6]);
  object.isAdjustable = reader.readBool(offsets[7]);
  object.multiplier = reader.readDouble(offsets[8]);
  object.name = reader.readString(offsets[9]);
  object.portion = reader.readStringOrNull(offsets[10]);
  object.protein = reader.readDouble(offsets[11]);
  return object;
}

P _templateItemDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TemplateItemQueryFilter
    on QueryBuilder<TemplateItem, TemplateItem, QFilterCondition> {
  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCaloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustedCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCaloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustedCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCaloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustedCalories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCaloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustedCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCarbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustedCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCarbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustedCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCarbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustedCarbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedCarbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustedCarbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedFatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedFatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedFatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustedFat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedFatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustedFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustedProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustedProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustedProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      adjustedProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustedProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> carbsEqualTo(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> carbsLessThan(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> carbsBetween(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> fatEqualTo(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> fatLessThan(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> fatBetween(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      isAdjustableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAdjustable',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      multiplierEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'multiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      multiplierGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'multiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      multiplierLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'multiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      multiplierBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'multiplier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameContains(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      portionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portion',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      portionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portion',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      portionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      portionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      portionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portion',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
      portionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portion',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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

  QueryBuilder<TemplateItem, TemplateItem, QAfterFilterCondition>
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
}

extension TemplateItemQueryObject
    on QueryBuilder<TemplateItem, TemplateItem, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TemplateIngredientSchema = Schema(
  name: r'TemplateIngredient',
  id: -7660715711998538135,
  properties: {
    r'displayText': PropertySchema(
      id: 0,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'estimatedGrams': PropertySchema(
      id: 1,
      name: r'estimatedGrams',
      type: IsarType.double,
    ),
    r'formattedQuantity': PropertySchema(
      id: 2,
      name: r'formattedQuantity',
      type: IsarType.string,
    ),
    r'isOptional': PropertySchema(
      id: 3,
      name: r'isOptional',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 6,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'substitutions': PropertySchema(
      id: 7,
      name: r'substitutions',
      type: IsarType.string,
    ),
    r'unitDisplayName': PropertySchema(
      id: 8,
      name: r'unitDisplayName',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 9,
      name: r'unitId',
      type: IsarType.string,
    )
  },
  estimateSize: _templateIngredientEstimateSize,
  serialize: _templateIngredientSerialize,
  deserialize: _templateIngredientDeserialize,
  deserializeProp: _templateIngredientDeserializeProp,
);

int _templateIngredientEstimateSize(
  TemplateIngredient object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayText.length * 3;
  bytesCount += 3 + object.formattedQuantity.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.substitutions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unitDisplayName.length * 3;
  bytesCount += 3 + object.unitId.length * 3;
  return bytesCount;
}

void _templateIngredientSerialize(
  TemplateIngredient object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.displayText);
  writer.writeDouble(offsets[1], object.estimatedGrams);
  writer.writeString(offsets[2], object.formattedQuantity);
  writer.writeBool(offsets[3], object.isOptional);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.notes);
  writer.writeDouble(offsets[6], object.quantity);
  writer.writeString(offsets[7], object.substitutions);
  writer.writeString(offsets[8], object.unitDisplayName);
  writer.writeString(offsets[9], object.unitId);
}

TemplateIngredient _templateIngredientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TemplateIngredient();
  object.estimatedGrams = reader.readDouble(offsets[1]);
  object.isOptional = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.notes = reader.readStringOrNull(offsets[5]);
  object.quantity = reader.readDouble(offsets[6]);
  object.substitutions = reader.readStringOrNull(offsets[7]);
  object.unitDisplayName = reader.readString(offsets[8]);
  object.unitId = reader.readString(offsets[9]);
  return object;
}

P _templateIngredientDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TemplateIngredientQueryFilter
    on QueryBuilder<TemplateIngredient, TemplateIngredient, QFilterCondition> {
  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      estimatedGramsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      estimatedGramsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      estimatedGramsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      estimatedGramsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedQuantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuantity',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      formattedQuantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedQuantity',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      isOptionalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOptional',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesEqualTo(
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesLessThan(
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesBetween(
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesStartsWith(
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesEndsWith(
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'substitutions',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'substitutions',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'substitutions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'substitutions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'substitutions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'substitutions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'substitutions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'substitutions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'substitutions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'substitutions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'substitutions',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      substitutionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'substitutions',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitDisplayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitDisplayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitDisplayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitDisplayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDisplayName',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitDisplayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitDisplayName',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
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

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateIngredient, TemplateIngredient, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }
}

extension TemplateIngredientQueryObject
    on QueryBuilder<TemplateIngredient, TemplateIngredient, QFilterCondition> {}
