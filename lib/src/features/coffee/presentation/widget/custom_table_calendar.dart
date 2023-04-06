import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final void Function(DateTime, DateTime)? onDaySelected;
  final void Function(DateTime)? onPageChanged;
  final CalendarFormat calendarFormat;
  final bool headerVisible;
  final List<dynamic> Function(DateTime)? eventLoader;
  final CalendarBuilders<dynamic> calendarBuilders;
  const CustomTableCalendar({
    super.key,
    required this.focusedDay,
    required this.calendarFormat,
    this.onDaySelected,
    required this.headerVisible,
    this.onPageChanged,
    this.eventLoader,
    required this.calendarBuilders,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onPageChanged: onPageChanged,
      locale: 'ko_KR',
      // 달력의 시작 날짜 : 저번달 1일
      firstDay: DateTime(
        DateTime.now().year,
        DateTime.now().month - 1,
        1,
      ),
      // 달력의 마지막 날짜 : 오늘
      lastDay: DateTime.now(),
      // eventLoader 콜백 함수 등록
      eventLoader: eventLoader,
      calendarBuilders: calendarBuilders,
      // 선택 된 날짜
      focusedDay: focusedDay,
      // 요일 표시 여부
      daysOfWeekVisible: true,
      calendarFormat: calendarFormat,

      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime day) {
        // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
        return isSameDay(focusedDay, day);
      },
      // 요일 부분의 높이 설정
      daysOfWeekHeight: 34,
      // 월 ~ 일 텍스트 스타일 지정
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 14,
        ),
        weekendStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        // 마커 여러개이면 셀 영역을 벗어날지 여부
        canMarkersOverflow: false,
        // 자동정렬 여부
        markersAutoAligned: true,
        cellPadding: EdgeInsets.zero,
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: GREY_COLOR,
          ),
        ),
        // 오늘 텍스트 스타일
        todayTextStyle: const TextStyle(
          fontSize: 18,
          color: TEXT_COLOR,
          fontWeight: FontWeight.normal,
        ),
        // 토,일 텍스트 스타일
        weekendTextStyle: const TextStyle(
          fontSize: 18,
        ),
        // 다른 달의 날짜 텍스트 스타일
        outsideTextStyle: const TextStyle(
          fontSize: 18,
          color: LIGHT_GREY_COLOR,
        ),
        // 해당 달의 지난 날짜 텍스트 스타일
        disabledTextStyle: const TextStyle(
          fontSize: 18,
          color: LIGHT_GREY_COLOR,
        ),
        // 기본 날짜 텍스트
        defaultTextStyle: const TextStyle(
          fontSize: 18,
        ),

        // 선택한 날짜 박스 스타일
        selectedDecoration: const BoxDecoration(
          color: PRIMARY_COLOR,
          shape: BoxShape.circle,
        ),
        // 선택한 날짜의 텍스트 스타일
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: WHITE_COLOR,
        ),
        // 테이블 패딩
        tablePadding: EdgeInsets.zero,
      ),
      headerVisible: headerVisible,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        // 연.월.일 텍스트 스타일
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
        ),
        // 연.월.일 가운데 정렬 여부
        titleCentered: false,
        leftChevronPadding: EdgeInsets.zero,
        rightChevronPadding: EdgeInsets.zero,
        //헤더 박스 패딩
        headerPadding: const EdgeInsets.fromLTRB(8, 0, 0, 13),
        leftChevronVisible: false,
        rightChevronVisible: false,
        //왼쪽 화살표 아이콘 버튼
        leftChevronIcon: Icon(
          Icons.arrow_left,
        ),
        //오른쪽 화살표 아이콘 버튼
        rightChevronIcon: Icon(
          Icons.arrow_right,
        ),
      ),
    );
  }
}
