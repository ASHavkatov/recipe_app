import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';
import 'package:new_recipe_app/features/singin/presentation/widgets/app_bar.dart';

class YourRecipeView extends StatelessWidget {
  const YourRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MainColor,
        leading: Center(
          child: SvgPicture.asset('assets/icons/back-arrow.svg'),
        ),

      ),
    );
  }
}
