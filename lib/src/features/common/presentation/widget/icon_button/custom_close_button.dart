import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      icon: const Icon(
        CupertinoIcons.clear,
        color: TEXT_COLOR,
        size: 22,
      ),
      onPressed: () async => context.router.pop(),
    );
  }
}
