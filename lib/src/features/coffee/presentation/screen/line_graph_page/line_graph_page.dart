import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/line_chart_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/one_month_line_chart.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/one_year_line_chart.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/seven_day_line_chart.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/six_month_line_chart.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/tab_bar.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/line_chart/three_month_line_chart.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';

class LineGraphPage extends ConsumerStatefulWidget {
  const LineGraphPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LineGraphPageState();
}

class _LineGraphPageState extends ConsumerState<LineGraphPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coffeeModelList = ref.watch(lineChartCoffeeDataProvider);
    return DefaultLayout(
      title: const Text('차트'),
      body: coffeeModelList.when(
        data: (coffeeModelList) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LineChartTabbar(controller: _tabController),
            const SizedBox(height: 21),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  SevenDayLineChart(coffeModelList: coffeeModelList),
                  OneMonthLineChart(coffeModelList: coffeeModelList),
                  ThreeMonthLineChart(coffeModelList: coffeeModelList),
                  SixMonthLineChart(coffeModelList: coffeeModelList),
                  OneYearLineChart(coffeModelList: coffeeModelList)
                ],
              ),
            ),
            const SizedBox(height: 21),
          ],
        ),
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
      ),
    );
  }
}
