import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: context.screenHeight * 0.5,
        width: context.screenWidth,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
          color: Colors.white,
        ),
      ),
    );
  }
}
