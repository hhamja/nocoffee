import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomCalendarCell extends StatelessWidget {
  final DateTime day;
  final Color? daycColor;
  final String recordText;

  const CustomCalendarCell({
    super.key,
    required this.day,
    this.daycColor,
    required this.recordText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day.day.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: daycColor ?? TEXT_COLOR,
            ),
          ),
          recordText != ''
              ? Expanded(
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: PRIMARY_COLOR,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        recordText,
                        style: const TextStyle(
                          fontSize: 16,
                          color: WHITE_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
