import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_recipe_app/core/sizes.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/manager/recipe_detail_view_model.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/widgets/recipe_app_bar.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/widgets/recipe_detail_intstruction_all.dart';
import 'package:provider/provider.dart';
import '../widgets/profile_recipe_info.dart';
import '../widgets/recipe_detail_description.dart';
import '../widgets/recipe_detail_ingredients.dart';

class RecipeDetailPage extends StatelessWidget {
  RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: RecipeAppBar(
        title: 'Trending Recipes',
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: AppSizes.padding36, right: AppSizes.padding36, top: 27, bottom: 130),
        children: [
          Container(
            width: 356,
            height: 337,
            decoration: BoxDecoration(
              color: AppColors.ReddishPink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      vm.recipe.photo,
                      width: double.infinity,
                      height: 281,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vm.recipe.title,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 3),
                        Text(
                          vm.recipe.rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset('assets/icons/izoh.svg'),
                        SizedBox(width: 5),
                        Text(
                          vm.recipe.timeRequired.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 26),
          ProfileRecipeInfo(),
          SizedBox(height: 20),
          Container(
            width: 356,
            height: 1,
            color: AppColors.Pink,
          ),
          SizedBox(height: 30),
          RecipeDetailDescription(),
          SizedBox(height: 30),
          RecipeDetailIngredients(),
          SizedBox(height: 30),
          RecipeDetailIntstructionAll(vm: vm),
        ],
      ),
    );
  }
}
