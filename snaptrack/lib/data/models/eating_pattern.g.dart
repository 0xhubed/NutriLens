// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_pattern.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EatingPatternAdapter extends TypeAdapter<EatingPattern> {
  @override
  final int typeId = 8;

  @override
  EatingPattern read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EatingPattern()
      ..id = fields[0] as String?
      ..date = fields[1] as DateTime
      ..averageEatingWindowMinutes = fields[2] as int
      ..averageFastingWindowMinutes = fields[3] as int
      ..typicalMealTimes = (fields[4] as List).cast<DateTime>()
      ..mealFrequency = fields[5] as double
      ..breakfastProtein = fields[6] as double
      ..breakfastCarbs = fields[7] as double
      ..breakfastFat = fields[8] as double
      ..lunchProtein = fields[9] as double
      ..lunchCarbs = fields[10] as double
      ..lunchFat = fields[11] as double
      ..dinnerProtein = fields[12] as double
      ..dinnerCarbs = fields[13] as double
      ..dinnerFat = fields[14] as double
      ..snackProtein = fields[15] as double
      ..snackCarbs = fields[16] as double
      ..snackFat = fields[17] as double
      ..consistencyScore = fields[18] as double
      ..metabolicOptimizationScore = fields[19] as double
      ..isIntermittentFasting = fields[20] as bool
      ..detectedPattern = fields[21] as String?;
  }

  @override
  void write(BinaryWriter writer, EatingPattern obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.averageEatingWindowMinutes)
      ..writeByte(3)
      ..write(obj.averageFastingWindowMinutes)
      ..writeByte(4)
      ..write(obj.typicalMealTimes)
      ..writeByte(5)
      ..write(obj.mealFrequency)
      ..writeByte(6)
      ..write(obj.breakfastProtein)
      ..writeByte(7)
      ..write(obj.breakfastCarbs)
      ..writeByte(8)
      ..write(obj.breakfastFat)
      ..writeByte(9)
      ..write(obj.lunchProtein)
      ..writeByte(10)
      ..write(obj.lunchCarbs)
      ..writeByte(11)
      ..write(obj.lunchFat)
      ..writeByte(12)
      ..write(obj.dinnerProtein)
      ..writeByte(13)
      ..write(obj.dinnerCarbs)
      ..writeByte(14)
      ..write(obj.dinnerFat)
      ..writeByte(15)
      ..write(obj.snackProtein)
      ..writeByte(16)
      ..write(obj.snackCarbs)
      ..writeByte(17)
      ..write(obj.snackFat)
      ..writeByte(18)
      ..write(obj.consistencyScore)
      ..writeByte(19)
      ..write(obj.metabolicOptimizationScore)
      ..writeByte(20)
      ..write(obj.isIntermittentFasting)
      ..writeByte(21)
      ..write(obj.detectedPattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EatingPatternAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
