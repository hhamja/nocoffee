abstract class CoffeeRepositoryImplement {
  // 특정 일자의 커피 기록 추가
  Future addCoffeeData(
      DateTime date, String cup, String cost, String momo) async {}

  // 특정 일자의 커피기록 받기
  getCoffeeDataForDate(DateTime date) async {}

  // 전체 커피 기록 리스트로 받기
  Future getAllCoffeeData() async {}

  // Hive "Coffee" Box 모든 데이터 지우기
  // 박스 존재는 그대로 남아있음
  Future removeCoffeBoxData() async {}
}
