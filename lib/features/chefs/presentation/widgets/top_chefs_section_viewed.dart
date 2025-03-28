import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/chefs/blocs/top_chef_bloc.dart';
import 'package:recipe_app/features/chefs/blocs/top_chefs_state.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chefs_section_image_title.dart';

class TopChefsSectionViewed extends StatelessWidget {
  const TopChefsSectionViewed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsBloc, TopChefsState>(builder: (context, state) {
      if (state is TopChefsLoading) {
        return Center(child: CircularProgressIndicator());
      } else {
        final chef = state.mostViewedChefs;
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                context.push(Routes.topChesProfile);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 16.h),
                width: 430.w,
                height: 285.h,
                decoration: BoxDecoration(color: AppColors.redPinkMain, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Most Viewed chefs',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var chef in state.mostViewedChefs)
                          TopChefsSectionImageTitle(
                            image: chef.image,
                            title: chef.firstName,
                            username: chef.username,
                            rating: 4456,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
