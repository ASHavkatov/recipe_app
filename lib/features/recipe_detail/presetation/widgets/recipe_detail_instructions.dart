import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/recipe_detail_view_model.dart';

class RecipeDetailInstruction extends StatelessWidget {
  const RecipeDetailInstruction({
    super.key,
    required this.vm, required this.id, required this.colors,
  });
  final int id;
  final Color colors;

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 81,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 23, bottom: 22, left: 10, right: 10),
        child: Text(
          vm.recipe.instructions
              .where((e) => e.order == id)
              .map((e) => e.text)
              .join(", "),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.MainColor,
          ),
        ),
      ),
    );
  }
}