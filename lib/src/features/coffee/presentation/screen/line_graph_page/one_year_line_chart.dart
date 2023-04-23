import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/custom_line_chart_body.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

class OneYearLineChart extends ConsumerWidget {
  const OneYearLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat xLabelformatter = DateFormat('M/d');
    final DateFormat titleFormatter = DateFormat('yyyy년 M월 d일');
    final String formattedOneYearAgo =
        titleFormatter.format(DateTimeData.firstQuarterFirstDay);
    final String formattedToday = titleFormatter.format(DateTimeData.today);

    final List<String> xAxisLabelList = [
      '${xLabelformatter.format(DateTimeData.firstQuarterFirstDay)} - ${xLabelformatter.format(DateTimeData.firstQuarterLastDay)}',
      '${xLabelformatter.format(DateTimeData.secondQuarterFirstDay)} - ${xLabelformatter.format(DateTimeData.secondQuarterLastDay)}',
      '${xLabelformatter.format(DateTimeData.thirdQuarterFirstDay)} - ${xLabelformatter.format(DateTimeData.thirdQuarterLastDay)}',
      '${xLabelformatter.format(DateTimeData.fourthQuarterFirstDay)} - ${xLabelformatter.format(DateTimeData.fourthQuarterLastDay)}',
    ];

    final oneYearProvider = ref.watch(oneYearChartDataProvider);
    return oneYearProvider.when(
      data: (oneYearModelList) => CustomLineChartBody(
        title: '$formattedOneYearAgo ~ $formattedToday',
        minX: DateTimeData.firstQuarterFirstDay,
        maxX: DateTimeData.fourthQuarterLastDay,
        // 12개(12주) == 3달
        interval: 7 * 4 * 3,
        dataSource: oneYearModelList,
        xAxisLabelList: xAxisLabelList,
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
