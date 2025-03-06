import 'package:flutter/material.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/manager/recipe_detail_view_model.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/widgets/recipe_detail_instructions.dart';

import '../../../../core/utils/app_colors.dart';

class RecipeDetailIntstructionAll extends StatelessWidget {
  const RecipeDetailIntstructionAll({super.key, required this.vm});
  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      children: [
        RecipeDetailInstruction(vm: vm, id: 1, colors: AppColors.PinkSub),
        RecipeDetailInstruction(vm: vm, id: 2, colors: AppColors.Pink),
        RecipeDetailInstruction(vm: vm, id: 3, colors: AppColors.PinkSub),
        RecipeDetailInstruction(vm: vm, id: 4, colors: AppColors.Pink),
        RecipeDetailInstruction(vm: vm, id: 5, colors: AppColors.PinkSub),
        RecipeDetailInstruction(vm: vm, id: 6, colors: AppColors.Pink),
      ],
    );
  }
}
