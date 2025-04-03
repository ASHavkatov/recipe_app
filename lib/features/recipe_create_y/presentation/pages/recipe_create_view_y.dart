import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/categories_detail/presentation/widgets/recipe_icon_button_container.dart';
import 'package:recipe_app/features/followers_and_following/wifgets/three_dots_button.dart';
import 'package:recipe_app/features/recipe_create_y/presentation/widgets/create_recipe_delete_button.dart';
import 'package:recipe_app/features/recipe_create_y/presentation/widgets/create_recipe_ingredient.dart';
import 'package:recipe_app/features/recipe_create_y/presentation/widgets/create_recipe_instruction.dart';
import 'package:recipe_app/features/review/presentation/widgets/recipe_review_app_bar.dart';

import '../../../followers_and_following/wifgets/recipe_text_form_field.dart';

class RecipeCreateViewY extends StatelessWidget {
  const RecipeCreateViewY({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    TextEditingController ingredientController = TextEditingController();
    TextEditingController instructionController = TextEditingController();

    return Scaffold(
      appBar: RecipeReviewAppBar(title: "Create Recipe"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: [
          Row(
            spacing: 6.w,
            children: [
              RecipeElevatedButton(
                text: "Publish",
                callback: () {},
                size: Size(177.w, 27.h),
              ),
              RecipeElevatedButton(text: "Delete", callback: () {})
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: double.infinity,
            height: 281.h,
            decoration: BoxDecoration(
              color: AppColors.pink.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RecipeIconButtonContainer(
                    image: "assets/svg/play.svg",
                    callback: () {},
                    iconWidth: 30.w,
                    iconHeight: 40.h,
                    containerWidth: 74.w,
                    containerHeight: 71.h,
                  ),
                  Text(
                    "Add Video recipe",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: 15, color: Colors.white),
              ),
              RecipeTextFormField(
                text: "Recipe title",
                size: Size(361, 41),
                textController: titleController,
              ),
              Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: 15, color: Colors.white),
              ),
              RecipeTextFormField(
                text: "Recipe Description",
                textController: descriptionController,
                size: Size(double.infinity, 64.h),
              ),
              Text(
                "Time Recipe",
                style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: 15, color: Colors.white),
              ),
              RecipeTextFormField(text: "1 hour, 30min, ...", textController: timeController),
              Text(
                "Ingredient",
                style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: 15, color: Colors.white),
              ),
              CreateRecipeIngredient(
                amountController: amountController,
                ingredientController: ingredientController,
              ),
              SizedBox(
                height: 20.h,
              ),
              RecipeElevatedButton(
                text: "+ Add Ingredient",
                callback: () {},
                backgroundColor: AppColors.redPinkMain,
                foregroundColor: Colors.black,
                size: Size(211.w, 35.h),
              ),
              SizedBox(height: 20.h,),
              Text(
                "Instructions",
                style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins", fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: 20.h,),
              CreateRecipeInstruction(instructionController: instructionController),
              SizedBox(height: 25.h,),
              RecipeElevatedButton(
                text: "+ Add Instruction",
                callback: () {},
                backgroundColor: AppColors.redPinkMain,
                foregroundColor: Colors.black,
                size: Size(211.w, 35.h),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
