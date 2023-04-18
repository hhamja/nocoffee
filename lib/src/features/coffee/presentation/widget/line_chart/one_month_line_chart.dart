import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/config/date/date_time_data.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OneMonthLineChart extends ConsumerWidget {
  const OneMonthLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneMonthProvider = ref.watch(oneMonthChartDataProvider);
    final DateFormat formatter = DateFormat('M/d');
    final String formattedOneMonthAgo =
        DateFormat('yyyy년 M월 d일').format(DateTimeData.firstWeekFirstDay);
    final String formattedToday =
        DateFormat('yyyy년 M월 d일').format(DateTimeData.fourthWeekLastDay);
    final String firstWeekFirstDay =
        formatter.format(DateTimeData.firstWeekFirstDay);
    final String firstWeekLastDay =
        formatter.format(DateTimeData.firstWeekLastDay);
    final String secondWeekFirstDay =
        formatter.format(DateTimeData.secondWeekFirstDay);
    final String secondWeekLastDay =
        formatter.format(DateTimeData.secondWeekLastDay);
    final String thirdWeekFirstDay =
        formatter.format(DateTimeData.thirdWeekFirstDay);
    final String thirdWeekLastDay =
        formatter.format(DateTimeData.thirdWeekLastDay);
    final String fourthWeekFirstDay =
        formatter.format(DateTimeData.fourthWeekFirstDay);
    final String fourthWeekLastDay =
        formatter.format(DateTimeData.fourthWeekLastDay);

    return oneMonthProvider.when(
      data: (oneMonthModelList) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$formattedOneMonthAgo ~ $formattedToday',
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 21),
          Expanded(
            child: SfCartesianChart(
              margin: EdgeInsets.zero,
              // 오른쪽, 윗쪽 차트 border 설정
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeCategoryAxis(
                visibleMinimum: DateTimeData.firstWeekFirstDay,
                visibleMaximum: DateTimeData.fourthWeekLastDay,
                // 4주 전
                minimum: DateTimeData.firstWeekFirstDay,
                // 오늘
                maximum: DateTimeData.fourthWeekLastDay,
                intervalType: DateTimeIntervalType.days,
                labelStyle:
                    const TextStyle(color: Colors.transparent, height: 0.1),
                dateFormat: DateFormat('M/d'),
                // 7일 간격
                interval: 7,
                tickPosition: TickPosition.inside,
                // labelPlacement: LabelPlacement.betweenTicks,
              ),
              primaryYAxis: NumericAxis(
                  visibleMinimum: 0,
                  // visibleMaximum: 100,
                  tickPosition: TickPosition.inside,
                  minimum: 0,
                  // maximum: 100,
                  labelFormat: '{value}잔',
                  interval: 10,
                  labelStyle: const TextStyle(
                      fontSize: 14,
                      color: DARK_GREY_COLOR,
                      fontFamily: 'SpoqaHanSansNeo')),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                shouldAlwaysShow: true,
                // marker 클릭 시 나오는 창 커스텀
                builder: (data, point, series, pointIndex, seriesIndex) {
                  final String date = DateFormat('yyyy/M/d').format(point.x);
                  const TextStyle textStyle =
                      TextStyle(color: WHITE_COLOR, fontSize: 16);

                  return Container(
                    width: 120,
                    height: 80,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: TEXT_COLOR,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(date, style: textStyle),
                        const SizedBox(height: 5),
                        Text(
                          '커피 : ${point.yValue.toString()}잔',
                          style: textStyle,
                        ),
                      ],
                    ),
                    // ],
                  );
                },
                color: WHITE_COLOR,
                borderColor: PRIMARY_COLOR,
                tooltipPosition: TooltipPosition.pointer,
                activationMode: ActivationMode.singleTap,
              ),

              series: <LineSeries<CoffeeDataModel, DateTime>>[
                LineSeries(
                  emptyPointSettings:
                      EmptyPointSettings(mode: EmptyPointMode.drop),
                  isVisible: true,
                  color: PRIMARY_COLOR,

                  dataSource: oneMonthModelList,
                  xValueMapper: (model, _) => model.date,
                  yValueMapper: (model, _) =>
                      model.coffeeCup != '' ? int.parse(model.coffeeCup) : null,
                  // 데이터 점 설정
                  markerSettings: const MarkerSettings(isVisible: true),
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('$firstWeekFirstDay - $firstWeekLastDay',
                    style: const TextStyle(color: DARK_GREY_COLOR)),
                Text('$secondWeekFirstDay - $secondWeekLastDay',
                    style: const TextStyle(color: DARK_GREY_COLOR)),
                Text('$thirdWeekFirstDay - $thirdWeekLastDay',
                    style: const TextStyle(color: DARK_GREY_COLOR)),
                Text('$fourthWeekFirstDay - $fourthWeekLastDay',
                    style: const TextStyle(color: DARK_GREY_COLOR)),
              ],
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
