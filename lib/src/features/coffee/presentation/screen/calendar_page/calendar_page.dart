import 'package:flutter/material.dart';
import 'package:nocoffee/src/features/common/presentation/widget/default_layout/default_layout.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: Text('커피 달력'),
      leading: null,
      actions: [],
      body: Text('캘린더 페이지'),
    );
  }
}
