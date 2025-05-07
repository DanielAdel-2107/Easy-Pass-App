import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.maxline = 1,
      this.fillColor,
      this.onChanged});
  final int maxline;
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: AppTextStyles.title18White,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: AppTextStyles.title18White,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: fillColor ?? Colors.white,
          ),
          maxLines: maxline,
        )
      ],
    );
  }
}
