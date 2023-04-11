import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_graph.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

class LineGraphPage extends ConsumerStatefulWidget {
  const LineGraphPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LineGraphPageState();
}

class _LineGraphPageState extends ConsumerState<LineGraphPage> {
  @override
  Widget build(BuildContext context) {
    final coffeeModelList = ref.watch(lineChartCoffeeDataProvider);
    return DefaultLayout(
      title: const Text('통계'),
      body: coffeeModelList.when(
        data: (coffeeModelList) {
          final cupToDouble =
              coffeeModelList.map((e) => double.parse(e.coffeeCup).toDouble());
          final maxCup = cupToDouble.reduce(max);
          final minCup = cupToDouble.reduce(min);

          return CustomLineGraph(
            maxY: maxCup,
            minY: minCup,
            getLeftTitlesWidget: (value, meta) => Text(value.toString()),
            // getbottomTitlesWidget: (value, meta) => const Text('월'),
            spotList: coffeeModelList.map((coffeeModel) {
              // final DateTime parsedDate =
              //     DateTime.parse(coffeeModel.date.toString());
              final double x =
                  coffeeModel.date.millisecondsSinceEpoch.toDouble();
              final double y = double.parse(coffeeModel.coffeeCup);
              return FlSpot(x, y);
            }).toList(),
          );
        },
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
      ),
    );
  }
}
