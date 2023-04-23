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
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: recordText == '' ? LIGHT_GREY_COLOR : TEXT_COLOR,
            ),
          ),
          const SizedBox(height: 5),
          recordText != ''
              ? Text(
                  '+$recordText',
                  style: const TextStyle(
                    fontSize: 16,
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.w500,
                  ),
                  //   ),
                  // ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
