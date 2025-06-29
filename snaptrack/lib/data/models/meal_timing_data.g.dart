// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_timing_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealTimingDataAdapter extends TypeAdapter<MealTimingData> {
  @override
  final int typeId = 9;

  @override
  MealTimingData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealTimingData()
      ..id = fields[0] as String?
      ..timestamp = fields[1] as DateTime
      ..timeSinceLastMealMinutes = fields[2] as int
      ..fastingWindowMinutes = fields[3] as int
      ..mealType = fields[4] as MealType
      ..totalCalories = fields[5] as double
      ..protein = fields[6] as double
      ..carbs = fields[7] as double
      ..fat = fields[8] as double
      ..fiber = fields[9] as double
      ..foodTypes = (fields[10] as List).cast<String>()
      ..foodEntryId = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, MealTimingData obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.timeSinceLastMealMinutes)
      ..writeByte(3)
      ..write(obj.fastingWindowMinutes)
      ..writeByte(4)
      ..write(obj.mealType)
      ..writeByte(5)
      ..write(obj.totalCalories)
      ..writeByte(6)
      ..write(obj.protein)
      ..writeByte(7)
      ..write(obj.carbs)
      ..writeByte(8)
      ..write(obj.fat)
      ..writeByte(9)
      ..write(obj.fiber)
      ..writeByte(10)
      ..write(obj.foodTypes)
      ..writeByte(11)
      ..write(obj.foodEntryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTimingDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
