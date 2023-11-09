// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../models/suscripciones_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuscripcionesModelAdapter extends TypeAdapter<SuscripcionesModel> {
  @override
  final int typeId = 2;

  @override
  SuscripcionesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuscripcionesModel(
      id: fields[0] as String?,
      creado: fields[1] as DateTime?,
      suscripcion: fields[2] as String,
      pago: fields[3] as double,
      pagoD: fields[4] as int,
      activa: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SuscripcionesModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(2)
      ..write(obj.suscripcion)
      ..writeByte(3)
      ..write(obj.pago)
      ..writeByte(4)
      ..write(obj.pagoD)
      ..writeByte(5)
      ..write(obj.activa)
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
      other is SuscripcionesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
