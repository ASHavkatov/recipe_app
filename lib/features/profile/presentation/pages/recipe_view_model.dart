import 'package:flutter/cupertino.dart';
import '../../../recipe_detail/domain/repository/recipe_detail_repository.dart';
import '../../data/models/recipes_model.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeViewModel({required RecipeRepository recipeRepo})
      : _recipeRepo = recipeRepo {
    load();
  }

  final RecipeRepository _recipeRepo;
  List<RecipesModel>? myRecipe;

  Future<void> load() async {
    // myRecipe = await _recipeRepo.fetchRecipes();
    notifyListeners();
  }
}
