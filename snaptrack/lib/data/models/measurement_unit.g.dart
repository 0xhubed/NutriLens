// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_unit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasurementUnitAdapter extends TypeAdapter<MeasurementUnit> {
  @override
  final int typeId = 5;

  @override
  MeasurementUnit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasurementUnit()
      ..id = fields[0] as String?
      ..unitId = fields[1] as String
      ..displayName = fields[2] as String
      ..shortName = fields[3] as String
      ..category = fields[4] as MeasurementCategory
      ..gramEquivalent = fields[5] as double?
      ..description = fields[6] as String?
      ..mlEquivalent = fields[7] as double?
      ..symbol = fields[8] as String?
      ..isCommon = fields[9] as bool;
  }

  @override
  void write(BinaryWriter writer, MeasurementUnit obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.unitId)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.shortName)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.gramEquivalent)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.mlEquivalent)
      ..writeByte(8)
      ..write(obj.symbol)
      ..writeByte(9)
      ..write(obj.isCommon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FoodPortionAdapter extends TypeAdapter<FoodPortion> {
  @override
  final int typeId = 22;

  @override
  FoodPortion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodPortion()
      ..foodName = fields[0] as String
      ..quantity = fields[1] as double
      ..unitId = fields[2] as String
      ..unitDisplayName = fields[3] as String
      ..estimatedGrams = fields[4] as double?
      ..userCorrectedGrams = fields[5] as double?
      ..calories = fields[6] as double
      ..protein = fields[7] as double
      ..carbs = fields[8] as double
      ..fat = fields[9] as double
      ..notes = fields[10] as String?;
  }

  @override
  void write(BinaryWriter writer, FoodPortion obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unitId)
      ..writeByte(3)
      ..write(obj.unitDisplayName)
      ..writeByte(4)
      ..write(obj.estimatedGrams)
      ..writeByte(5)
      ..write(obj.userCorrectedGrams)
      ..writeByte(6)
      ..write(obj.calories)
      ..writeByte(7)
      ..write(obj.protein)
      ..writeByte(8)
      ..write(obj.carbs)
      ..writeByte(9)
      ..write(obj.fat)
      ..writeByte(10)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodPortionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FoodConversionAdapter extends TypeAdapter<FoodConversion> {
  @override
  final int typeId = 23;

  @override
  FoodConversion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodConversion()
      ..id = fields[0] as String?
      ..foodName = fields[1] as String
      ..unitId = fields[2] as String
      ..gramsPerUnit = fields[3] as double
      ..source = fields[4] as String?
      ..isUserGenerated = fields[5] as bool
      ..createdAt = fields[6] as DateTime?
      ..confidence = fields[7] as double
      ..usageCount = fields[8] as int;
  }

  @override
  void write(BinaryWriter writer, FoodConversion obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.foodName)
      ..writeByte(2)
      ..write(obj.unitId)
      ..writeByte(3)
      ..write(obj.gramsPerUnit)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.isUserGenerated)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.confidence)
      ..writeByte(8)
      ..write(obj.usageCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodConversionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserMeasurementPreferenceAdapter
    extends TypeAdapter<UserMeasurementPreference> {
  @override
  final int typeId = 24;

  @override
  UserMeasurementPreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMeasurementPreference()
      ..id = fields[0] as String?
      ..foodCategory = fields[1] as String
      ..preferredUnitId = fields[2] as String
      ..usageCount = fields[3] as int
      ..lastUsed = fields[4] as DateTime;
  }

  @override
  void write(BinaryWriter writer, UserMeasurementPreference obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.foodCategory)
      ..writeByte(2)
      ..write(obj.preferredUnitId)
      ..writeByte(3)
      ..write(obj.usageCount)
      ..writeByte(4)
      ..write(obj.lastUsed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMeasurementPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeasurementCategoryAdapter extends TypeAdapter<MeasurementCategory> {
  @override
  final int typeId = 34;

  @override
  MeasurementCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MeasurementCategory.liquid;
      case 1:
        return MeasurementCategory.powder;
      case 2:
        return MeasurementCategory.solid;
      case 3:
        return MeasurementCategory.bulk;
      case 4:
        return MeasurementCategory.custom;
      default:
        return MeasurementCategory.liquid;
    }
  }

  @override
  void write(BinaryWriter writer, MeasurementCategory obj) {
    switch (obj) {
      case MeasurementCategory.liquid:
        writer.writeByte(0);
        break;
      case MeasurementCategory.powder:
        writer.writeByte(1);
        break;
      case MeasurementCategory.solid:
        writer.writeByte(2);
        break;
      case MeasurementCategory.bulk:
        writer.writeByte(3);
        break;
      case MeasurementCategory.custom:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
