
import 'package:new_recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';

import 'ingredients_model.dart';
import 'instructions_model.dart';

class RecipeDetailModel {
  final int id, category_Id;
  final String title, description, photo, videoRecipe;
  final int timeRequired, rating;
  final RecipeDetailUserModel user;

  final List<InstructionsModel> instructions;

  final List<IngerdientsModel> ingredients;

  RecipeDetailModel({
    required this.id,
    required this.category_Id,
    required this.title,
    required this.description,
    required this.photo,
    required this.videoRecipe,
    required this.timeRequired,
    required this.rating,
    required this.user,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
        id: json['id'],
        category_Id: json['categoryId'],
        title: json['title'],
        description: json['description'],
        photo: json['photo'],
        videoRecipe: json['videoRecipe'],
        timeRequired: json['timeRequired'],
        rating: json['rating'],
        user: RecipeDetailUserModel.fromJson(json['user']),
        ingredients: (json['ingredients'] as List<dynamic>).map((ingredients) => IngerdientsModel.fromJson(ingredients)).toList(),
        instructions: (json['instructions'] as List<dynamic>).map((instruction) => InstructionsModel.fromJson(instruction)).toList());
  }
}
