// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_template.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealTemplateAdapter extends TypeAdapter<MealTemplate> {
  @override
  final int typeId = 2;

  @override
  MealTemplate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealTemplate()
      ..id = fields[0] as String?
      ..name = fields[1] as String
      ..description = fields[2] as String
      ..calories = fields[3] as double
      ..protein = fields[4] as double
      ..carbs = fields[5] as double
      ..fat = fields[6] as double
      ..createdAt = fields[7] as DateTime
      ..mealType = fields[8] as MealType
      ..foodGroups = (fields[9] as List).cast<FoodGroup>()
      ..cuisine = fields[10] as CuisineType
      ..dietaryTags = (fields[11] as List).cast<DietaryTag>()
      ..usageCount = fields[12] as int
      ..lastUsed = fields[13] as DateTime?
      ..isFavorite = fields[14] as bool
      ..tags = (fields[15] as List).cast<String>()
      ..items = (fields[16] as List).cast<TemplateItem>()
      ..usePortions = fields[17] as bool
      ..ingredients = (fields[18] as List).cast<TemplateIngredient>()
      ..servings = fields[19] as int
      ..instructions = fields[20] as String?
      ..prepTimeMinutes = fields[21] as int?
      ..cookTimeMinutes = fields[22] as int?
      ..imageBase64 = fields[23] as String?;
  }

  @override
  void write(BinaryWriter writer, MealTemplate obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.protein)
      ..writeByte(5)
      ..write(obj.carbs)
      ..writeByte(6)
      ..write(obj.fat)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.mealType)
      ..writeByte(9)
      ..write(obj.foodGroups)
      ..writeByte(10)
      ..write(obj.cuisine)
      ..writeByte(11)
      ..write(obj.dietaryTags)
      ..writeByte(12)
      ..write(obj.usageCount)
      ..writeByte(13)
      ..write(obj.lastUsed)
      ..writeByte(14)
      ..write(obj.isFavorite)
      ..writeByte(15)
      ..write(obj.tags)
      ..writeByte(16)
      ..write(obj.items)
      ..writeByte(17)
      ..write(obj.usePortions)
      ..writeByte(18)
      ..write(obj.ingredients)
      ..writeByte(19)
      ..write(obj.servings)
      ..writeByte(20)
      ..write(obj.instructions)
      ..writeByte(21)
      ..write(obj.prepTimeMinutes)
      ..writeByte(22)
      ..write(obj.cookTimeMinutes)
      ..writeByte(23)
      ..write(obj.imageBase64);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTemplateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TemplateItemAdapter extends TypeAdapter<TemplateItem> {
  @override
  final int typeId = 26;

  @override
  TemplateItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateItem()
      ..name = fields[0] as String
      ..calories = fields[1] as double
      ..protein = fields[2] as double
      ..carbs = fields[3] as double
      ..fat = fields[4] as double
      ..portion = fields[5] as String?
      ..multiplier = fields[6] as double
      ..isAdjustable = fields[7] as bool;
  }

  @override
  void write(BinaryWriter writer, TemplateItem obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.protein)
      ..writeByte(3)
      ..write(obj.carbs)
      ..writeByte(4)
      ..write(obj.fat)
      ..writeByte(5)
      ..write(obj.portion)
      ..writeByte(6)
      ..write(obj.multiplier)
      ..writeByte(7)
      ..write(obj.isAdjustable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TemplateIngredientAdapter extends TypeAdapter<TemplateIngredient> {
  @override
  final int typeId = 27;

  @override
  TemplateIngredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateIngredient()
      ..name = fields[0] as String
      ..quantity = fields[1] as double
      ..unitId = fields[2] as String
      ..unitDisplayName = fields[3] as String
      ..estimatedGrams = fields[4] as double
      ..notes = fields[5] as String?
      ..isOptional = fields[6] as bool
      ..substitutions = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, TemplateIngredient obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unitId)
      ..writeByte(3)
      ..write(obj.unitDisplayName)
      ..writeByte(4)
      ..write(obj.estimatedGrams)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.isOptional)
      ..writeByte(7)
      ..write(obj.substitutions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateIngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
