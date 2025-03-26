

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/your_recipes/blocs/your_recipe_state.dart';

part 'your_recipe_event.dart';

class YourRecipeBloc extends Bloc< YourRecipeEvent, YourRecipeState>{

  YourRecipeBloc({required RecipeRepository repo}): _repo =repo, super(YourRecipeState.initial()){
    on<YourRecipeLoading>(_onLoad);
    add(YourRecipeLoading());
  }
  final RecipeRepository _repo;

  Future<void> _onLoad(YourRecipeLoading event, Emitter<YourRecipeState>emit)async{
    emit(state.copyWith(
      mostViewRecipeStatus: YourRecipeStatus.loading,
      recipeStatus: YourRecipeStatus.loading,
    ));

    final mostViewRecipe = await _repo.fetchYourRecipes(state.mostViewRecipe.length);
    emit(state.copyWith(mostViewRecipe: mostViewRecipe, mostViewRecipeStatus: YourRecipeStatus.success));
    final recipes = await _repo.fetchYourRecipes(state.recipes.length);
    emit(state.copyWith(recipes: recipes, recipeStatus: YourRecipeStatus.success));
  }
}