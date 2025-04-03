import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_stack_under_image.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_appbar.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/your_recipes/blocs/your_recipe_state.dart';
import 'package:recipe_app/features/your_recipes/blocs/your_recipes_bloc.dart';

import '../../../core/presentation/widgets/recipe_stack_up_image.dart';

class YourRecipeView extends StatelessWidget {
  const YourRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppbar(title: "Your Recipes"),
      body: BlocBuilder<YourRecipeBloc, YourRecipeState>(
        builder: (context, state) {
          if (state.recipeStatus == YourRecipeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.mostViewRecipe.isEmpty) {
            return const Center(child: Text("No Recipes Found"));
          }
          return Column(
            children: [
              Container(
                width: 430.w,
                height: 255.h,
                padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColors.redPinkMain,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Most Viewed Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                        child: Wrap(
                      spacing: 17,
                      children: List.generate(
                        2,
                        (index) => RecipeStack(
                          rating: "${state.mostViewRecipe[index].rating}",
                          time: "${state.mostViewRecipe[index].time}",
                          title: state.mostViewRecipe[index].title,
                          image: state.mostViewRecipe[index].image,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 36, right: 36),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      childAspectRatio: 170.w / 226.h,
                    ),
                    itemCount: (state.recipes.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      return Center(
                        child: RecipeStackUpImage(
                          title: state.recipes[index].title,
                          desc: state.recipes[index].desc,
                          rating: "${state.recipes[index].rating}",
                          time: "${state.recipes[index].time}",
                          image: state.recipes[index].image,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
