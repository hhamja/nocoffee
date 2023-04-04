import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class AppTextStyle {
  // 반응형 앱을 위해 폰트사이즈 sp로 설정
  static TextTheme textTheme = const TextTheme(
    // 헤드라인
    // headlineLarge: TextStyle(
    //   // 32-40
    //   fontSize: 24.sp,
    //   color: appBlackColor,
    //   fontFamily: 'NotoSansCJKkr',
    // ),
    // headlineMedium: TextStyle(
    //   // 28-36
    //   fontSize: 22.sp,
    //   color: appBlackColor,
    //   fontFamily: 'NotoSansCJKkr',
    // ),
    headlineSmall: TextStyle(
      // 24-32
      fontSize: 26,
      color: TEXT_COLOR,
    ),

    // 제목
    titleLarge: TextStyle(
      // 22-28
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: TEXT_COLOR,
    ),
    titleMedium: TextStyle(
      // 16-24
      fontSize: 21,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w500,
      color: TEXT_COLOR,
    ),
    titleSmall: TextStyle(
      // 14-20
      fontSize: 18,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      color: TEXT_COLOR,
    ),

    // 본문
    bodyLarge: TextStyle(
      // 16-24
      fontSize: 21,
      letterSpacing: 0.5,
      fontWeight: FontWeight.normal,
      color: TEXT_COLOR,
    ),
    bodyMedium: TextStyle(
      // 14-20
      fontSize: 18,
      letterSpacing: 0.25,
      color: TEXT_COLOR,
    ),
    bodySmall: TextStyle(
      // 12-16
      fontSize: 16,
      letterSpacing: 0.4,
      color: TEXT_COLOR,
    ),

    // 본문보다 100 두꺼운 w500 라벨택스트
    labelLarge: TextStyle(
      // 14-20
      fontSize: 18,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      color: TEXT_COLOR,
    ),
    labelMedium: TextStyle(
      // 12-16
      fontSize: 16,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: TEXT_COLOR,
    ),
    labelSmall: TextStyle(
      // 11-16
      fontSize: 14,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: TEXT_COLOR,
    ),
  );

  // 버튼 텍스트 스타일 지정
  static const fullButtonTextStyle = TextStyle(
    // 14-20
    fontSize: 18,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
    color: TEXT_COLOR,
  );

  // 스낵바 제목
  static const snackbarTitleStyle = TextStyle(
    // 16-24
    fontSize: 21,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
    color: TEXT_COLOR,
    fontFamily: 'NotoSansCJKkr',
  );
  // 스낵바 내용
  static const snackbarContentStyle = TextStyle(
    // 12-16
    fontSize: 16,
    letterSpacing: 0.4,
    color: TEXT_COLOR,
  );
}
