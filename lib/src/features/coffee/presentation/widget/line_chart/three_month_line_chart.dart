import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ThreeMonthLineChart extends ConsumerWidget {
  final List<CoffeeDataModel> coffeModelList;
  const ThreeMonthLineChart({super.key, required this.coffeModelList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threeMonthProvider = ref.watch(threeMonthChartDataProvider);

    // String cup을 double로 변환
    final List<double> cupList =
        coffeModelList.map((model) => double.parse(model.coffeeCup)).toList();
    // cupList에서 가장 큰 값 구하기
    final double maxCup = cupList.reduce(max);
    // cupList에서 가장 작은 값 구하기
    final double minCup = cupList.reduce(min);

    final DateTime threeMonthAgo =
        DateTimeData.today.subtract(const Duration(days: 4 * 3 * 7 - 1));
    final String formattedToday =
        DateFormat('yyyy년 M월 d일').format(DateTimeData.today);
    final String formattedThreeMonthAgo =
        DateFormat('yyyy년 M월 d일').format(threeMonthAgo);

    return threeMonthProvider.when(
      data: (data) => Column(
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
                  minimum: threeMonthAgo,
                  maximum: DateTimeData.today,
                  dateFormat: DateFormat('E', 'ko'),
                  intervalType: DateTimeIntervalType.days,
                  interval: 1,
                ),
                primaryYAxis: NumericAxis(
                    visibleMinimum: minCup,
                    visibleMaximum: maxCup,
                    minimum: minCup,
                    maximum: maxCup,
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
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
