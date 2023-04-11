import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';




final coffeeDataForDateProvider =
    StateProvider.autoDispose.family<CoffeeDataModel, DateTime>((ref, date) {
  final repository = ref.read(coffeeRepositoryProvider);
  final CoffeeDataModel coffeeDataForDate =
      repository.getCoffeeDataForDate(date.toUtc());
  return coffeeDataForDate;
});
