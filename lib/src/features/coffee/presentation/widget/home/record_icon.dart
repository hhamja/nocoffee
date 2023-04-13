import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class RecordIconButton extends StatelessWidget {
  final void Function()? onPressed;
  const RecordIconButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      icon: const Icon(
        CupertinoIcons.pen,
        color: TEXT_COLOR,
        size: 25,
      ),
      onPressed: onPressed,
    );
  }
}
