import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';

class YourRecipeView extends StatelessWidget {
  const YourRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MainColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi! Dianne',
              style: TextStyle(
                color: AppColors.ReddishPink,
                fontWeight: FontWeight.w400,
                fontSize: 25,
              ),
            ),
            Text(
              'What are you cooking today',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.Pink,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(child: SvgPicture.asset('assets/icons/notification.svg')),
                ),
                SizedBox(width: 5),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.Pink,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(child: SvgPicture.asset('assets/icons/search.svg')),
                  ),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [

            ],
          )
        ],
      ),
    );
  }
}
