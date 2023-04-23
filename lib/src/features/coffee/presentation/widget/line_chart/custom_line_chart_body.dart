import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomLineChartBody extends StatelessWidget {
  final String title;
  final DateTime minX;
  final DateTime maxX;
  final double interval;
  final List<CoffeeDataModel> dataSource;
  final List<String> xAxisLabelList;

  const CustomLineChartBody({
    super.key,
    required this.title,
    required this.minX,
    required this.maxX,
    required this.interval,
    required this.dataSource,
    required this.xAxisLabelList,
  });

  @override
  Widget build(BuildContext context) {
    // max 커피 값
    final double maxCup = dataSource
        .map((model) => double.tryParse(model.coffeeCup) ?? 0)
        .reduce(max);
    // ex) maxCup = 11, maxY = 20
    final double maxY = (maxCup ~/ 10 + 1) * 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 34),
        Expanded(
          child: SfCartesianChart(
            margin: EdgeInsets.zero,
            // 오른쪽, 윗쪽 차트 border 설정
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeCategoryAxis(
              visibleMinimum: minX,
              visibleMaximum: maxX,
              minimum: minX,
              maximum: maxX,
              intervalType: DateTimeIntervalType.days,
              labelStyle: const TextStyle(
                color: Colors.transparent,
                height: 0.1,
              ),
              // dateFormat: DateFormat('M/d'),
              interval: interval,
              tickPosition: TickPosition.inside,
            ),
            primaryYAxis: NumericAxis(
              visibleMinimum: 0,
              visibleMaximum: maxY,
              labelsExtent: 30,
              tickPosition: TickPosition.inside,
              minimum: 0,
              maximum: maxY,
              labelFormat: '{value}',
              // interval: 1,
              rangePadding: ChartRangePadding.normal,
              // 몇구간으로 나눌지 결정하는 속성
              // ex) 4 -> y를 4개로 나누어 주세요
              desiredIntervals: 5,
              labelStyle: const TextStyle(
                fontSize: 14,
                color: DARK_GREY_COLOR,
                fontFamily: 'SpoqaHanSansNeo',
              ),
            ),

            tooltipBehavior: TooltipBehavior(
              enable: true,
              shouldAlwaysShow: true,
              // marker 클릭 시 나오는 창 커스텀
              builder: (data, point, series, pointIndex, seriesIndex) {
                final String date = DateFormat('yyyy/M/d').format(point.x);
                const TextStyle textStyle = TextStyle(
                  color: WHITE_COLOR,
                  fontSize: 16,
                );
                return Container(
                  width: 120,
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: TEXT_COLOR,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: textStyle,
                      ),
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
            series: <FastLineSeries<CoffeeDataModel, DateTime>>[
              FastLineSeries(
                emptyPointSettings:
                    EmptyPointSettings(mode: EmptyPointMode.drop),
                isVisible: true,
                color: PRIMARY_COLOR,
                dataSource: dataSource,
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
          padding: const EdgeInsets.only(left: 37),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: xAxisLabelList
                .map(
                  (e) => Expanded(
                      child: Text(e,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: e == xAxisLabelList.last
                                ? BLACK_COLOR
                                : GREY_COLOR,
                          ))),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
