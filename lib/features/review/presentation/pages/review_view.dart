import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:recipe_app/core/core.dart";
import "package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart";
import "package:recipe_app/features/review/presentation/manager/reviews/reviews_bloc.dart";
import "package:recipe_app/features/review/presentation/manager/reviews/reviews_state.dart";
import 'package:recipe_app/features/review/presentation/widgets/review_recipe.dart';
import 'package:recipe_app/features/review/presentation/widgets/reviews_comment.dart';
import 'package:recipe_app/features/review/presentation/widgets/recipe_review_app_bar.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beigeColor,
      appBar: RecipeReviewAppBar(
        title: "Reviews",
      ),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          if (state.status == ReviewsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ReviewsStatus.error) {
            return const Center(child: Text('Error loading reviews '));
          } else if (state.status == ReviewsStatus.idle) {
            }if (state.recipeModel == null || state.comment == null) {
              return const Center(child: Text("No reviews available"));
            }
            final recipe = state.recipeModel!;
            final comments = state.recipeModel!;
            return Column(
              children: [
                ReviewRecipe(
                  recipe: recipe,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                      itemCount: state.comment!.length,
                      itemBuilder: (context, index) => ReviewComment(
                            comment: state.comment![index],
                          ),
                    )
                )
              ],
            );
          }
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
