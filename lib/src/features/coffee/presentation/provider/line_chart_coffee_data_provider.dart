import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

final lineChartCoffeeDataProvider =
    FutureProvider.autoDispose<List<CoffeeDataModel>>((ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final List<CoffeeDataModel> coffeeModelList =
      await repository.getChartDataForWeek();
  return coffeeModelList;
});
