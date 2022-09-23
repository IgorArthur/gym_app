// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseModelAdapter extends TypeAdapter<ExerciseModel> {
  @override
  final int typeId = 2;

  @override
  ExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseModel()
      ..group = fields[0] as String
      ..title = fields[1] as String
      ..weight = fields[2] as double
      ..sets = fields[3] as int
      ..reps = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, ExerciseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.group)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.sets)
      ..writeByte(4)
      ..write(obj.reps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
