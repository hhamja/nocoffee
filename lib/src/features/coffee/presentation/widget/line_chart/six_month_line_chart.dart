import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SixMonthLineChart extends ConsumerWidget {
  final List<CoffeeDataModel> coffeModelList;
  const SixMonthLineChart({super.key, required this.coffeModelList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sixMonthProvider = ref.watch(sixMonthChartDataProvider);

    // String cup을 double로 변환
    final List<double> cupList =
        coffeModelList.map((model) => double.parse(model.coffeeCup)).toList();
    // cupList에서 가장 큰 값 구하기
    final double maxCup = cupList.reduce(max);
    // cupList에서 가장 작은 값 구하기
    final double minCup = cupList.reduce(min);
    final DateTime today = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
    final DateTime sixMonthAgo =
        today.subtract(const Duration(days: 4 * 6 * 7 - 1));
    final String formattedToday = DateFormat('yyyy년 M월 d일').format(today);
    final String formattedSixMonthAgo =
        DateFormat('yyyy년 M월 d일').format(sixMonthAgo);

    return sixMonthProvider.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$formattedSixMonthAgo ~ $formattedToday',
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 18),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 21),
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  minimum: sixMonthAgo,
                  maximum: today,
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
