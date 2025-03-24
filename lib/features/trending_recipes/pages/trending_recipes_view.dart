import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chef_app_bar.dart';
import 'package:recipe_app/features/trending_recipes/blocs/trending_bloc.dart';
import 'package:recipe_app/features/trending_recipes/blocs/trending_state.dart';
import 'package:recipe_app/features/trending_recipes/pages/trending_recipe_info.dart';
import 'package:recipe_app/features/trending_recipes/widgets/recipe_tranding_most_viewed.dart';

class TrendingRecipesView extends StatelessWidget {
  const TrendingRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: TopChefAppBar(
        title: 'Trending Recipes',
        action1: 'assets/svg/notification.svg',
        action2: 'assets/svg/search.svg',
      ),
      body: BlocBuilder<TrendingBloc, TrendingRecipeState>(
        builder: (context, state) {
          return switch (state.trendingRecipeStatus) {
            TrendingRecipesStatus.idle => Text("xato bor idle"),
            TrendingRecipesStatus.loading => Text(
                "xato bor loading",
                style: TextStyle(color: Colors.white),
              ),
            TrendingRecipesStatus.error => Text("xato bor error"),
            TrendingRecipesStatus.success => Column(
                children: [
                  RecipeTrendingMostViewed(),
                  SizedBox(height: 10),
                  Expanded(
                    child: TrendingRecipeInfo(),
                  ),
                ],
              ),
          };
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
