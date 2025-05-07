import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownButtonFormField extends StatelessWidget {
  const CustomDropDownButtonFormField({
    super.key,
    required this.userRoles,
    this.controller,
    this.hintText,
    this.title,
  });

  final List<String> userRoles;
  final TextEditingController? controller;
  final String? hintText;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        SizedBox(height: context.screenHeight * 0.003),
        DropdownButtonFormField<String>(
          items: userRoles
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            if (controller != null) {
              controller!.text = value.toString();
            }
          },
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          dropdownColor: Colors.black45,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText ?? "Select Your Role",
            hintStyle: AppTextStyles.title16White500, 
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
