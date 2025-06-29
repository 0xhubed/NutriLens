// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityEntryAdapter extends TypeAdapter<ActivityEntry> {
  @override
  final int typeId = 3;

  @override
  ActivityEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityEntry()
      ..id = fields[0] as String?
      ..activityName = fields[1] as String
      ..metValue = fields[2] as double
      ..durationMinutes = fields[3] as int
      ..caloriesBurned = fields[4] as double
      ..timestamp = fields[5] as DateTime
      ..category = fields[6] as ActivityCategory
      ..intensity = fields[7] as Intensity
      ..notes = fields[8] as String?
      ..userWeight = fields[9] as double?
      ..isManualEntry = fields[10] as bool
      ..heartRateAverage = fields[11] as double?
      ..distanceKm = fields[12] as double?
      ..location = fields[13] as String?;
  }

  @override
  void write(BinaryWriter writer, ActivityEntry obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.activityName)
      ..writeByte(2)
      ..write(obj.metValue)
      ..writeByte(3)
      ..write(obj.durationMinutes)
      ..writeByte(4)
      ..write(obj.caloriesBurned)
      ..writeByte(5)
      ..write(obj.timestamp)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.intensity)
      ..writeByte(8)
      ..write(obj.notes)
      ..writeByte(9)
      ..write(obj.userWeight)
      ..writeByte(10)
      ..write(obj.isManualEntry)
      ..writeByte(11)
      ..write(obj.heartRateAverage)
      ..writeByte(12)
      ..write(obj.distanceKm)
      ..writeByte(13)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityAdapter extends TypeAdapter<Activity> {
  @override
  final int typeId = 28;

  @override
  Activity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Activity()
      ..name = fields[0] as String
      ..baseMET = fields[1] as double
      ..category = fields[2] as ActivityCategory
      ..description = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Activity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.baseMET)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityCategoryAdapter extends TypeAdapter<ActivityCategory> {
  @override
  final int typeId = 38;

  @override
  ActivityCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityCategory.cardio;
      case 1:
        return ActivityCategory.strength;
      case 2:
        return ActivityCategory.sports;
      case 3:
        return ActivityCategory.flexibility;
      case 4:
        return ActivityCategory.water;
      case 5:
        return ActivityCategory.other;
      default:
        return ActivityCategory.cardio;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityCategory obj) {
    switch (obj) {
      case ActivityCategory.cardio:
        writer.writeByte(0);
        break;
      case ActivityCategory.strength:
        writer.writeByte(1);
        break;
      case ActivityCategory.sports:
        writer.writeByte(2);
        break;
      case ActivityCategory.flexibility:
        writer.writeByte(3);
        break;
      case ActivityCategory.water:
        writer.writeByte(4);
        break;
      case ActivityCategory.other:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IntensityAdapter extends TypeAdapter<Intensity> {
  @override
  final int typeId = 39;

  @override
  Intensity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Intensity.light;
      case 1:
        return Intensity.moderate;
      case 2:
        return Intensity.vigorous;
      default:
        return Intensity.light;
    }
  }

  @override
  void write(BinaryWriter writer, Intensity obj) {
    switch (obj) {
      case Intensity.light:
        writer.writeByte(0);
        break;
      case Intensity.moderate:
        writer.writeByte(1);
        break;
      case Intensity.vigorous:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntensityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
