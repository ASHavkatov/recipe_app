import 'package:recipe_app/features/recipe_detail/data/models/ingredients_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/instructions_model.dart';

class RecipeCreateModel {
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final int timeRequired;
  final List<Instructions> instructions;
  final List<IngredientsModel> ingredients;

  RecipeCreateModel({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.timeRequired,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeCreateModel.fromJson(Map<String, dynamic> json) {
    return RecipeCreateModel(
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      timeRequired: json['timeRequired'],
      instructions: (json['instructions'] as List).map((i) => Instructions.fromJson(i)).toList(),
      ingredients: (json['ingredients'] as List).map((i) => IngredientsModel.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'timeRequired': timeRequired,
      'instructions': instructions.map((i) => i.toJson()).toList(),
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
    };
  }
}
