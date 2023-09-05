// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../models/movimiento_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovimientoModelAdapter extends TypeAdapter<MovimientoModel> {
  @override
  final int typeId = 1;

  @override
  MovimientoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovimientoModel(
      id: fields[0] as String?,
      monto: fields[2] as double,
      detalles: fields[3] as String?,
      creado: fields[1] as DateTime?,
      tags: (fields[4] as List?)?.cast<TagModel>(),
      tipo: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MovimientoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(2)
      ..write(obj.monto)
      ..writeByte(3)
      ..write(obj.detalles)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.tipo)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creado);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovimientoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
