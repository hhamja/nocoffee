import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

final calendarCoffeeDataProvider =
    FutureProvider.autoDispose<Map<DateTime, List<CoffeeDataModel>>>(
        (ref) async {
  final repository = ref.read(coffeeRepositoryProvider);
  final Map<DateTime, List<CoffeeDataModel>> getAllCoffeeData =
      await repository.getCoffeeDataForCalendar();
  return getAllCoffeeData;
});
