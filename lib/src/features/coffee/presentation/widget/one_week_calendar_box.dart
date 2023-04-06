import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/custom_table_calendar.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          CustomTableCalendar(
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
