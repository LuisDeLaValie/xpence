// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../models/creditos_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditosModelAdapter extends TypeAdapter<CreditosModel> {
  @override
  final int typeId = 3;

  @override
  CreditosModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditosModel(
      id: fields[0] as String?,
      creado: fields[1] as DateTime?,
      credito: fields[2] as String,
      pago: fields[3] as double,
      corteD: fields[4] as int,
      pagoD: fields[5] as int,
      monto: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CreditosModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(2)
      ..write(obj.credito)
      ..writeByte(3)
      ..write(obj.pago)
      ..writeByte(4)
      ..write(obj.corteD)
      ..writeByte(5)
      ..write(obj.pagoD)
      ..writeByte(6)
      ..write(obj.monto)
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
      other is CreditosModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
