import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';
import 'package:new_recipe_app/features/community/presentation/manager/community_view_model.dart';
import 'package:new_recipe_app/features/community/presentation/widgets/community_card.dart';
import 'package:new_recipe_app/features/community/presentation/widgets/minus_date.dart';
import 'package:new_recipe_app/features/community/presentation/widgets/profile_info_card.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/widgets/recipe_app_bar.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/widgets/recipe_icon_container.dart';
import 'package:provider/provider.dart';

import '../../../../core/routess.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<CommunityViewModel>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: RecipeAppBar(
            title: 'Community',
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                      (index) => TextButton(
                    onPressed: () {
                      vm.selectCategory(index);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: vm.selectedIndex == index
                          ? AppColors.ReddishPink
                          : Colors.transparent,
                    ),
                    child: Text(
                      vm.bottomTitles[index],
                      style: TextStyle(
                        color: vm.selectedIndex == index
                            ? AppColors.milkWhite
                            : AppColors.ReddishPink,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              RecipeIconButtonContainer(
                image: 'assets/icons/notification.svg',
                callback: () {},
                iconWidth: 16,
                iconHeight: 16,
              ),
              const SizedBox(width: 5),
              RecipeIconButtonContainer(
                image: 'assets/icons/search.svg',
                callback: () {},
                iconWidth: 16,
                iconHeight: 16,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: PageView.builder(
              controller: vm.pageController,
              onPageChanged: vm.onPageChanged,
              itemCount: 3,
              itemBuilder: (context, pageIndex) {
                var currentList = vm.Lists[pageIndex];
                return ListView.builder(
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    var recipe = currentList[index];
                    return Column(
                      spacing: 15,
                      children: [
                        ProfileInfoCard(
                          photo: recipe.user.profilePhoto,
                          username: recipe.user.userName,
                          created: MinusDate(recipe.created),
                        ),
                        GestureDetector(
                        onTap: (){context.push('${Routes.recipeDetail}/${recipe.id}');},
                          child: CommunityCard(
                            photo: recipe.photo,
                            title: recipe.title,
                            description: recipe.description,
                            rating: recipe.rating.toInt(),
                            timeRequired: recipe.timeRequired.toInt(),
                            reviewsCount: recipe.reviewsCount.toInt(), recipe: recipe.id,
                          ),
                        ),
                        const Divider(color: AppColors.PinkSub),
                        const SizedBox(height: 4),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
