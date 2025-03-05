import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/recipe_detail_view_model.dart';

class RecipeDetailIngredients extends StatelessWidget {
  const RecipeDetailIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: TextStyle(
            color: AppColors.ReddishPink,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: vm.recipe.ingredients.map(
                (e) => Row(
              children: [
                Text(
                  "●",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "${e.amount}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  "${e.name}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ).toList(),
        ),
      ],
    );
  }
}