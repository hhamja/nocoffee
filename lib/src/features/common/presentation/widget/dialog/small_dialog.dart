import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_button/custom_outline_text_button.dart';

class CustomSmallDialog extends StatelessWidget {
  final String content;
  final String cancelText;
  final String completeText;
  final Function() cancelFun;
  final Function() completeFun;

  const CustomSmallDialog({
    required this.content,
    required this.cancelText,
    required this.completeText,
    required this.cancelFun,
    required this.completeFun,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: WHITE_COLOR,
      contentTextStyle: const TextStyle(
        fontSize: 18,
        color: TEXT_COLOR,
      ),
      buttonPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.fromLTRB(21, 34, 21, 0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 21, vertical: 0),
      // 내용
      actionsPadding: const EdgeInsets.symmetric(
        vertical: 34,
        horizontal: 21,
      ),
      content: Text(content),
      actions: [
        Row(
          children: [
            // 왼쪽버튼
            Flexible(
              flex: 1,
              child: CustomOutlineTextButton(
                w: MediaQuery.of(context).size.width,
                h: 45,
                content: cancelText,
                onPressed: cancelFun,
                color: GREY_COLOR,
              ),
            ),
            const SizedBox(width: 8),
            // 오른쪽버튼
            Flexible(
              flex: 1,
              child: CustomOutlineTextButton(
                w: MediaQuery.of(context).size.width,
                h: 45,
                content: completeText,
                onPressed: completeFun,
                color: PRIMARY_COLOR,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
