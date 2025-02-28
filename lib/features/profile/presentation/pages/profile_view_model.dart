import 'package:flutter/material.dart';
import '../../../recipe_detail/presetation/recipe_detail_repository/recipe_detail_repository.dart';
import '../../data/models/profile_model.dart';
import '../../data/models/recipes_model.dart';
import '../../data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required this.recipeRepo, required this.profileRepo}) {
    load();
  }

  final RecipeRepository recipeRepo;
  final ProfileRepository profileRepo;
  ProfileModel? myProfile;
  List<RecipesModel>? myRecipes;

  Future load() async {
    myProfile = await profileRepo.fetchMyProfile();
    // myRecipes = await recipeRepo.fetchRecipes();
    notifyListeners();
  }
}
