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
    // final Map<String, dynamic> coffeeMapData = {
    //   'date': date,
    //   'coffeeCup': cup,
    //   'coffeeCost': cost,
    //   'memo': momo,
    // };
    debugPrint(coffeeDataModel.coffeeCost);
    debugPrint(coffeeDataModel.date.toString());
    debugPrint(coffeeDataModel.coffeeCup);
    debugPrint(coffeeDataModel.memo);

    coffeeBox.put(date.toString(), coffeeDataModel);
  }

  // 특정 일자의 커피기록 받기
  @override
  CoffeeDataModel? getCoffeeDataForDate(DateTime date) {
    final coffeeBox = Hive.box('coffee');
    final mapData = coffeeBox.get(date.toString());
    CoffeeDataModel? coffeeModel;
    if (mapData == null) {
      coffeeModel = null;
    } else {
      coffeeModel = CoffeeDataModel.fromJson(mapData);
    }
    return coffeeModel;
  }

  // 전체 커피 기록 리스트로 받기
  @override
  Future getCoffeeDataList() async {
    final coffeeBox = Hive.box('coffee');
    final List x = coffeeBox.values.toList();
    print(x);
  }

  // 커피 박스의 모든 데이터 삭제
  @override
  removeCoffeBoxData() async {
    final coffeeBox = Hive.box('coffee');
    await coffeeBox.clear();
  }
}
