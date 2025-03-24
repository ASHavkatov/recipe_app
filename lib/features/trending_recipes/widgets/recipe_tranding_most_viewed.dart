import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/features/trending_recipes/blocs/trending_bloc.dart';
import 'package:recipe_app/features/trending_recipes/blocs/trending_state.dart';

import '../../../core/utils/colors.dart';
import '../../home/presentation/widgets/home_title_page.dart';

class RecipeTrendingMostViewed extends StatelessWidget {
  const RecipeTrendingMostViewed({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingRecipeState>(builder: (context, state){
      return switch(state.trendingRecipeStatus){
        TrendingRecipesStatus.idle => Text("xato bor idle"),
        TrendingRecipesStatus.loading => Center(child: CircularProgressIndicator()),
        TrendingRecipesStatus.error => Text("xato bor error"),
      TrendingRecipesStatus.success => Container(
        padding: const EdgeInsets.only(left: 36, right: 36, top: 9),
        width: double.infinity,
        height: 241.h,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Most Viewed Today',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 9),
            SizedBox(
              width: 358.w,
              height: 182,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        width: 340.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    state.trendingRecipe!.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset('assets/svg/clock.svg'),
                                SizedBox(width: 4),
                                Text(
                                  "${state.trendingRecipe!.timeRequired}min",
                                  style: TextStyle(
                                    color: AppColors.redPinkMain,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    state.trendingRecipe!.desc,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${state.trendingRecipe!.rating}",
                                  style: TextStyle(
                                    color: AppColors.redPinkMain,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                SvgPicture.asset('assets/svg/star.svg'),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: double.infinity,
                    height: 143,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        state.trendingRecipe!.photo,
                        width: 358,
                        height: 143,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    right: 8,
                    child: Container(
                      width: 28,
                      height: 29,
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/heart.svg",
                          color: AppColors.pinkSub,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
      };
    });
  }
}