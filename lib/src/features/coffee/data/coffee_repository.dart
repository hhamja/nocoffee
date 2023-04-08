import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository_implement.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

final coffeeRepositoryProvider = Provider<CoffeeRepository>((ref) {
  return CoffeeRepository();
});

class CoffeeRepository implements CoffeeRepositoryImplement {
  // 특정 일자의 커피 기록 추가 및 업데이트
  @override
  Future addCoffeeData(DateTime date, String cup, cost, memo) async {
    final coffeeBox = Hive.box('coffee');
    final coffeeDataModel = CoffeeDataModel(
        date: date, coffeeCup: cup, coffeeCost: cost, memo: memo);
    debugPrint(coffeeDataModel.coffeeCost);
    debugPrint(coffeeDataModel.date.toString());
    debugPrint(coffeeDataModel.coffeeCup);
    debugPrint(coffeeDataModel.memo);
    coffeeBox.put(date.toString(), coffeeDataModel);
  }

  // 특정 일자의 커피기록 받기
  @override
  CoffeeDataModel getCoffeeDataForDate(DateTime date) {
    final coffeeBox = Hive.box('coffee');
    final CoffeeDataModel coffeeModel = coffeeBox.get(date.toString(),
        // 값이 없을 경우 기본 값
        defaultValue: CoffeeDataModel(
          date: date,
          coffeeCup: '',
          coffeeCost: '',
          memo: '',
        )) as CoffeeDataModel;

    return coffeeModel;
  }

  // 전체 커피 기록 받기
  @override
  Future<Map<DateTime, List<CoffeeDataModel>>> getAllCoffeeData() async {
    final coffeeBox = Hive.box('coffee');
    Map<DateTime, List<CoffeeDataModel>> coffeeMap = {};

    coffeeBox.keys.forEach((key) {
      CoffeeDataModel coffeeModel = coffeeBox.get(key)!;
      DateTime date = coffeeModel.date;
      if (coffeeMap.containsKey(date)) {
        coffeeMap[date]!.add(coffeeModel);
      } else {
        coffeeMap[date] = [coffeeModel];
      }
    });
    return coffeeMap;
  }

  // 커피 박스의 모든 데이터 삭제
  @override
  Future removeCoffeBoxData() async {
    final coffeeBox = Hive.box('coffee');
    await coffeeBox.clear();
  }
}
