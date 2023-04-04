import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/router/app_router.gr.dart';
import 'package:nocoffee/src/features/setting/presentation/widget/setting_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(
        children: [
          SettingTile(
            onTap: () async => context.router.push(const AppNoticeRoute()),
            title: '공지사항',
          ),
          SettingTile(
              onTap: () async => context.router.push(
                    const TermsDetailRoute(),
                  ),
              title: '이용약관'),
          SettingTile(
              onTap: () async =>
                  context.router.push(const PrivacyPolicyDetailRoute()),
              title: '개인정보 처리방침'),
        ],
      ),
    );
  }
}
