import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        "$title: $value",
        style: AppTextStyles.title20WhiteW500,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
