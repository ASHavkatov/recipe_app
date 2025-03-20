import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../categories/presentation/widgets/recipe_icon_button.dart';

class TopChefAppBar extends StatelessWidget implements PreferredSizeWidget{
  TopChefAppBar({super.key,this.action1,this.action2, required this.title});

  String? action1, action2;
  String title;
  @override
  Size get preferredSize => const Size(double.infinity, 61);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
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
          SizedBox(width: 4),
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
          )
        ],
      ),
    );
  }
}