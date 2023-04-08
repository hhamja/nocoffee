import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

final allCoffeeDataProvider =
    FutureProvider.autoDispose<Map<DateTime, List<CoffeeDataModel>>>(
        (ref) async {
  final repository = ref.watch(coffeeRepositoryProvider);
  final Map<DateTime, List<CoffeeDataModel>> getAllCoffeeData =
      await repository.getAllCoffeeData();
  return getAllCoffeeData;
});

final coffeeDataForDateProvider =
    StateProvider.autoDispose.family<CoffeeDataModel, DateTime>((ref, date) {
  final repository = ref.watch(coffeeRepositoryProvider);
  final CoffeeDataModel coffeeDataForDate =
      repository.getCoffeeDataForDate(date.toUtc());
  return coffeeDataForDate;
});
