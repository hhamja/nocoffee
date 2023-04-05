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
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;

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
    this.textInputAction,
    required this.keyboardType,
    required this.textAlign,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
    
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
      
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLine,
      showCursor: true,
      controller: widget.controller,
      maxLength: widget.maxLength,
      textAlignVertical: TextAlignVertical.center,
      textAlign: widget.textAlign,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
