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

class OneWeekLineChart extends ConsumerWidget {
  const OneWeekLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneWeekProvider = ref.watch(oneWeekChartDataProvider);
    final String formattedToday =
        DateFormat('yyyy년 M월 d일').format(DateTimeData.today);
    final String formattedSevenDayAgo =
        DateFormat('yyyy년 M월 d일').format(DateTimeData.sixDayAgo);
    return oneWeekProvider.when(
      data: (oneWeekModelList) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$formattedSevenDayAgo ~ $formattedToday',
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
                visibleMaximum: DateTimeData.today,
                visibleMinimum: DateTimeData.sixDayAgo,
                maximum: DateTimeData.today,
                minimum: DateTimeData.sixDayAgo,
                intervalType: DateTimeIntervalType.days,
                dateFormat: DateFormat('E', 'ko'),
                interval: 1,
                tickPosition: TickPosition.inside,
                labelAlignment: LabelAlignment.center,
                labelStyle: const TextStyle(
                    fontSize: 14,
                    color: DARK_GREY_COLOR,
                    fontFamily: 'SpoqaHanSansNeo'),
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
                  dataSource: oneWeekModelList,
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
        ],
      ),
      error: (error, stackTrace) => const CustomErrorData(),
      loading: () => const CustomCircularLoading(),
    );
  }
}
