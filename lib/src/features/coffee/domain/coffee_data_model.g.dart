// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoffeeDataModelAdapter extends TypeAdapter<CoffeeDataModel> {
  @override
  final int typeId = 1;

  @override
  CoffeeDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoffeeDataModel(
      date: fields[0] ?? DateTime.now(),
      coffeeCup: fields[1] ?? '',
      coffeeCost: fields[2] ?? '',
      memo: fields[3] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, CoffeeDataModel obj) {
    writer
      ..writeByte(3)
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoffeeDataModel _$$_CoffeeDataModelFromJson(Map<String, dynamic> json) =>
    _$_CoffeeDataModel(
      date: DateTime.parse(json['date'] as String),
      coffeeCup: json['coffeeCup'] as String,
      coffeeCost: json['coffeeCost'] as String,
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$$_CoffeeDataModelToJson(_$_CoffeeDataModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'coffeeCup': instance.coffeeCup,
      'coffeeCost': instance.coffeeCost,
      'memo': instance.memo,
    };
