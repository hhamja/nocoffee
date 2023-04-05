import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomOneButtonDialog extends StatelessWidget {
  final String content;
  final String completeText;

  const CustomOneButtonDialog({
    required this.content,
    required this.completeText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: WHITE_COLOR,
      buttonPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.fromLTRB(24, 21, 24, 0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      // 내용
      actionsPadding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
      content: Text(
        content,
        textAlign: TextAlign.left,
      ),
      contentTextStyle: const TextStyle(
        fontSize: 18,
        color: TEXT_COLOR,
        fontWeight: FontWeight.normal,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () async => context.router.pop(),
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Text(
                    completeText,
                    style: const TextStyle(
                      fontSize: 18,
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
