import 'package:flutter/material.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class HomeTextBox extends StatelessWidget {
  final String title;
  final String? content;
  final Widget textFormField;

  const HomeTextBox({
    super.key,
    required this.title,
    required this.content,
    required this.textFormField,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return GestureDetector(
      onTap: () async => focusNode.requestFocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
        decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(child: textFormField),
                const SizedBox(width: 8.0),
                content != null
                    ? Text(
                        content!,
                        style: const TextStyle(
                          fontSize: 20.0,
                          height: 1.5,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
