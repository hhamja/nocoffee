// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoffeeDataModelAdapter extends TypeAdapter<CoffeeDataModel> {
  @override
  final int typeId = 0;

  @override
  CoffeeDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoffeeDataModel(
      date: fields[0] as DateTime,
      coffeeCup: fields[1] as int,
      coffeeCost: fields[2] as int,
      memo: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CoffeeDataModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.coffeeCup)
      ..writeByte(2)
      ..write(obj.coffeeCost)
      ..writeByte(3)
      ..write(obj.memo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
