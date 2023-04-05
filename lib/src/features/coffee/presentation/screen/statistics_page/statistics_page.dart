import 'package:flutter/material.dart';
import 'package:nocoffee/src/features/common/presentation/widget/default_layout/default_layout.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: Text('통계'),
      actions: [],
      body: Text('통계 페이지'),
    );
  }
}
