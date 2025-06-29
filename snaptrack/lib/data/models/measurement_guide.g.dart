// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_guide.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasurementGuideAdapter extends TypeAdapter<MeasurementGuide> {
  @override
  final int typeId = 10;

  @override
  MeasurementGuide read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasurementGuide()
      ..id = fields[0] as String?
      ..unitId = fields[1] as String
      ..unitDisplayName = fields[2] as String
      ..title = fields[3] as String
      ..description = fields[4] as String
      ..visualComparison = fields[5] as String
      ..helpText = fields[6] as String
      ..category = fields[7] as MeasurementCategory
      ..visualComparisons = (fields[8] as List).cast<String>()
      ..handComparisons = (fields[9] as List).cast<String>()
      ..commonObjects = (fields[10] as List).cast<String>()
      ..bestFor = (fields[11] as List).cast<String>()
      ..examples = (fields[12] as List).cast<String>()
      ..howToMeasure = fields[13] as String?
      ..commonMistakes = fields[14] as String?
      ..accuracyTips = fields[15] as String?
      ..approximateGrams = fields[16] as double?
      ..approximateCalories = fields[17] as double?
      ..isUserFavorite = fields[18] as bool
      ..createdAt = fields[19] as DateTime
      ..lastViewed = fields[20] as DateTime?
      ..viewCount = fields[21] as int;
  }

  @override
  void write(BinaryWriter writer, MeasurementGuide obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.unitId)
      ..writeByte(2)
      ..write(obj.unitDisplayName)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.visualComparison)
      ..writeByte(6)
      ..write(obj.helpText)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.visualComparisons)
      ..writeByte(9)
      ..write(obj.handComparisons)
      ..writeByte(10)
      ..write(obj.commonObjects)
      ..writeByte(11)
      ..write(obj.bestFor)
      ..writeByte(12)
      ..write(obj.examples)
      ..writeByte(13)
      ..write(obj.howToMeasure)
      ..writeByte(14)
      ..write(obj.commonMistakes)
      ..writeByte(15)
      ..write(obj.accuracyTips)
      ..writeByte(16)
      ..write(obj.approximateGrams)
      ..writeByte(17)
      ..write(obj.approximateCalories)
      ..writeByte(18)
      ..write(obj.isUserFavorite)
      ..writeByte(19)
      ..write(obj.createdAt)
      ..writeByte(20)
      ..write(obj.lastViewed)
      ..writeByte(21)
      ..write(obj.viewCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementGuideAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VisualReferenceAdapter extends TypeAdapter<VisualReference> {
  @override
  final int typeId = 29;

  @override
  VisualReference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisualReference()
      ..type = fields[0] as String
      ..description = fields[1] as String
      ..imagePath = fields[2] as String?
      ..iconName = fields[3] as String?
      ..size = fields[4] as double?;
  }

  @override
  void write(BinaryWriter writer, VisualReference obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.iconName)
      ..writeByte(4)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisualReferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
