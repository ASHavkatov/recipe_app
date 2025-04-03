import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/profiles/presentation/widgets/profile_app_bar_bottom_stats.dart';

import '../../../../core/routing/routes.dart';
import '../pages/my_profile_view_model.dart';

class MyProfileAppBarBottomContainer extends StatelessWidget {
  const MyProfileAppBarBottomContainer({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    var vm = context.watch<MyProfileViewModel>();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.pink, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileAppBarBottomStats(
            number: vm.myProfile!.recipesCount,
            subtitle: "recipes",
          ),
          Container(
            height: 26,
            width: 2,
            color: AppColors.pink,
          ),
          GestureDetector(
            onTap:(){
              context.push(Routes.follow);
            },
            child: ProfileAppBarBottomStats(
              number: vm.myProfile!.followingCount,
              subtitle: "following",
            ),
          ),
          Container(
            height: 26,
            width: 2,
            color: AppColors.pink,
          ),
          GestureDetector(
            onTap: (){
              context.push(Routes.follow);
            },
            child: ProfileAppBarBottomStats(
              number: vm.myProfile!.followerCount,
              subtitle: "followers",
            ),
          ),
        ],
      ),
    );
  }
}
