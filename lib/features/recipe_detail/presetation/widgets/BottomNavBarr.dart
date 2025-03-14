import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/widgets/recipe_icon_button.dart';

import '../../../../core/routess.dart';
import '../../../../core/utils/app_colors.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none ,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 128,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.MainColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 36),
            child: Container(
              width: 280,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.ReddishPink,
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeIconButton(
                    image: "assets/icons/home.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/icons/community.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/icons/categories.svg",
                    callback: () {
                      context.go(Routes.categories);
                    },
                  ),
                  RecipeIconButton(
                    image: "assets/icons/profile.svg",
                    callback: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
