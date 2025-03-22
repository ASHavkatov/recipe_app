import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_appbar.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/chefs/blocs/top_chef_bloc.dart';
import 'package:recipe_app/features/chefs/blocs/top_chefs_state.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chefs_newchefs.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chefs_most_liked_chefs.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chefs_section_viewed.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: RecipeAppbar(title: 'Top chef'),
      body: BlocBuilder<TopChefsBloc, TopChefsState>(
        builder: (context, state) {
          if (state is TopChefsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else{
            return ListView(
              padding: EdgeInsets.only(bottom: 150),
              children: [
                TopChefsSectionViewed(),
                SizedBox(height: 15),
                TopChefsMostLikedChefs(),
                SizedBox(height: 15),
                TopChefsNewchefs()
              ],
            );
          }
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );

  }
}
