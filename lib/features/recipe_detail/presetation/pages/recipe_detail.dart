import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_recipe_app/core/sizes.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/manager/recipe_detail_view_model.dart';
import 'package:provider/provider.dart';

class RecipeDetailPage extends StatelessWidget {
  RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),
        centerTitle: true,
        title: Text(
          'Trending Recipes',
          style: TextStyle(
            color: AppColors.ReddishPink,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 36),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.ReddishPink,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/heart.svg',
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.ReddishPink,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/share.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: AppSizes.padding36, right: AppSizes.padding36, top: 27),
        children: [
          Container(
            width: 356,
            height: 337,
            decoration: BoxDecoration(
              color: AppColors.ReddishPink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      vm.recipe.photo,
                      width: double.infinity,
                      height: 281,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vm.recipe.title,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 3),
                        Text(
                          vm.recipe.rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset('assets/icons/izoh.svg'),
                        SizedBox(width: 5),
                        Text(
                          vm.recipe.timeRequired.toString(),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

