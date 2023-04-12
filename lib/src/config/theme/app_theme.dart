import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class AppThemeData {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: WHITE_COLOR,
    // primaryColor: PRIMARY_COLOR,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    // 게시글 추가하는 +버튼
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: PRIMARY_COLOR,
    ),

    // 앱바
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: TEXT_COLOR,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      toolbarTextStyle: TextStyle(
        color: TEXT_COLOR,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      backgroundColor: WHITE_COLOR,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: TEXT_COLOR,
        size: 26,
      ),
      actionsIconTheme: IconThemeData(
        color: TEXT_COLOR,
        size: 26,
      ),
    ),
    // 바텀시트
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: WHITE_COLOR,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: WHITE_COLOR,
      elevation: 0,
    ),
    // 앱 기본 폰트
    fontFamily: 'SpoqaHanSansNeo',
  );
}
