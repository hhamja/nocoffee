// import 'dart:math';

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:nocoffee/src/config/constant/app_color.dart';
// import 'package:nocoffee/src/config/date/date_time_data.dart';
// import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
// import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
// import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

// class OneWeekLineChart extends ConsumerWidget {
//   const OneWeekLineChart({super.key});

//   final TextStyle titleTextStyle = const TextStyle(
//     fontSize: 14,
//     color: GREY_COLOR,
//     fontWeight: FontWeight.w500,
//   );

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final oneWeekProvider = ref.watch(oneWeekChartDataProvider);
//     final DateFormat dayOfWeekFormat = DateFormat.E('ko');
//     final DateFormat yearMonthDayFormat = DateFormat('yyyy년 M월 d일');
//     final String formattedToday = yearMonthDayFormat.format(DateTimeData.today);
//     final String formattedSixDayAgo =
//         yearMonthDayFormat.format(DateTimeData.sixDayAgo);
//     double? maxCup;
//     double? horizontalInterval;

//     return oneWeekProvider.when(
//       data: (oneWeekModelList) {
//         // String cup을 double로 변환
//         final List<double> cupList = oneWeekModelList
//             .where((model) => model.coffeeCup.isNotEmpty)
//             .map((model) => double.tryParse(model.coffeeCup)!)
//             .toList();
//         if (!cupList.contains(null)) {
//           // 숫자 올림 ex) 11 -> 20
//           final int cupNumRoundUp = ((cupList.reduce(max) ~/ 10) + 1) * 10;
//           maxCup = cupNumRoundUp.toDouble();
//           horizontalInterval = (cupNumRoundUp / 5).toDouble();
//         }

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '$formattedSixDayAgo ~ $formattedToday',
//               textAlign: TextAlign.start,
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 34),
//             Expanded(
//               child: LineChart(
//                 LineChartData(
//                   minX: 0,
//                   maxX: 14,
//                   minY: 0,
//                   maxY: maxCup,
//                   // 점 클릭 시
//                   lineTouchData: LineTouchData(
//                     enabled: true,
//                     handleBuiltInTouches: true,
//                     // mouseCursorResolver: (flTouchEvent, lineTouchResponse) =>
//                     touchTooltipData: LineTouchTooltipData(
//                       tooltipBgColor: WHITE_COLOR,
//                       getTooltipItems: (touchedSpots) => [
//                         LineTooltipItem('d', TextStyle()),
//                       ],
//                     ),
//                   ),
//                   gridData: FlGridData(
//                     show: true,
//                     drawVerticalLine: true,
//                     horizontalInterval: horizontalInterval,
//                     verticalInterval: 2,
//                     getDrawingHorizontalLine: (value) {
//                       return FlLine(
//                         color: Colors.grey[100],
//                         strokeWidth: 2,
//                       );
//                     },
//                     getDrawingVerticalLine: (value) {
//                       return FlLine(
//                         color: Colors.grey[100],
//                         strokeWidth: 2,
//                       );
//                     },
//                   ),
//                   titlesData: FlTitlesData(
//                     rightTitles:
//                         AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                     topTitles:
//                         AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         interval: 1,
//                         getTitlesWidget: (value, meta) {
//                           switch (value.toInt()) {
//                             case 1:
//                               // 6일 전
//                               return Text(
//                                 dayOfWeekFormat.format(DateTimeData.sixDayAgo),
//                                 style: titleTextStyle,
//                               );
//                             case 3:
//                               // 5일 전
//                               return Text(
//                                 dayOfWeekFormat.format(DateTimeData.fiveayAgo),
//                                 style: titleTextStyle,
//                               );
//                             case 5:
//                               // 4일 전
//                               return Text(
//                                 dayOfWeekFormat.format(DateTimeData.fourDayAgo),
//                                 style: titleTextStyle,
//                               );
//                             case 7:
//                               // 3일 전
//                               return Text(
//                                 dayOfWeekFormat
//                                     .format(DateTimeData.threeDayAgo),
//                                 style: titleTextStyle,
//                               );
//                             case 9:
//                               // 2일 전
//                               return Text(
//                                 dayOfWeekFormat.format(DateTimeData.twoDayAgo),
//                                 style: titleTextStyle,
//                               );
//                             case 11:
//                               // 1일 전
//                               return Text(
//                                 dayOfWeekFormat.format(DateTimeData.oneDayAgo),
//                                 style: titleTextStyle,
//                               );
//                             case 13:
//                               // 오늘
//                               return Text(
//                                 dayOfWeekFormat.format(DateTimeData.today),
//                                 style: titleTextStyle,
//                               );
//                           }
//                           return Container();
//                         },
//                       ),
//                     ),
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         interval: horizontalInterval,
//                         getTitlesWidget: (value, meta) => Text(
//                           value.toInt().toString(),
//                           textAlign: TextAlign.center,
//                           style: titleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Colors.grey[100]!,
//                         width: 2,
//                       ),
//                       left: BorderSide(
//                         color: Colors.grey[100]!,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: oneWeekModelList.map((model) {
//                         final date = model.date;
//                         final daysDiff =
//                             DateTimeData.today.difference(date).inDays;
//                         final double xValue = (daysDiff == 0)
//                             ? 13
//                             : (daysDiff == 1)
//                                 ? 11
//                                 : (daysDiff == 2)
//                                     ? 9
//                                     : (daysDiff == 3)
//                                         ? 7
//                                         : (daysDiff == 4)
//                                             ? 5
//                                             : (daysDiff == 5)
//                                                 ? 3
//                                                 : 1;
//                         if (model.coffeeCup.isNotEmpty) {}
//                         return FlSpot(
//                             xValue,
//                             model.coffeeCup.isNotEmpty
//                                 ? double.parse(model.coffeeCup)
//                                 : null);
//                       }).toList(),
//                       isCurved: false,
//                       barWidth: 1,
//                       color: PRIMARY_COLOR,
//                       dotData: FlDotData(
//                         show: true,
//                         getDotPainter: (spot, percent, barData, index) =>
//                             FlDotCirclePainter(
//                           color: WHITE_COLOR,
//                           strokeWidth: 2,
//                           radius: 3,
//                           strokeColor: PRIMARY_COLOR,
//                         ),
//                       ),
//                       belowBarData: BarAreaData(
//                           show: false,
//                           spotsLine: BarAreaSpotsLine(show: false)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//       error: (error, stackTrace) => const CustomErrorData(),
//       loading: () => const CustomCircularLoading(),
//     );
//   }
// }
