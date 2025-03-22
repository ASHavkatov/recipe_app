import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/trending_recipes/blocs/trending_state.dart';
part 'trending_event.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingRecipeState> {
  TrendingBloc({required RecipeRepository trendRepo})
      : _trendRepo = trendRepo,
        super(TrendingRecipeState.initial()) {
    on<TrendingLoading>(_onLoad);
    add(TrendingLoading());
  }
  final RecipeRepository _trendRepo;

  Future<void> _onLoad(TrendingLoading event, Emitter<TrendingRecipeState> emit) async {
    emit(
      state.copyWith(
        trendingRecipesStatus: TrendingRecipesStatus.loading,
        trendingRecipeStatus: TrendingRecipesStatus.loading,
      ),
    );
    final trendingRecipes = await _trendRepo.fetchTrendingRecipes();
    emit(state.copyWith(trendingRecipes: trendingRecipes, trendingRecipesStatus: TrendingRecipesStatus.success));
    final trendingRecipe =await _trendRepo.fetchRecipeTrending();
    emit(state.copyWith(trendingRecipe: trendingRecipe, trendingRecipeStatus: TrendingRecipesStatus.success));
  }
}
