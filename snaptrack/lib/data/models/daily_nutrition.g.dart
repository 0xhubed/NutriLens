// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_nutrition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyNutritionAdapter extends TypeAdapter<DailyNutrition> {
  @override
  final int typeId = 1;

  @override
  DailyNutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyNutrition(
      date: fields[1] as DateTime,
      totalCalories: fields[2] as double,
      totalProtein: fields[3] as double,
      totalCarbs: fields[4] as double,
      totalFat: fields[5] as double,
      mealCount: fields[6] as int,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, DailyNutrition obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.totalCalories)
      ..writeByte(3)
      ..write(obj.totalProtein)
      ..writeByte(4)
      ..write(obj.totalCarbs)
      ..writeByte(5)
      ..write(obj.totalFat)
      ..writeByte(6)
      ..write(obj.mealCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyNutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
