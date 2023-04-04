import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/record/presentation/screen/calender_page/calender_page.dart';
import 'package:nocoffee/src/features/record/presentation/screen/home_record_page/home_record_page.dart';
import 'package:nocoffee/src/features/setting/presentation/screen/setting_page/setting_page.dart';
import 'package:nocoffee/src/features/statistics/presentation/screen/statistics_page/statistics_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int tabbarIndex = 0;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 4, vsync: this, animationDuration: Duration.zero);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      tabbarIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomeRecordPage(),
          CalenderPage(),
          StatisticsPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 선택 O 탭바 아이템 스타일
        selectedItemColor: PRIMARY_COLOR,
        // 선택 X 탭바 아이템 스타일
        unselectedItemColor: DARK_GREY_COLOR,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => controller.animateTo(index),
        backgroundColor: WHITE_COLOR,
        currentIndex: tabbarIndex,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pen),
            activeIcon: Icon(CupertinoIcons.pencil_circle_fill),
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            activeIcon: Icon(CupertinoIcons.calendar_today),
            label: '달력',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar),
            activeIcon: Icon(CupertinoIcons.chart_bar_fill),
            label: '통계',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            activeIcon: Icon(CupertinoIcons.gear_alt_fill),
            label: '설정',
          ),
        ],
      ),
    );
  }
}
