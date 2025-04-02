import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../followers_and_following/wifgets/recipe_text_form_field.dart';
import '../../../followers_and_following/wifgets/three_dots_button.dart';
import 'create_recipe_delete_button.dart';

class CreateRecipeIngredient extends StatelessWidget {
  const CreateRecipeIngredient({super.key,required this.amountController,required this.ingredientController});

  final TextEditingController amountController;
  final TextEditingController ingredientController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 51,
      child: Row(
        spacing: 7.w,
        children: [
          ThreeDotsButton(callback: (){},),
          RecipeTextFormField(
            text: "Amt",
            textController: amountController,
            size: Size(70.w, 41.h),
            isNum: true,
          ),
          RecipeTextFormField(
            text: "Ingredient...",
            textController: ingredientController,
            size: Size(224.w, 41.h),
          ),
          CreateRecipeDeleteButton(callback: (){}),
        ],
      ),
    );
  }
}
