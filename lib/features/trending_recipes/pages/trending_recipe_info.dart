import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/trending_recipes/pages/trending_info.dart';

import '../blocs/trending_bloc.dart';
import '../blocs/trending_state.dart';

class TrendingRecipeInfo extends StatelessWidget {
  const TrendingRecipeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingRecipeState>(
      builder: (context, state) {
        return switch (state.trendingRecipeStatus) {
          TrendingRecipesStatus.idle => const Text("xato bor idle"),
          TrendingRecipesStatus.loading => const Text(
            "xato bor loading",
            style: TextStyle(color: Colors.white),
          ),
          TrendingRecipesStatus.error => const Text("xato bor error"),
          TrendingRecipesStatus.success => ListView.builder(
              padding: EdgeInsets.only(right: 36.w, left: 36.w, bottom: 150.h, top: 25.h),
              itemCount: state.trendingRecipes!.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child:
                  Column(
                    children: [
                      SizedBox(
                        width: 358.w,
                        height: 150.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 207,
                                height: 122,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    TrendingRecipesInfo(
                                      title: state.trendingRecipes![index].title,
                                      desc: state.trendingRecipes![index].desc,
                                      timeRequired: "${state.trendingRecipes![index].timeRequired}",
                                      dificult: state.trendingRecipes![index].difficulty,
                                      rating: "${state.trendingRecipes![index].rating}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              height: 150.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  state.trendingRecipes![index].photo,
                                  width: 358,
                                  height: 143,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              }
          ),
        };
      },
    );
  }
}
