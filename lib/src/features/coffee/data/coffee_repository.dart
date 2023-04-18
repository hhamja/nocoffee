import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository_implement.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

final coffeeRepositoryProvider = Provider<CoffeeRepository>((ref) {
  return CoffeeRepository();
});

class CoffeeRepository implements CoffeeRepositoryImplement {
  // 특정 일자의 커피 기록 추가 및 업데이트
  @override
  Future addCoffeeData(DateTime date, String cup, cost, memo) async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    final coffeeDataModel = CoffeeDataModel(
        date: date.toUtc(), coffeeCup: cup, coffeeCost: cost, memo: memo);
    debugPrint(coffeeDataModel.coffeeCost);
    debugPrint(coffeeDataModel.date.toString());
    debugPrint(coffeeDataModel.coffeeCup);
    debugPrint(coffeeDataModel.memo);
    coffeeBox.put(date.toString(), coffeeDataModel);
  }

  // 특정 일자의 커피기록 받기
  @override
  CoffeeDataModel getCoffeeDataForDate(DateTime date) {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
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

  // 캘린더에 표시할 전체 커피 기록 받기
  @override
  Future<Map<DateTime, List<CoffeeDataModel>>>
      getCoffeeDataForCalendar() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
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

  // 차트에 표시할 7일 커피 기록 리스트로 받기
  @override
  Future<List<CoffeeDataModel>> getChartDataForWeek() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');

    final DateTime now = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    final List<CoffeeDataModel> modelList = [];

    // 1주일 Date 반복문
    // 과거일수록 list 앞
    for (int i = WEEK_DURATION; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final CoffeeDataModel coffeeDataModel = coffeeBox.get(date.toString()) ??
          CoffeeDataModel(date: date, coffeeCup: '', coffeeCost: '', memo: '');
      // if (coffeeDataModel != null) {
      //   // 해당 날짜의 값이 있는 경우
      modelList.add(coffeeDataModel);
      // } else {
      //   // 해당 날짜의 값이 없는 경우
      //   null;
      // }
    }
    return modelList;
  }

  // 1개월 차트 커피 기록 받기
  @override
  Future<List<CoffeeDataModel>> getChartDataForMonth() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    final DateTime now = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    final List<CoffeeDataModel> modelList = [];

    // 1달 Date 반복문
    // 과거일수록 list 앞
    for (int i = MONTH_DURATION; i >= 0; i--) {
      final DateTime date = now.subtract(Duration(days: i));
      final CoffeeDataModel? coffeeDataModel = coffeeBox.get(date.toString());
      if (coffeeDataModel != null) {
        // 해당 날짜의 값이 있는 경우
        modelList.add(coffeeDataModel);
      } else {
        // 해당 날짜의 값이 없는 경우
        null;
      }
    }
    return modelList;
  }

  // 3개월 차트 커피 기록 받기
  @override
  Future<List<CoffeeDataModel>> getChartDataForThreeMonth() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    final DateTime now = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    final List<CoffeeDataModel> modelList = [];

    // 3개월 Date 반복문
    // 과거일수록 list 앞
    for (int i = THREE_MONTH_DURATION; i >= 0; i--) {
      final DateTime date = now.subtract(Duration(days: i));
      final CoffeeDataModel? coffeeDataModel = coffeeBox.get(date.toString());
      if (coffeeDataModel != null) {
        // 해당 날짜의 값이 있는 경우
        modelList.add(coffeeDataModel);
      } else {
        // 해당 날짜의 값이 없는 경우
        null;
      }
    }
    return modelList;
  }

  // 6개월 차트 커피 기록 받기
  @override
  Future<List<CoffeeDataModel>> getChartDataForSixMonth() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    final DateTime now = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    final List<CoffeeDataModel> modelList = [];

    // 6개월 Date 반복문
    // 과거일수록 list 앞
    for (int i = SIX_MONTH_DURATION; i >= 0; i--) {
      final DateTime date = now.subtract(Duration(days: i));
      final CoffeeDataModel? coffeeDataModel = coffeeBox.get(date.toString());
      if (coffeeDataModel != null) {
        // 해당 날짜의 값이 있는 경우
        modelList.add(coffeeDataModel);
      } else {
        // 해당 날짜의 값이 없는 경우
        null;
      }
    }
    return modelList;
  }

  // 1년 차트 커피 기록 받기
  @override
  Future<List<CoffeeDataModel>> getChartDataForYear() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    final DateTime now = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    final List<CoffeeDataModel> modelList = [];

    // 1년 Date 반복문
    // 과거일수록 list 앞
    for (int i = YEAR_DURATION; i >= 0; i--) {
      final DateTime date = now.subtract(Duration(days: i));
      final CoffeeDataModel? coffeeDataModel = coffeeBox.get(date.toString());
      if (coffeeDataModel != null) {
        // 해당 날짜의 값이 있는 경우
        modelList.add(coffeeDataModel);
      } else {
        // 해당 날짜의 값이 없는 경우
        null;
      }
    }
    return modelList;
  }

  // 특정 일자의 커피 기록 삭제
  @override
  Future removeCoffeeDataForDate(String date) async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    return coffeeBox.delete(date);
  }

  // 커피 박스의 모든 데이터 삭제
  @override
  Future removeCoffeeBox() async {
    final coffeeBox = Hive.box<CoffeeDataModel>('coffee');
    return coffeeBox.clear();
  }
}
