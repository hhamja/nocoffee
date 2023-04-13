import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_form_field/custom_text_form_filed.dart';

class HomeTextFieldBox extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  final void Function(String)? onChanged;
  final String hintText;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final int? maxLine;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final double itemHeightSpace;
  final Widget unitWidget;
  final FocusNode? focusNode;
  final void Function()? boxOntTap;

  const HomeTextFieldBox({
    super.key,
    required this.title,
    required this.textController,
    this.onChanged,
    required this.hintText,
    required this.textAlign,
    required this.textInputAction,
    this.maxLine,
    required this.maxLength,
    required this.keyboardType,
    this.inputFormatters,
    required this.itemHeightSpace,
    required this.unitWidget,
    this.focusNode,
    this.boxOntTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: boxOntTap,
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
            SizedBox(height: itemHeightSpace),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextFormField(
                    focusNode: focusNode,
                    inputFormatters: inputFormatters,
                    onChanged: onChanged,
                    hintText: hintText,
                    textAlign: textAlign,
                    textInputAction: textInputAction,
                    keyboardType: keyboardType,
                    controller: textController,
                    maxLine: maxLine,
                    maxLength: maxLength,
                  ),
                ),
                const SizedBox(width: 3.0),
                unitWidget,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
