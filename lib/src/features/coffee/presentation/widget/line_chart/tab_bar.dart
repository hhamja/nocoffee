import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class LineChartTabbar extends StatelessWidget {
  final TabController? controller;
  const LineChartTabbar({super.key, this.controller});
  final List<Widget> _tabs = const [
    Tab(text: '7일'),
    Tab(text: '1개월'),
    Tab(text: '3개월'),
    Tab(text: '6개월'),
    Tab(text: '1년'),
  ];
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      indicatorColor: BLACK_COLOR,
      labelColor: TEXT_COLOR,
      unselectedLabelColor: TEXT_COLOR,
      overlayColor: null,
      labelStyle: const TextStyle(fontSize: 16),
      unselectedLabelStyle: const TextStyle(fontSize: 16),
      isScrollable: false,
      indicatorWeight: 2,
      controller: controller,
      tabs: _tabs,
    );
  }
}
