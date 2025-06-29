// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metabolic_insight.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetabolicInsightAdapter extends TypeAdapter<MetabolicInsight> {
  @override
  final int typeId = 7;

  @override
  MetabolicInsight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetabolicInsight()
      ..id = fields[0] as String?
      ..timestamp = fields[1] as DateTime
      ..userId = fields[2] as String
      ..currentState = fields[3] as String
      ..recommendation = fields[4] as String
      ..reasoning = fields[5] as String
      ..confidenceScore = fields[6] as int
      ..actionItems = (fields[7] as List).cast<String>()
      ..nextOptimalMealTime = fields[8] as String?
      ..recommendedProtein = fields[9] as double
      ..recommendedCarbs = fields[10] as double
      ..recommendedFat = fields[11] as double
      ..fastingRecommendation = fields[12] as String?
      ..workoutTiming = fields[13] as String?
      ..sleepOptimization = fields[14] as String?
      ..contextHash = fields[15] as String;
  }

  @override
  void write(BinaryWriter writer, MetabolicInsight obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.currentState)
      ..writeByte(4)
      ..write(obj.recommendation)
      ..writeByte(5)
      ..write(obj.reasoning)
      ..writeByte(6)
      ..write(obj.confidenceScore)
      ..writeByte(7)
      ..write(obj.actionItems)
      ..writeByte(8)
      ..write(obj.nextOptimalMealTime)
      ..writeByte(9)
      ..write(obj.recommendedProtein)
      ..writeByte(10)
      ..write(obj.recommendedCarbs)
      ..writeByte(11)
      ..write(obj.recommendedFat)
      ..writeByte(12)
      ..write(obj.fastingRecommendation)
      ..writeByte(13)
      ..write(obj.workoutTiming)
      ..writeByte(14)
      ..write(obj.sleepOptimization)
      ..writeByte(15)
      ..write(obj.contextHash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetabolicInsightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
