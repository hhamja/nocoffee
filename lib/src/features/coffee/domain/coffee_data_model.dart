import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'coffee_data_model.g.dart';
part 'coffee_data_model.freezed.dart';

@freezed
@HiveType(typeId: 1, adapterName: 'CoffeeDataModelAdapter')
class CoffeeDataModel extends HiveObject with _$CoffeeDataModel {
  CoffeeDataModel._();
  factory CoffeeDataModel({
    // 데이터 입력 날짜 (key)
    @HiveField(0) required DateTime date,
    // 해당일의 총 마신 커피 수
    @HiveField(1) required String coffeeCup,
    // 해당일의 총 커피 구입 금액
    @HiveField(2) required String coffeeCost,
    // 메모
    @HiveField(3) required String memo,
  }) = _CoffeeDataModel;

  factory CoffeeDataModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeDataModelFromJson(json);
}
