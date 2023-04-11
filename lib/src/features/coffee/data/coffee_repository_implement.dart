abstract class CoffeeRepositoryImplement {
  // 특정 일자의 커피 기록 추가
  Future addCoffeeData(
      DateTime date, String cup, String cost, String momo) async {}

  // 특정 일자의 커피기록 받기
  getCoffeeDataForDate(DateTime date) async {}

  // 캘린더에 표시할 전체 커피 기록 받기
  Future getCoffeeDataForCalendar() async {}

  // 차트에 표시할 일주일 커피 기록 받기
  Future getChartDataForWeek() async {}

  // 차트에 표시할 1달 커피 기록 받기
  Future getChartDataForMonth() async {}

  // 차트에 표시할 3개월 커피 기록 받기
  Future getChartDataForThreeMonth() async {}

  // 차트에 표시할 6개월 커피 기록 받기
  Future getChartDataForSixMonth() async {}

  // 차트에 표시할 1년 커피 기록 받기
  Future getChartDataForYear() async {}

  // 특정 일자의 커피 기록 삭제
  Future removeCoffeeDataForDate() async {}

  // Hive "Coffee" Box 모든 데이터 지우기
  // 박스 존재는 그대로 남아있음
  Future removeCoffeeBox() async {}
}
