import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

// 1주일 차트 데이터 프로바이더
final oneWeekChartDataProvider =
    FutureProvider.autoDispose<List<CoffeeDataModel>>((ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final List<CoffeeDataModel> coffeeModelList =
      await repository.getChartDataForWeek();
  return coffeeModelList;
});

// 1개월
final oneMonthChartDataProvider =
    FutureProvider.autoDispose<List<CoffeeDataModel>>((ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final List<CoffeeDataModel> coffeeModelList =
      await repository.getChartDataForMonth();
  return coffeeModelList;
});

// 3개월
final threeMonthChartDataProvider =
    FutureProvider.autoDispose<List<CoffeeDataModel>>((ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final List<CoffeeDataModel> coffeeModelList =
      await repository.getChartDataForThreeMonth();
  return coffeeModelList;
});

// 6개월
final sixMonthChartDataProvider =
    FutureProvider.autoDispose<List<CoffeeDataModel>>((ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final List<CoffeeDataModel> coffeeModelList =
      await repository.getChartDataForSixMonth();
  return coffeeModelList;
});

// 1년
final oneYearChartDataProvider =
    FutureProvider.autoDispose<List<CoffeeDataModel>>((ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final List<CoffeeDataModel> coffeeModelList =
      await repository.getChartDataForYear();
  return coffeeModelList;
});
