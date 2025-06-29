// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metabolic_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetabolicStateAdapter extends TypeAdapter<MetabolicState> {
  @override
  final int typeId = 6;

  @override
  MetabolicState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetabolicState()
      ..id = fields[0] as String?
      ..timestamp = fields[1] as DateTime
      ..phase = fields[2] as MetabolicPhase
      ..estimatedInsulinLevel = fields[3] as InsulinLevel
      ..timeInCurrentStateMinutes = fields[4] as int
      ..activeProcesses = (fields[5] as List).cast<String>()
      ..fatBurningPotential = fields[6] as double
      ..muscleBuildinPotential = fields[7] as double
      ..digestiveLoad = fields[8] as double
      ..timeSinceLastMealMinutes = fields[9] as int
      ..lastMealCalories = fields[10] as double
      ..lastMealCarbs = fields[11] as double;
  }

  @override
  void write(BinaryWriter writer, MetabolicState obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.phase)
      ..writeByte(3)
      ..write(obj.estimatedInsulinLevel)
      ..writeByte(4)
      ..write(obj.timeInCurrentStateMinutes)
      ..writeByte(5)
      ..write(obj.activeProcesses)
      ..writeByte(6)
      ..write(obj.fatBurningPotential)
      ..writeByte(7)
      ..write(obj.muscleBuildinPotential)
      ..writeByte(8)
      ..write(obj.digestiveLoad)
      ..writeByte(9)
      ..write(obj.timeSinceLastMealMinutes)
      ..writeByte(10)
      ..write(obj.lastMealCalories)
      ..writeByte(11)
      ..write(obj.lastMealCarbs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetabolicStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetabolicPhaseAdapter extends TypeAdapter<MetabolicPhase> {
  @override
  final int typeId = 36;

  @override
  MetabolicPhase read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MetabolicPhase.fed;
      case 1:
        return MetabolicPhase.fasting;
      case 2:
        return MetabolicPhase.fatBurning;
      case 3:
        return MetabolicPhase.muscleBuilding;
      default:
        return MetabolicPhase.fed;
    }
  }

  @override
  void write(BinaryWriter writer, MetabolicPhase obj) {
    switch (obj) {
      case MetabolicPhase.fed:
        writer.writeByte(0);
        break;
      case MetabolicPhase.fasting:
        writer.writeByte(1);
        break;
      case MetabolicPhase.fatBurning:
        writer.writeByte(2);
        break;
      case MetabolicPhase.muscleBuilding:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetabolicPhaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InsulinLevelAdapter extends TypeAdapter<InsulinLevel> {
  @override
  final int typeId = 37;

  @override
  InsulinLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return InsulinLevel.low;
      case 1:
        return InsulinLevel.medium;
      case 2:
        return InsulinLevel.high;
      default:
        return InsulinLevel.low;
    }
  }

  @override
  void write(BinaryWriter writer, InsulinLevel obj) {
    switch (obj) {
      case InsulinLevel.low:
        writer.writeByte(0);
        break;
      case InsulinLevel.medium:
        writer.writeByte(1);
        break;
      case InsulinLevel.high:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InsulinLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
