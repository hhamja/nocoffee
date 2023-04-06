import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

final coffeeDataForDateProvider =
    StateProvider.family<CoffeeDataModel?, DateTime>((ref, date) {
  final repository = ref.watch(coffeeRepositoryProvider);
  final CoffeeDataModel? coffeModel = repository.getCoffeeDataForDate(date);
  return coffeModel;
});

final coffeeDataController =
    StateNotifierProvider<CoffeeDataController, List<CoffeeDataModel>>(
  (ref) => CoffeeDataController(ref),
);

// crud 수행하는 컨트롤러
class CoffeeDataController extends StateNotifier<List<CoffeeDataModel>> {
  final Ref ref;
  CoffeeDataController(this.ref) : super([]);

  // 커피 기록 추가
  Future addCoffeeData(date, cup, cost, momo) async {
    final repository = ref.read(coffeeRepositoryProvider);
    repository.addCoffeeData(date, cup, cost, momo);
  }

  // coffee 모든 데이터 List로 받기
  getCoffeeDataList() async {
    final repository = ref.read(coffeeRepositoryProvider);
    repository.getCoffeeDataList().then((value) => state = value);
  }

  // coffee 박스 모든 데이터 삭제
  removeCoffeBoxData() async {
    final repository = ref.read(coffeeRepositoryProvider);
    repository.removeCoffeBoxData();
  }
}
