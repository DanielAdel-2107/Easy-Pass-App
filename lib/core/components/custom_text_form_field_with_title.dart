import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWithTitle extends StatefulWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.hintText,
     this.title,
    this.isPassword = false,
    this.controller,
    this.enableValidator = true, this.maxLines = 1,
  });
  final String hintText;
  final String? title;
  final bool isPassword, enableValidator;
  final TextEditingController? controller;
  final int maxLines;
  @override
  State<CustomTextFormFieldWithTitle> createState() =>
      _CustomTextFormFieldWithTitleState();
}

class _CustomTextFormFieldWithTitleState
    extends State<CustomTextFormFieldWithTitle> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       widget.title== null?SizedBox():  Text(
          widget.title!,
          style: AppTextStyles.title18WhiteW500,
        ),
        SizedBox(height: context.screenHeight * 0.003),
        TextFormField(
          style: AppTextStyles.title18White,
          controller: widget.controller,
          validator: widget.enableValidator
              ? (value) =>
                  value!.isEmpty ? "Field ${widget.title} is required" : null
              : null,
          obscureText: widget.isPassword ? isPassword : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.title16Grey,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          maxLines: widget.maxLines,
        )
      ],
    );
  }
}
