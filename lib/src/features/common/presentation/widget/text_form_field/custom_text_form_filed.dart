import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final int? maxLine;
  final int? maxLength;

  const CustomTextFormField({
    required this.controller,
    this.labelText,
    this.hintText,
    this.onFieldSubmitted,
    this.focusNode,
    this.onTap,
    super.key,
    this.onChanged,
    this.maxLine,
    this.maxLength,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      focusNode: widget.focusNode,
      cursorColor: Colors.blue,
      style: const TextStyle(
        fontSize: 20,
        height: 1.5,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: widget.hintText,
        fillColor: WHITE_COLOR,
        hintStyle: const TextStyle(
          fontSize: 20,
          height: 1.5,
          color: GREY_COLOR,
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 12,
          color: TEXT_COLOR,
        ),
        counterText: '',
        border: InputBorder.none,
      ),
      autocorrect: false,
      textInputAction: TextInputAction.done,
      maxLines: widget.maxLine,
      showCursor: true,
      controller: widget.controller,
      maxLength: widget.maxLength,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
