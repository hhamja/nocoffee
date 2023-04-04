import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomOutlineTextButton extends StatelessWidget {
  final double w;
  final double h;
  final String content;
  final Function() onPressed;
  final Color color;

  const CustomOutlineTextButton({
    required this.w,
    required this.h,
    required this.content,
    required this.onPressed,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        border: Border.all(
          color: color,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
