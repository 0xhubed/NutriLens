// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metabolic_context.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGoalsAdapter extends TypeAdapter<UserGoals> {
  @override
  final int typeId = 40;

  @override
  UserGoals read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserGoals.weightLoss;
      case 1:
        return UserGoals.muscleGain;
      case 2:
        return UserGoals.maintenance;
      case 3:
        return UserGoals.performance;
      case 4:
        return UserGoals.health;
      default:
        return UserGoals.weightLoss;
    }
  }

  @override
  void write(BinaryWriter writer, UserGoals obj) {
    switch (obj) {
      case UserGoals.weightLoss:
        writer.writeByte(0);
        break;
      case UserGoals.muscleGain:
        writer.writeByte(1);
        break;
      case UserGoals.maintenance:
        writer.writeByte(2);
        break;
      case UserGoals.performance:
        writer.writeByte(3);
        break;
      case UserGoals.health:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGoalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityLevelAdapter extends TypeAdapter<ActivityLevel> {
  @override
  final int typeId = 41;

  @override
  ActivityLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityLevel.sedentary;
      case 1:
        return ActivityLevel.lightlyActive;
      case 2:
        return ActivityLevel.moderatelyActive;
      case 3:
        return ActivityLevel.veryActive;
      case 4:
        return ActivityLevel.extremelyActive;
      default:
        return ActivityLevel.sedentary;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityLevel obj) {
    switch (obj) {
      case ActivityLevel.sedentary:
        writer.writeByte(0);
        break;
      case ActivityLevel.lightlyActive:
        writer.writeByte(1);
        break;
      case ActivityLevel.moderatelyActive:
        writer.writeByte(2);
        break;
      case ActivityLevel.veryActive:
        writer.writeByte(3);
        break;
      case ActivityLevel.extremelyActive:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
