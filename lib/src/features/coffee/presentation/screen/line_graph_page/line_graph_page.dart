import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/features/common/presentation/widget/default_layout/default_layout.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGraphPage extends ConsumerStatefulWidget {
  const LineGraphPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LineGraphPageState();
}

class _LineGraphPageState extends ConsumerState<LineGraphPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: const Text('통계'),
      body: Container(),
    );
  }
}
