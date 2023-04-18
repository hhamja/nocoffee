import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_form_field/custom_text_form_filed.dart';

class HomeListTile extends StatelessWidget {
  final String title;
  final String unit;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  const HomeListTile({
    super.key,
    required this.title,
    required this.unit,
    required this.controller,
    required this.maxLength,
    this.inputFormatters,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        title,
        style: const TextStyle(fontSize: 21),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: SizedBox()),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: GREY_COLOR,
                  width: 1.0,
                ),
              ),
            ),
            width: 100,
            height: 45,
            child: CustomTextFormField(
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              controller: controller,
              maxLine: 1,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
            ),
          ),
          Text(
            unit,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
      // trailing:
    );
  }
}
