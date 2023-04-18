import 'package:flutter/material.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/one_month_line_chart.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/one_week_line_chart.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/tab_bar.dart';
import 'package:nocoffee/src/features/common/presentation/widget/default_layout/default_layout.dart';

class LineGraphPage extends StatefulWidget {
  const LineGraphPage({super.key});

  @override
  State<LineGraphPage> createState() => _LineGraphPageState();
}

class _LineGraphPageState extends State<LineGraphPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: const Text('차트'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineChartTabbar(controller: _tabController),
          const SizedBox(height: 34),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const <Widget>[
                OneWeekLineChart(),
                OneMonthLineChart(),
                OneWeekLineChart(),
                OneWeekLineChart(),
                OneWeekLineChart(),
                // OneMonthLineChart(coffeModelList: coffeeModelList),
                // ThreeMonthLineChart(coffeModelList: coffeeModelList),
                // SixMonthLineChart(coffeModelList: coffeeModelList),
                // OneYearLineChart(coffeModelList: coffeeModelList)
              ],
            ),
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
