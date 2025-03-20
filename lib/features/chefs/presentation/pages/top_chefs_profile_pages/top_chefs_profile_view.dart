import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/chefs/presentation/pages/top_chefs_profile_pages/top_chef_profile_info.dart';
import '../../widgets/top_chef_app_bar.dart';
import '../../widgets/top_chef_profile_follow_and_recipe.dart';

class TopChefsProfileView extends StatelessWidget {
  const TopChefsProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beigeColor,
      appBar: TopChefAppBar(title: '@Neil_tran', action1: 'assets/svg/share.svg', action2: 'assets/svg/three_dots.svg'),
      body: Padding(
        padding: const EdgeInsets.only(left: 36, right: 36, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 13,
          children: [
            TopChefProfileInfo(),
            TopChefProfileFollowAndRecipe(),
            Column(
              children: [
                Text(
                  'Recipes',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                ),
                SizedBox(height: 5),
                Container(width: double.infinity, height: 1, color: AppColors.redPinkMain),
              ],
            ),
            TopChefRecipes(title: 'Vegan Recipes', image: 'assets/images/salat.jpg',),
            TopChefRecipes(title: 'Asian Heritage', image: 'assets/images/salat.jpg',),
            TopChefRecipes(title: 'Guilty Pleasures', image: 'assets/images/salat.jpg',)
          ],
        ),
      ),
    );
  }
}

class TopChefRecipes extends StatelessWidget {
  const TopChefRecipes({super.key, required this.title, required this.image});
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430.w,
      height: 133.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 336.w,
              height: 44.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: 356.w,
              height: 103.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
