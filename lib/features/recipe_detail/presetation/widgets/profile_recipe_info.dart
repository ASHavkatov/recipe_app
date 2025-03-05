import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/recipe_detail_view_model.dart';


class ProfileRecipeInfo extends StatelessWidget {
  const ProfileRecipeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return SizedBox(
      width: 356 * AppSizes.wRatio,
      height: 63 * AppSizes.hRatio,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(vm.recipe.user.profilePhoto),
          ),
          SizedBox(width: 15 * AppSizes.wRatio),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                vm.recipe.user.userName,
                style: TextStyle(
                  color: AppColors.ReddishPink,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Text(
                "${vm.recipe.user.firstName} ${vm.recipe.user.lastName}",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(width: 70 * AppSizes.wRatio),
          Container(
            width: 109,
            height: 21,
            decoration: BoxDecoration(color: AppColors.Pink, borderRadius: BorderRadius.circular(21)),
            child: Text(
              'Following',
              style: TextStyle(
                color: AppColors.PinkSub,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 9),
          SvgPicture.asset('assets/icons/more.svg'),
        ],
      ),
    );
  }
}
