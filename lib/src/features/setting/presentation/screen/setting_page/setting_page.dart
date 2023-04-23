import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/config/router/app_router.gr.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/common/presentation/widget/dialog/small_dialog.dart';
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
            title: '이용약관',
          ),
          SettingTile(
            onTap: () async =>
                context.router.push(const PrivacyPolicyDetailRoute()),
            title: '개인정보 처리방침',
          ),
          const SizedBox(height: 55),
          Consumer(
            builder: (context, ref, child) => SettingTile(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => CustomSmallDialog(
                    content: '모든 데이터가 삭제돼요.\n정말 삭제할까요?',
                    cancelText: '아니요.',
                    completeText: '삭제할래요.',
                    completeColor: Colors.red,
                    cancelFun: () async => context.router.pop(),
                    completeFun: () async => await ref
                        .read(coffeeRepositoryProvider)
                        .removeCoffeeBox()
                        .then((_) => context.router.pop()),
                  ),
                );
              },
              title: '모든 데이터 삭제',
              textColor: Colors.red,
              trailing: const Icon(CupertinoIcons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
