import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/trending_recipes/trending_recipe_model.dart';

import '../../../core/data/models/trending_recipes/trending_recipes_model.dart';

enum TrendingRecipeStatus { idle, loading, error, success }

class TrendingRecipeState extends Equatable {
  final List<TrendingRecipesModel>? trendingRecipes;
  final TrendingRecipeStatus trendingRecipesStatus;

  final TrendingRecipeModel? trendingRecipe;
  final TrendingRecipeStatus trendingRecipeStatus;

  const TrendingRecipeState({
    required this.trendingRecipes,
    required this.trendingRecipe,
    required this.trendingRecipesStatus,
    required this.trendingRecipeStatus,
  });

  factory TrendingRecipeState.initial() {
    return TrendingRecipeState(
      trendingRecipes: [],
      trendingRecipe: null,
      trendingRecipesStatus: TrendingRecipeStatus.idle,
      trendingRecipeStatus: TrendingRecipeStatus.idle,
    );
  }
  TrendingRecipeState copyWith({
    List<TrendingRecipesModel>? trendingRecipes,
    TrendingRecipeModel? trendingRecipe,
    TrendingRecipeStatus? trendingRecipesStatus,
    TrendingRecipeStatus? trendingRecipeStatus,
}){
    return TrendingRecipeState(
      trendingRecipes: trendingRecipes ?? this.trendingRecipes,
      trendingRecipe: trendingRecipe ?? this.trendingRecipe,
      trendingRecipesStatus: trendingRecipesStatus ?? this.trendingRecipesStatus,
      trendingRecipeStatus: trendingRecipeStatus ?? this.trendingRecipeStatus
    );
  }
  @override
  List<Object?>get props =>[
    trendingRecipes,
    trendingRecipe,
    trendingRecipesStatus,
    trendingRecipeStatus
  ];
}
