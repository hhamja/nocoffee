import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomCircleCheckBoxTile extends StatefulWidget {
  final bool isChecked;
  final Function() onTap;
  final String content;
  final Widget? trailing;

  const CustomCircleCheckBoxTile({
    required this.isChecked,
    required this.onTap,
    required this.content,
    this.trailing,
    super.key,
  });

  @override
  State<CustomCircleCheckBoxTile> createState() =>
      _CustomCircleCheckBoxTileState();
}

class _CustomCircleCheckBoxTileState extends State<CustomCircleCheckBoxTile> {
  @override
  Widget build(BuildContext context) {
    const double circleSize = 23;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      onTap: widget.onTap,
      // 원형 체크박스
      leading: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.isChecked ? PRIMARY_COLOR : WHITE_COLOR,
          border: Border.all(
            color: GREY_COLOR,
          ),
        ),
        child: widget.isChecked
            ? const Icon(
                Icons.check,
                size: circleSize * 2 / 3,
                color: WHITE_COLOR,
              )
            : Container(),
      ),
      // 체크박스 항목의 텍스트
      title: Text(
        widget.content,
        style: TextStyle(
          fontSize: 18,
          height: 1.2,
        ),
      ),
      trailing: widget.trailing,
    );
  }
}
