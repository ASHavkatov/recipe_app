import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:recipe_app/core/core.dart";

import "../../../../core/routing/routes.dart";


class RecipeReviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeReviewAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 61);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        surfaceTintColor: AppColors.beigeColor,
        backgroundColor: AppColors.beigeColor,
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: (){
              context.go(Routes.home);
            },
            child: SvgPicture.asset(
              'assets/svg/arrow.svg',
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
