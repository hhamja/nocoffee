import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/custom_table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class OneWeekCalendarBox extends StatefulWidget {
  const OneWeekCalendarBox({super.key});

  @override
  State<OneWeekCalendarBox> createState() => _OneWeekCalendarBoxState();
}

class _OneWeekCalendarBoxState extends State<OneWeekCalendarBox> {
  DateTime _focusedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

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
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.week,
            headerVisible: true,
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                _focusedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
        ],
      ),
    );
  }
}
