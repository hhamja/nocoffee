// ignore_for_file: constant_identifier_names

// 이전 기간 계산 Duration
const int WEEK_DURATION = 7 - 1;
const int MONTH_DURATION = 7 * 4 - 1;
const int THREE_MONTH_DURATION = 7 * 4 * 3 - 1;
const int SIX_MONTH_DURATION = 7 * 4 * 6 - 1;
const int YEAR_DURATION = 7 * 4 * 12 - 1;

class DateTimeData {
  // DateTime
  static final DateTime today = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
  // 일주 차트
  static final DateTime sixDayAgo = today.subtract(const Duration(days: 6));
  static final DateTime fiveayAgo = today.subtract(const Duration(days: 5));
  static final DateTime fourDayAgo = today.subtract(const Duration(days: 4));
  static final DateTime threeDayAgo = today.subtract(const Duration(days: 3));
  static final DateTime twoDayAgo = today.subtract(const Duration(days: 2));
  static final DateTime oneDayAgo = today.subtract(const Duration(days: 1));

  // 한달 차트
  static final DateTime secondWeekFirstDay =
      today.subtract(const Duration(days: 7));
  static final DateTime secondWeekLastDay =
      today.subtract(const Duration(days: 13));
  static final DateTime thirdWeekFirstDay =
      today.subtract(const Duration(days: 14));
  static final DateTime thirdWeekLastDay =
      today.subtract(const Duration(days: 20));
  static final DateTime fourthWeekFirstDay =
      today.subtract(const Duration(days: 21));
  static final DateTime fourthWeekLastDay =
      today.subtract(const Duration(days: 27));

  // 3개월 차트
  static final DateTime firstMonthFirstDay =
      today.subtract(const Duration(days: 7));
  static final DateTime firstMonthLastDay =
      today.subtract(const Duration(days: 13));
  static final DateTime secondMonthFirstDay =
      today.subtract(const Duration(days: 7));
  static final DateTime secondMonthLastDay =
      today.subtract(const Duration(days: 13));
  static final DateTime thirdMonthFirstDay =
      today.subtract(const Duration(days: 7));
  static final DateTime thirdMonthLastDay =
      today.subtract(const Duration(days: 13));

  // 6개월 차트
  // 1년 차트

  // // DateTime -> double
  // static final double sixDayToDouble =
  //     sixDayAgo.millisecondsSinceEpoch.toDouble() / 100000;
  // static final double fiveDayToDouble =
  //     fiveayAgo.millisecondsSinceEpoch.toDouble() / 100000;
  // static final double fourDayToDouble =
  //     fourDayAgo.millisecondsSinceEpoch.toDouble() / 100000;
  // static final double threeDayToDouble =
  //     threeDayAgo.millisecondsSinceEpoch.toDouble() / 100000;
  // static final double twoDayToDouble =
  //     twoDayAgo.millisecondsSinceEpoch.toDouble() / 100000;
  // static final double oneDayToDouble =
  //     oneDayAgo.millisecondsSinceEpoch.toDouble() / 100000;
  // static final double todayToDouble =
  //     today.millisecondsSinceEpoch.toDouble() / 100000;

  //
  static final DateTime oneWeekAgo =
      today.subtract(const Duration(days: WEEK_DURATION));
  static final DateTime oneMonthAgo =
      today.subtract(const Duration(days: MONTH_DURATION));
  static final DateTime threeMonthAgo =
      today.subtract(const Duration(days: THREE_MONTH_DURATION));
  static final DateTime sixMonthAgo =
      today.subtract(const Duration(days: SIX_MONTH_DURATION));
  static final DateTime oneYearAgo =
      today.subtract(const Duration(days: YEAR_DURATION));
}
