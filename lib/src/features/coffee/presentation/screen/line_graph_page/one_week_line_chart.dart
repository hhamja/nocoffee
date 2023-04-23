import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/custom_line_chart_body.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

class OneWeekLineChart extends ConsumerWidget {
  const OneWeekLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneWeekProvider = ref.watch(oneWeekChartDataProvider);
    final DateFormat xLabelFormatter = DateFormat.E('ko');
    final DateFormat titleFormatter = DateFormat('yyyy년 M월 d일');
    final String formattedToday = titleFormatter.format(DateTimeData.today);
    final String formattedOneWeekAgo =
        titleFormatter.format(DateTimeData.sixDayAgo);

    final List<String> xAxisLabelList = [
      xLabelFormatter.format(DateTimeData.sixDayAgo),
      xLabelFormatter.format(DateTimeData.fiveDayAgo),
      xLabelFormatter.format(DateTimeData.fourDayAgo),
      xLabelFormatter.format(DateTimeData.threeDayAgo),
      xLabelFormatter.format(DateTimeData.twoDayAgo),
      xLabelFormatter.format(DateTimeData.oneDayAgo),
      xLabelFormatter.format(DateTimeData.today),
    ];

    return oneWeekProvider.when(
      data: (oneWeekModelList) => CustomLineChartBody(
        title: '$formattedOneWeekAgo ~ $formattedToday',
        minX: DateTimeData.sixDayAgo,
        maxX: DateTimeData.today,
        interval: 1,
        dataSource: oneWeekModelList,
        xAxisLabelList: xAxisLabelList,
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
