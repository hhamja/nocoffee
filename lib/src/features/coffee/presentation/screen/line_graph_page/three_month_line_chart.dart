import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/custom_line_chart_body.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

class ThreeMonthLineChart extends ConsumerWidget {
  const ThreeMonthLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat xLabelformatter = DateFormat('M/d');
    final DateFormat titleFormatter = DateFormat('yyyy년 M월 d일');
    final String formattedOneMonthAgo =
        titleFormatter.format(DateTimeData.firstMonthFirstDay);
    final String formattedToday = titleFormatter.format(DateTimeData.today);

    final List<String> xAxisLabelList = [
      '${xLabelformatter.format(DateTimeData.firstMonthFirstDay)} - ${xLabelformatter.format(DateTimeData.firstMonthLastDay)}',
      '${xLabelformatter.format(DateTimeData.secondMonthFirstDay)} - ${xLabelformatter.format(DateTimeData.secondMonthLastDay)}',
      '${xLabelformatter.format(DateTimeData.thirdMonthFirstDay)} - ${xLabelformatter.format(DateTimeData.thirdMonthLastDay)}',
    ];

    final threeMonthProvider = ref.watch(threeMonthChartDataProvider);
    return threeMonthProvider.when(
      data: (threeMonthModelList) => CustomLineChartBody(
        title: '$formattedOneMonthAgo ~ $formattedToday',
        minX: DateTimeData.firstMonthFirstDay,
        maxX: DateTimeData.thirdMonthLastDay,
        interval: 28,
        dataSource: threeMonthModelList,
        xAxisLabelList: xAxisLabelList,
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
