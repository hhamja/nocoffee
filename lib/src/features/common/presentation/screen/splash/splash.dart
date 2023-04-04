// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/config/router/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void routerInitialPage() async {
      // 앱을 처음 키는지 확인하는 변수 받기
      final prefs = await SharedPreferences.getInstance();
      // isfirstOpenApp ? 앱을 처음키는게 아닌 경우 : 앱을 처음 키는 경우
      final bool isfirstOpenApp = prefs.getBool('isfirstOpenApp') ?? true;
      // 첫 화면 설정
      if (isfirstOpenApp) {
        // 설치 후 처음 실행
        // 앱 권한 사용 안내 페이지로 이동
        context.router.replace(const TermsPolicyAgreementRoute());
      } else {
        context.router.replace(const TabbarRoute());
      }
    }

    Timer(const Duration(seconds: 1), routerInitialPage);

    return WillPopScope(
      // 해당 위젯은 취소키 방지 역할
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: WHITE_COLOR,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  Image.asset(
                    'assets/app_icon/petpick.png',
                    width: 150,
                    height: 350,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
