import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/calendar/custom_table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class OneWeekCalendarBox extends StatelessWidget {
  final List<dynamic> Function(DateTime)? eventLoader;
  final DateTime focusedDay;
  final void Function(DateTime, DateTime)? onDaySelected;
  final CalendarFormat calendarFormat;
  const OneWeekCalendarBox({
    super.key,
    this.eventLoader,
    required this.focusedDay,
    this.onDaySelected,
    required this.calendarFormat,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime lastDay = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 30),
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          CustomTableCalendar(
            lastDay: lastDay,
            // 요일 cell의 높이
            daysOfWeekHeight: 34,
            outsideTextColor: TEXT_COLOR,
            headerTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),
            headerPadding: const EdgeInsets.fromLTRB(8, 0, 0, 13),
            eventLoader: eventLoader,
            calendarBuilders: const CalendarBuilders(),
            focusedDay: focusedDay,
            calendarFormat: calendarFormat,
            headerVisible: true,
            onDaySelected: onDaySelected,
          ),
        ],
      ),
    );
  }
}
