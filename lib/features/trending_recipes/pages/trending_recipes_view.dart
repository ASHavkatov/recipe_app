import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chef_app_bar.dart';
import 'package:recipe_app/features/trending_recipes/pages/recipe_tranding_most_viewed.dart';
import 'package:recipe_app/features/trending_recipes/pages/trending_recipe_info.dart';

class TrendingRecipesView extends StatelessWidget {
  const TrendingRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: TopChefAppBar(
        title: 'Tending Recipe',
        action1: '',
        action2: '',
      ),
      body: Column(
        children: [
          RecipeTrendingMostViewed(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: 64.h,
                bottom: 100,
              ),
              children: [
                TrendingRecipInfo(),
                SizedBox(height: 15),
                TrendingRecipInfo(),
                SizedBox(height: 15),
                TrendingRecipInfo(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}


