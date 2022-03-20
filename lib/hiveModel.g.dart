// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutAdapter extends TypeAdapter<Workout> {
  @override
  final int typeId = 10;

  @override
  Workout read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Workout()
      ..date = fields[0] as DateTime?
      .._set = (fields[1] as List?)?.cast<int>()
      ..max = fields[2] as int
      ..min = fields[3] as int
      ..sum = fields[4] as int
      ..avg = fields[5] as double
      ..plank = fields[6] as double;
  }

  @override
  void write(BinaryWriter writer, Workout obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj._set)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.min)
      ..writeByte(4)
      ..write(obj.sum)
      ..writeByte(5)
      ..write(obj.avg)
      ..writeByte(6)
      ..write(obj.plank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
