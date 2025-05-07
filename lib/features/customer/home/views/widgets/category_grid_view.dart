import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/home/models/category_model.dart';
import 'package:easy_pass/features/customer/home/view_models/cubit/get_all_tickets_cubit.dart';
import 'package:easy_pass/features/customer/home/views/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.categoriesList,
  });
  final List<CategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => CategoryCard(
          categoryModel: categoriesList[index],
          onTap: () {
            context.pushScreen(
              RouteNames.selectCategoryScreen,
              arguments: context
                  .read<GetAllTicketsCubit>()
                  .selectCategory(categoriesList[index].title).map((e) => e.toJson())
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
