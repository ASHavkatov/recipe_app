import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../chefs/presentation/widgets/top_chef_follow_and_follower.dart';

class TopChefDetailFollowerContainer extends StatelessWidget {
  const TopChefDetailFollowerContainer({super.key, required this.recipe, required this.following, required this.follower});

  final String recipe, following, follower;

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
          TopChefFollowAndFollower(number: recipe, title: 'recipe'),
          Container(width: 1, height: 26, color: AppColors.pink),
          TopChefFollowAndFollower(number: following, title: 'Following'),
          Container(width: 1, height: 26, color: AppColors.pink),
          TopChefFollowAndFollower(number: follower, title: 'Followers')
        ],
      ),
    );
  }
}
