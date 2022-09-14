// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainModelAdapter extends TypeAdapter<TrainModel> {
  @override
  final int typeId = 1;

  @override
  TrainModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainModel()
      ..title = fields[0] as String
      ..type = fields[1] as String
      ..group = fields[2] as int
      ..time = fields[3] as int
      ..exerciseList = (fields[4] as List).cast<ExerciseModel>();
  }

  @override
  void write(BinaryWriter writer, TrainModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.group)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.exerciseList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}