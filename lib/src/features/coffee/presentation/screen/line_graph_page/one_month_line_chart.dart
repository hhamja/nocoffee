import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/custom_line_chart_body.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

class OneMonthLineChart extends ConsumerWidget {
  const OneMonthLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneMonthProvider = ref.watch(oneMonthChartDataProvider);
    final DateFormat xLabelformatter = DateFormat('M/d');
    final DateFormat titleFormatter = DateFormat('yyyy년 M월 d일');
    final String formattedOneMonthAgo =
        titleFormatter.format(DateTimeData.firstWeekFirstDay);
    final String formattedToday = titleFormatter.format(DateTimeData.today);

    final List<String> xAxisLabelList = [
      '${xLabelformatter.format(DateTimeData.firstWeekFirstDay)} - ${xLabelformatter.format(DateTimeData.firstWeekLastDay)}',
      '${xLabelformatter.format(DateTimeData.secondWeekFirstDay)} - ${xLabelformatter.format(DateTimeData.secondWeekLastDay)}',
      '${xLabelformatter.format(DateTimeData.thirdWeekFirstDay)} - ${xLabelformatter.format(DateTimeData.thirdWeekLastDay)}',
      '${xLabelformatter.format(DateTimeData.fourthWeekFirstDay)} - ${xLabelformatter.format(DateTimeData.fourthWeekLastDay)}',
    ];

    return oneMonthProvider.when(
      data: (oneMonthModelList) => CustomLineChartBody(
        title: '$formattedOneMonthAgo ~ $formattedToday',
        minX: DateTimeData.firstWeekFirstDay,
        maxX: DateTimeData.fourthWeekLastDay,
        interval: 7,
        dataSource: oneMonthModelList,
        xAxisLabelList: xAxisLabelList,
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
