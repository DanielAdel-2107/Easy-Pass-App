import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/home/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel, this.onTap,
  });
  final VoidCallback? onTap;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: context.screenHeight * 0.2,
        width: context.screenWidth * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            opacity: 0.85,
            colorFilter: const ColorFilter.mode(
              Colors.black38,
              BlendMode.darken,
            ),
            image: NetworkImage(categoryModel.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            categoryModel.title,
            style: AppTextStyles.title24WhiteW500,
          ),
        ),
      ),
    );
  }
}
