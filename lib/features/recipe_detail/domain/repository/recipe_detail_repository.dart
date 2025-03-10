import 'package:new_recipe_app/features/recipe_detail/data/models/recipe_detail_model.dart';

import '../../../../core/client.dart';


class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeDetailModel>> recipesByCategory = {};
  RecipeDetailModel? recipe;

<<<<<<< HEAD
=======

>>>>>>> 36711fb (init commit)
  Future<List<RecipeDetailModel>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null){
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesById(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeDetailModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipesById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }
}
<<<<<<< HEAD
=======

>>>>>>> 36711fb (init commit)
