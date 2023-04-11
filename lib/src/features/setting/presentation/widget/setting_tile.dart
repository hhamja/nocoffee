import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class SettingTile extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color? textColor;
  final Widget? trailing;

  const SettingTile({
    super.key,
    required this.onTap,
    required this.title,
    this.textColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: textColor ?? TEXT_COLOR,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right_sharp),
    );
  }
}
