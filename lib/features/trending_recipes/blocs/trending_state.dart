import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/trending_recipes/trending_recipe_model.dart';

import '../../../core/data/models/trending_recipes/trending_recipes_model.dart';

enum TrendingRecipesStatus { idle, loading, error, success }

class TrendingRecipeState extends Equatable {
  final List<TrendingRecipesModel>? trendingRecipes;
  final TrendingRecipesStatus recipesTrendingStatus;

  final TrendingRecipeModel? trendingRecipe;
  final TrendingRecipesStatus trendingRecipeStatus;

  const TrendingRecipeState({
    required this.trendingRecipes,
    required this.trendingRecipe,
    required this.trendingRecipeStatus,
    required this.recipesTrendingStatus,
  });

  factory TrendingRecipeState.initial() {
    return TrendingRecipeState(
      trendingRecipes: [],
      trendingRecipe: null,
      trendingRecipeStatus: TrendingRecipesStatus.idle,
      recipesTrendingStatus: TrendingRecipesStatus.idle,
    );
  }
  TrendingRecipeState copyWith({
    List<TrendingRecipesModel>? trendingRecipes,
    TrendingRecipeModel? trendingRecipe,
    TrendingRecipesStatus? trendingRecipesStatus,
    TrendingRecipesStatus? trendingRecipeStatus,
}){
    return TrendingRecipeState(
      trendingRecipes: trendingRecipes ?? this.trendingRecipes,
      trendingRecipe: trendingRecipe ?? this.trendingRecipe,
      trendingRecipeStatus: trendingRecipesStatus ?? this.trendingRecipeStatus,
      recipesTrendingStatus: trendingRecipeStatus ?? this.recipesTrendingStatus
    );
  }
  @override
  List<Object?>get props =>[
    trendingRecipes,
    trendingRecipe,
    trendingRecipeStatus,
    recipesTrendingStatus
  ];
}
