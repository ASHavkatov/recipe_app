import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_icon_button.dart';
import '../../../../core/utils/colors.dart';

class FollowersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FollowersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: RecipeIconButton(
          image: "assets/svg/arrow.svg",
          width: 30,
          height: 14,
          callback: context.pop,
        ),
      ),
      title: Text(
        "@dianne_r",
        style: TextStyle(
          color: AppColors.redPinkMain,
          fontFamily: "Poppins",
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.redPinkMain,
        tabs: [
          Tab(text: "120 Following"),
          Tab(text: "250 Followers"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
