import 'package:flutter/material.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chef_follow_and_follower.dart';

import '../../../../core/utils/colors.dart';

class TopChefProfileFollowAndRecipe extends StatelessWidget {
  const TopChefProfileFollowAndRecipe({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pink),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TopChefFollowAndFollower(number: '15', title: 'recipe'),
          Container(width: 1, height: 26, color: AppColors.pink),
          TopChefFollowAndFollower(number: '10', title: 'Following'),
          Container(width: 1, height: 26, color: AppColors.pink),
          TopChefFollowAndFollower(number: '255.770', title: 'Followers')


        ],
      ),
    );
  }
}