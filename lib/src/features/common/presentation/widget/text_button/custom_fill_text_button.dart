import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomFilledTextButton extends StatelessWidget {
  final double? w;
  final double? h;
  final String content;
  final Function()? onPressed;
  final Color? backgroundColor;

  const CustomFilledTextButton({
    required this.w,
    required this.h,
    required this.content,
    required this.onPressed,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: WHITE_COLOR,
          ),
        ),
      ),
    );
  }
}
