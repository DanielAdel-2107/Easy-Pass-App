import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class DecorativeEdges extends StatelessWidget {
  const DecorativeEdges({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: context.screenHeight * 0.305,
          left: -context.screenWidth * 0.09,
          child: CircleAvatar(
            radius: context.screenWidth * 0.09,
            backgroundColor: AppColors.kPrimaryColor,
          ),
        ),
        Positioned(
          top: context.screenHeight * 0.305,
          right: -context.screenWidth * 0.09,
          child: CircleAvatar(
            radius: context.screenWidth * 0.09,
            backgroundColor: AppColors.kPrimaryColor,
          ),
        ),
        Positioned(
          top: context.screenHeight * 0.35,
          left: 0,
          right: 0,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.09,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    (constraints.maxWidth / 10).floor(),
                    (index) => Container(
                      width: 5,
                      height: 1.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

