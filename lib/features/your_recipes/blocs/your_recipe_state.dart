import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/review/recipe_model_small.dart';

enum YourRecipeStatus { idle, loading, error, success }

class YourRecipeState extends Equatable{
  final List<RecipeModelSmall> mostViewRecipe;
  final YourRecipeStatus mostViewRecipeStatus;
  final List<RecipeModelSmall> recipes;
  final YourRecipeStatus recipeStatus;

  const YourRecipeState({
    required this.mostViewRecipe,
    required this.mostViewRecipeStatus,
    required this.recipes,
    required this.recipeStatus,
  });

  factory YourRecipeState.initial() {
    return YourRecipeState(
      mostViewRecipe: [],
      recipes: [],
      mostViewRecipeStatus: YourRecipeStatus.idle,
      recipeStatus: YourRecipeStatus.idle,
    );
  }

  YourRecipeState copyWith({
    List<RecipeModelSmall>? mostViewRecipe,
    List<RecipeModelSmall>? recipes,
    YourRecipeStatus? mostViewRecipeStatus,
    YourRecipeStatus? recipeStatus,
  }) {
    return YourRecipeState(
      mostViewRecipe: mostViewRecipe ?? this.mostViewRecipe,
      recipes: recipes ?? this.recipes,
      mostViewRecipeStatus: mostViewRecipeStatus ?? this.mostViewRecipeStatus,
      recipeStatus: recipeStatus ?? this.recipeStatus,
    );
  }

  @override
List<Object?>get props => [
  mostViewRecipe,
    recipes,
    mostViewRecipeStatus,
    recipeStatus
  ];
}
