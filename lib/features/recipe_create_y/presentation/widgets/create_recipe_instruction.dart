import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../followers_and_following/wifgets/recipe_text_form_field.dart';
import '../../../followers_and_following/wifgets/three_dots_button.dart';
import 'create_recipe_delete_button.dart';

class CreateRecipeInstruction extends StatelessWidget {
  const CreateRecipeInstruction({super.key,required this.instructionController});

  final TextEditingController instructionController;
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
            text: "Instruction 1",
            textController: instructionController,
            size: Size(301.w, 52.h),
          ),
          CreateRecipeDeleteButton(callback: (){}),
        ],
      ),
    );
  }
}