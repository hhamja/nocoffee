import 'package:hive/hive.dart';

part 'coffee_data_model.g.dart';

@HiveType(typeId: 0)
class CoffeeDataModel {
  // 데이터 입력 날짜(id)
  @HiveField(0)
  final DateTime date;

  // 커피 잔 수
  @HiveField(1)
  final int coffeeCup;

  // 커피 구입 금액 (총 ?  하나 당?)
  @HiveField(2)
  final int coffeeCost;

  // 메모
  @HiveField(3)
  final int memo;

  CoffeeDataModel({
    required this.date,
    required this.coffeeCup,
    required this.coffeeCost,
    required this.memo,
  });
}
