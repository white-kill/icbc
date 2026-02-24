import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 简洁的文本输入框组件
/// 无边框，可自定义样式
class CleanTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;

  const CleanTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onSubmitted,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textAlign: textAlign,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: enabled,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      style: textStyle ?? TextStyle(fontSize: 14.sp, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(fontSize: 14.sp, color: const Color(0xff999999)),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: contentPadding ?? EdgeInsets.zero,
        isDense: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: maxLength != null ? '' : null,
      ),
    );
  }
}

