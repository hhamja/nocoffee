import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ThreeMonthLineChart extends StatelessWidget {
  final List<CoffeeDataModel> coffeModelList;
  const ThreeMonthLineChart({super.key, required this.coffeModelList});

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    final DateTime threeMonthAgo =
        today.subtract(const Duration(days: 4 * 3 * 7));
    final String formattedToday = DateFormat('yyyy년 M월 d일').format(today);
    final String formattedThreeMonthAgo =
        DateFormat('yyyy년 M월 d일').format(threeMonthAgo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$formattedThreeMonthAgo ~ $formattedToday',
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 18),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 21),
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                minimum: today.subtract(const Duration(days: 4 * 3 * 7)),
                maximum: today,
                dateFormat: DateFormat('E', 'ko'),
                intervalType: DateTimeIntervalType.days,
                interval: 1,
              ),
              primaryYAxis: NumericAxis(
                  labelFormat: '{value}잔',
                  interval: 20,
                  labelStyle: const TextStyle(
                    fontSize: 10,
                  )),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<CoffeeDataModel, DateTime>>[
                LineSeries(
                  dataSource: coffeModelList,
                  // x축
                  xValueMapper: (model, _) => model.date,
                  // y축
                  yValueMapper: (model, _) => int.parse(model.coffeeCup),

                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
