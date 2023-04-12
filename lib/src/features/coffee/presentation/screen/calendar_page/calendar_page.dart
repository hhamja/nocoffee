import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/calendar_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/calendar_cell.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/custom_table_calendar.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  DateTime focusedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).toUtc();

  @override
  Widget build(BuildContext context) {
    final allCoffeeData = ref.watch(calendarCoffeeDataProvider);
    return Scaffold(
        appBar: AppBar(),
        body: allCoffeeData.when(
          data: (Map<DateTime, List<CoffeeDataModel>> data) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: CustomTableCalendar(
                        lastDay: DateTime(DateTime.now().year + 5, 12, 31),
                        daysOfWeekHeight: 89,
                        shouldFillViewport: true,
                        outsideTextColor: LIGHT_GREY_COLOR,
                        headerTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                        headerPadding: const EdgeInsets.fromLTRB(4, 0, 0, 5),
                        focusedDay: focusedDay,
                        calendarFormat: CalendarFormat.month,
                        headerVisible: true,
                        calendarBuilders: CalendarBuilders(
                          outsideBuilder: (context, day, events) =>
                              CustomCalendarCell(
                            day: day.toUtc(),
                            recordText: '',
                            daycColor: Colors.grey[200],
                          ),
                          defaultBuilder: (context, day, focusedDay) =>
                              CustomCalendarCell(
                            day: day.toUtc(),
                            recordText: data[day]?[0].coffeeCup ?? '',
                          ),
                          todayBuilder: (context, day, focusedDay) =>
                              CustomCalendarCell(
                            day: day.toUtc(),
                            recordText: data[day]?[0].coffeeCup ?? '',
                          ),
                          disabledBuilder: (context, day, focusedDay) =>
                              CustomCalendarCell(
                            day: day.toUtc(),
                            daycColor: Colors.grey[200],
                            recordText: '',
                          ),
                          selectedBuilder: (context, day, focusedDay) =>
                              CustomCalendarCell(
                            day: day.toUtc(),
                            recordText: data[day]?[0].coffeeCup ?? '',
                          ),
                        ),
                        onDaySelected: null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => const CustomErrorData(),
          loading: () => const CustomCircularLoading(),
        ));
  }
}
