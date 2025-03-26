import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../categories/presentation/widgets/recipe_icon_button.dart';

class TopChefAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? action1;
  final String? action2;
  final String title;

  const TopChefAppBar({super.key, this.action1, this.action2, required this.title});

  @override
  Size get preferredSize => const Size(double.infinity, 61);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AppBar(
        backgroundColor: AppColors.beigeColor,
        leading: RecipeIconButton(
          callback: () {
            context.go(Routes.login);
          },
          image: "assets/svg/arrow.svg",
          width: 30,
          height: 14,
        ),
        title: Text(
          title,
          style: TextStyles.appBarTitleStyle,
        ),
        actions: [
          if (action1 != null)
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: SvgPicture.asset(action1!),
              ),
            ),
          const SizedBox(width: 4),
          if (action2 != null)
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: SvgPicture.asset(action2!),
              ),
            ),
        ],
      ),
    );
  }
}
