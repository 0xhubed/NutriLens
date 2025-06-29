// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_metrics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserMetricsAdapter extends TypeAdapter<UserMetrics> {
  @override
  final int typeId = 4;

  @override
  UserMetrics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMetrics()
      ..id = fields[0] as String?
      ..date = fields[1] as DateTime
      ..weight = fields[2] as double?
      ..height = fields[3] as double?
      ..bodyFatPercentage = fields[4] as double?
      ..age = fields[5] as int?
      ..gender = fields[6] as String?
      ..waterLiters = fields[7] as double?
      ..sleepHours = fields[8] as double?
      ..stepCount = fields[9] as int?
      ..bodyMeasurementsData = fields[10] as String?
      ..bmi = fields[11] as double?
      ..bmr = fields[12] as double?
      ..dailyCalorieGoal = fields[13] as double?
      ..dailyWaterGoal = fields[14] as double?
      ..dailyStepGoal = fields[15] as double?
      ..notes = fields[16] as String?;
  }

  @override
  void write(BinaryWriter writer, UserMetrics obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.bodyFatPercentage)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.waterLiters)
      ..writeByte(8)
      ..write(obj.sleepHours)
      ..writeByte(9)
      ..write(obj.stepCount)
      ..writeByte(10)
      ..write(obj.bodyMeasurementsData)
      ..writeByte(11)
      ..write(obj.bmi)
      ..writeByte(12)
      ..write(obj.bmr)
      ..writeByte(13)
      ..write(obj.dailyCalorieGoal)
      ..writeByte(14)
      ..write(obj.dailyWaterGoal)
      ..writeByte(15)
      ..write(obj.dailyStepGoal)
      ..writeByte(16)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMetricsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HealthGoalAdapter extends TypeAdapter<HealthGoal> {
  @override
  final int typeId = 25;

  @override
  HealthGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HealthGoal()
      ..name = fields[0] as String
      ..targetValue = fields[1] as double
      ..unit = fields[2] as String
      ..targetDate = fields[3] as DateTime
      ..description = fields[4] as String
      ..type = fields[5] as GoalType
      ..isActive = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, HealthGoal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.targetValue)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.targetDate)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GoalTypeAdapter extends TypeAdapter<GoalType> {
  @override
  final int typeId = 35;

  @override
  GoalType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GoalType.weightLoss;
      case 1:
        return GoalType.weightGain;
      case 2:
        return GoalType.maintenance;
      case 3:
        return GoalType.performance;
      case 4:
        return GoalType.custom;
      default:
        return GoalType.weightLoss;
    }
  }

  @override
  void write(BinaryWriter writer, GoalType obj) {
    switch (obj) {
      case GoalType.weightLoss:
        writer.writeByte(0);
        break;
      case GoalType.weightGain:
        writer.writeByte(1);
        break;
      case GoalType.maintenance:
        writer.writeByte(2);
        break;
      case GoalType.performance:
        writer.writeByte(3);
        break;
      case GoalType.custom:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
