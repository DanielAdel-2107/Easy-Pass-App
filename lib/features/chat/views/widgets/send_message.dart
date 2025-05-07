import 'package:easy_pass/core/components/custom_icon_button.dart';
import 'package:easy_pass/core/components/custom_text_form_field.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
    required this.onPressed,
    required this.controller,
  });

  final Function()? onPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.02,
          vertical: context.screenHeight * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              fillColor: Colors.black87,
              controller: controller,
              hintText: "enter your message",
              suffixIcon: CustomIconButton(
                icon: Icons.send,
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
