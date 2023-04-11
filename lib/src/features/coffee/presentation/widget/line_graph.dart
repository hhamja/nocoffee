import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomLineGraph extends StatelessWidget {
  final double minY;
  final double maxY;
  // final Widget Function(double, TitleMeta)? getbottomTitlesWidget;
  final Widget Function(double, TitleMeta)? getLeftTitlesWidget;
  final List<FlSpot>? spotList;

  const CustomLineGraph({
    super.key,
    required this.minY,
    required this.maxY,
    // this.getbottomTitlesWidget,
    this.getLeftTitlesWidget,
    this.spotList,
  });
  @override
  Widget build(BuildContext context) {
    final DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final DateTime oneDaysAgo = today.subtract(const Duration(days: 1));
    final DateTime twoDaysAgo = today.subtract(const Duration(days: 2));
    final DateTime threeDaysAgo = today.subtract(const Duration(days: 3));
    final DateTime fourDaysAgo = today.subtract(const Duration(days: 4));
    final DateTime fiveDaysAgo = today.subtract(const Duration(days: 5));
    final DateTime sixDaysAgo = today.subtract(const Duration(days: 6));

    Widget getWeeksDayForValue(value) {
      if (value == today) {
        // 오늘
        print(today.weekday.toString());
        return Text(today.weekday.toString());
      } else if (value == oneDaysAgo) {
        // 1일 전
        print(oneDaysAgo.weekday.toString());
        return Text(oneDaysAgo.weekday.toString());
      } else if (value == twoDaysAgo) {
        // 2일 전
        print(twoDaysAgo.weekday.toString());
        return Text(twoDaysAgo.weekday.toString());
      } else if (value == threeDaysAgo) {
        // 3일 전
        print(threeDaysAgo.weekday.toString());
        return Text(threeDaysAgo.weekday.toString());
      } else if (value == fourDaysAgo) {
        // 4일 전
        print(fourDaysAgo.weekday.toString());
        return Text(fourDaysAgo.weekday.toString());
      } else if (value == fiveDaysAgo) {
        // 5일 전
        print(fiveDaysAgo.weekday.toString());
        return Text(fiveDaysAgo.weekday.toString());
      } else if (value == sixDaysAgo) {
        // 6일 전
        print(sixDaysAgo.weekday.toString());
        return Text(sixDaysAgo.weekday.toString());
      } else {
        // 그 외
        return const Text('');
      }
    }

    final double maxX = today.millisecondsSinceEpoch.toDouble();
    final double minX = sixDaysAgo.millisecondsSinceEpoch.toDouble();

    return LineChart(
      LineChartData(
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: LIGHT_GREY_COLOR,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: LIGHT_GREY_COLOR,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              //////
              interval: 1,
              reservedSize: 22,
              //////
              getTitlesWidget: (value, meta) {
                // 데이터의 값을 DateTime으로 바꾸기
                final DateTime valueDateTime =
                    DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return getWeeksDayForValue(valueDateTime);
              },
            ),
          ),
          // 왼쪽 축 설정
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 28,
              getTitlesWidget: getLeftTitlesWidget,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: LIGHT_GREY_COLOR, width: 1),
            right: BorderSide(color: LIGHT_GREY_COLOR, width: 1),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spotList,
            isCurved: false,
            color: PRIMARY_COLOR,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
