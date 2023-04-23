// ignore_for_file: constant_identifier_names

// 이전 기간 계산 Duration
const int WEEK_DURATION = 7 - 1;
const int MONTH_DURATION = 7 * 4 - 1;
const int THREE_MONTH_DURATION = 7 * 4 * 3 - 1;
const int SIX_MONTH_DURATION = 7 * 4 * 6 - 1;
const int YEAR_DURATION = 7 * 4 * 12 - 1;

class DateTimeData {
  // 오늘
  static final DateTime today = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
  // 일주 차트
  static final DateTime sixDayAgo = today.subtract(const Duration(days: 6));
  static final DateTime fiveDayAgo = today.subtract(const Duration(days: 5));
  static final DateTime fourDayAgo = today.subtract(const Duration(days: 4));
  static final DateTime threeDayAgo = today.subtract(const Duration(days: 3));
  static final DateTime twoDayAgo = today.subtract(const Duration(days: 2));
  static final DateTime oneDayAgo = today.subtract(const Duration(days: 1));

  // 한달 차트
  // 1주차
  static final DateTime firstWeekFirstDay =
      today.subtract(const Duration(days: 27));
  static final DateTime firstWeekLastDay =
      today.subtract(const Duration(days: 21));
  // 2주차
  static final DateTime secondWeekFirstDay =
      today.subtract(const Duration(days: 20));
  static final DateTime secondWeekLastDay =
      today.subtract(const Duration(days: 14));
  // 3주차
  static final DateTime thirdWeekFirstDay =
      today.subtract(const Duration(days: 13));
  static final DateTime thirdWeekLastDay =
      today.subtract(const Duration(days: 7));
  // 4주차
  static final DateTime fourthWeekFirstDay =
      today.subtract(const Duration(days: 6));
  static final DateTime fourthWeekLastDay =
      today.subtract(const Duration(days: 0));

  // 3개월 차트
  // 3달 전
  static final DateTime firstMonthFirstDay =
      today.subtract(const Duration(days: 56 + 27));
  static final DateTime firstMonthLastDay =
      today.subtract(const Duration(days: 56));
  // 2달 전
  static final DateTime secondMonthFirstDay =
      today.subtract(const Duration(days: 28 + 27));
  static final DateTime secondMonthLastDay =
      today.subtract(const Duration(days: 28));
  // 이번 달
  static final DateTime thirdMonthFirstDay =
      today.subtract(const Duration(days: 27));
  static final DateTime thirdMonthLastDay =
      today.subtract(const Duration(days: 0));

  // 1년 차트
  // 1분기
  static final DateTime firstQuarterFirstDay =
      today.subtract(const Duration(days: 7 * 4 * 12 - 1));
  static final DateTime firstQuarterLastDay =
      today.subtract(const Duration(days: 7 * 4 * 9));
  // 2분기
  static final DateTime secondQuarterFirstDay =
      today.subtract(const Duration(days: 7 * 4 * 9 - 1));
  static final DateTime secondQuarterLastDay =
      today.subtract(const Duration(days: 7 * 4 * 6));
  // 3분기
  static final DateTime thirdQuarterFirstDay =
      today.subtract(const Duration(days: 7 * 4 * 6 - 1));
  static final DateTime thirdQuarterLastDay =
      today.subtract(const Duration(days: 7 * 4 * 3));
  // 4분기
  static final DateTime fourthQuarterFirstDay =
      today.subtract(const Duration(days: 7 * 4 * 3 - 1));
  static final DateTime fourthQuarterLastDay =
      today.subtract(const Duration(days: 0));
}
