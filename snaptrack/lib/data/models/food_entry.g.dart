// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodEntryAdapter extends TypeAdapter<FoodEntry> {
  @override
  final int typeId = 0;

  @override
  FoodEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodEntry()
      ..id = fields[0] as String?
      ..name = fields[1] as String
      ..imageBase64 = fields[2] as String
      ..calories = fields[3] as double
      ..protein = fields[4] as double
      ..carbs = fields[5] as double
      ..fat = fields[6] as double
      ..timestamp = fields[7] as DateTime
      ..estimatedWeight = fields[8] as double?
      ..userWeight = fields[9] as double?
      ..notes = fields[10] as String?
      ..mealType = fields[11] as MealType
      ..foodGroups = (fields[12] as List).cast<FoodGroup>()
      ..cuisine = fields[13] as CuisineType
      ..dietaryTags = (fields[14] as List).cast<DietaryTag>()
      ..portionSize = fields[15] as String?
      ..cookingMethod = fields[16] as String?
      ..detectedItems = (fields[17] as List).cast<DetectedFoodItem>()
      ..aiProvider = fields[18] as String?
      ..usePortions = fields[19] as bool
      ..portions = (fields[20] as List).cast<FoodPortion>();
  }

  @override
  void write(BinaryWriter writer, FoodEntry obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageBase64)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.protein)
      ..writeByte(5)
      ..write(obj.carbs)
      ..writeByte(6)
      ..write(obj.fat)
      ..writeByte(7)
      ..write(obj.timestamp)
      ..writeByte(8)
      ..write(obj.estimatedWeight)
      ..writeByte(9)
      ..write(obj.userWeight)
      ..writeByte(10)
      ..write(obj.notes)
      ..writeByte(11)
      ..write(obj.mealType)
      ..writeByte(12)
      ..write(obj.foodGroups)
      ..writeByte(13)
      ..write(obj.cuisine)
      ..writeByte(14)
      ..write(obj.dietaryTags)
      ..writeByte(15)
      ..write(obj.portionSize)
      ..writeByte(16)
      ..write(obj.cookingMethod)
      ..writeByte(17)
      ..write(obj.detectedItems)
      ..writeByte(18)
      ..write(obj.aiProvider)
      ..writeByte(19)
      ..write(obj.usePortions)
      ..writeByte(20)
      ..write(obj.portions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetectedFoodItemAdapter extends TypeAdapter<DetectedFoodItem> {
  @override
  final int typeId = 21;

  @override
  DetectedFoodItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetectedFoodItem()
      ..name = fields[0] as String
      ..calories = fields[1] as double
      ..protein = fields[2] as double
      ..carbs = fields[3] as double
      ..fat = fields[4] as double
      ..portion = fields[5] as String?
      ..weight = fields[6] as double?;
  }

  @override
  void write(BinaryWriter writer, DetectedFoodItem obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetectedFoodItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MealTypeAdapter extends TypeAdapter<MealType> {
  @override
  final int typeId = 30;

  @override
  MealType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MealType.breakfast;
      case 1:
        return MealType.lunch;
      case 2:
        return MealType.dinner;
      case 3:
        return MealType.snack;
      default:
        return MealType.breakfast;
    }
  }

  @override
  void write(BinaryWriter writer, MealType obj) {
    switch (obj) {
      case MealType.breakfast:
        writer.writeByte(0);
        break;
      case MealType.lunch:
        writer.writeByte(1);
        break;
      case MealType.dinner:
        writer.writeByte(2);
        break;
      case MealType.snack:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FoodGroupAdapter extends TypeAdapter<FoodGroup> {
  @override
  final int typeId = 31;

  @override
  FoodGroup read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FoodGroup.proteins;
      case 1:
        return FoodGroup.grains;
      case 2:
        return FoodGroup.vegetables;
      case 3:
        return FoodGroup.fruits;
      case 4:
        return FoodGroup.dairy;
      case 5:
        return FoodGroup.fats;
      case 6:
        return FoodGroup.other;
      default:
        return FoodGroup.proteins;
    }
  }

  @override
  void write(BinaryWriter writer, FoodGroup obj) {
    switch (obj) {
      case FoodGroup.proteins:
        writer.writeByte(0);
        break;
      case FoodGroup.grains:
        writer.writeByte(1);
        break;
      case FoodGroup.vegetables:
        writer.writeByte(2);
        break;
      case FoodGroup.fruits:
        writer.writeByte(3);
        break;
      case FoodGroup.dairy:
        writer.writeByte(4);
        break;
      case FoodGroup.fats:
        writer.writeByte(5);
        break;
      case FoodGroup.other:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CuisineTypeAdapter extends TypeAdapter<CuisineType> {
  @override
  final int typeId = 32;

  @override
  CuisineType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CuisineType.italian;
      case 1:
        return CuisineType.asian;
      case 2:
        return CuisineType.american;
      case 3:
        return CuisineType.mexican;
      case 4:
        return CuisineType.indian;
      case 5:
        return CuisineType.mediterranean;
      case 6:
        return CuisineType.other;
      default:
        return CuisineType.italian;
    }
  }

  @override
  void write(BinaryWriter writer, CuisineType obj) {
    switch (obj) {
      case CuisineType.italian:
        writer.writeByte(0);
        break;
      case CuisineType.asian:
        writer.writeByte(1);
        break;
      case CuisineType.american:
        writer.writeByte(2);
        break;
      case CuisineType.mexican:
        writer.writeByte(3);
        break;
      case CuisineType.indian:
        writer.writeByte(4);
        break;
      case CuisineType.mediterranean:
        writer.writeByte(5);
        break;
      case CuisineType.other:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CuisineTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DietaryTagAdapter extends TypeAdapter<DietaryTag> {
  @override
  final int typeId = 33;

  @override
  DietaryTag read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DietaryTag.vegetarian;
      case 1:
        return DietaryTag.vegan;
      case 2:
        return DietaryTag.glutenFree;
      case 3:
        return DietaryTag.ketoFriendly;
      case 4:
        return DietaryTag.lowCarb;
      case 5:
        return DietaryTag.highProtein;
      case 6:
        return DietaryTag.none;
      default:
        return DietaryTag.vegetarian;
    }
  }

  @override
  void write(BinaryWriter writer, DietaryTag obj) {
    switch (obj) {
      case DietaryTag.vegetarian:
        writer.writeByte(0);
        break;
      case DietaryTag.vegan:
        writer.writeByte(1);
        break;
      case DietaryTag.glutenFree:
        writer.writeByte(2);
        break;
      case DietaryTag.ketoFriendly:
        writer.writeByte(3);
        break;
      case DietaryTag.lowCarb:
        writer.writeByte(4);
        break;
      case DietaryTag.highProtein:
        writer.writeByte(5);
        break;
      case DietaryTag.none:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietaryTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
