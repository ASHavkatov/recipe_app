import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';

import '../widgetss/recipe_review_comments.dart';
import '../widgetss/recipe_review_container.dart';

class RecipeReviewView extends StatelessWidget {
  const RecipeReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MainColor,
        leading: Center(child: SvgPicture.asset('assets/icons/back-arrow.svg')),
        title: Text('Reviews', style: TextStyle(color: AppColors.ReddishPink, fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeReviewContainer(),
              SizedBox(height: 27),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: Text('Comments', style: TextStyle(color: AppColors.ReddishPink, fontSize: 15, fontWeight: FontWeight.w500), textAlign: TextAlign.start,),
              ),
              SizedBox(height: 17),
              RecipeReviewComments(profilePhoto: 'assets/icons/user1.png' ,email: '@r_joshua', minuts: '(40 mins ago)', svg1: 'assets/icons/reddish_star.svg', svg2: 'assets/icons/reddish_star.svg', svg3: 'assets/icons/star_reddish2.svg',),
              SizedBox(height: 21),
              RecipeReviewComments(profilePhoto: 'assets/icons/user2.png',email: '@josh-ryan', minuts: '(15 mins ago)', svg1: 'assets/icons/reddish_star.svg', svg2: 'assets/icons/star_reddish2.svg', svg3: 'assets/icons/star_reddish2.svg',),
              SizedBox(height: 21),
              RecipeReviewComments(profilePhoto: 'assets/icons/user3.png',email: '@sweet.sarah', minuts: '(1 Hr ago)', svg1: 'assets/icons/star_reddish2.svg', svg2: 'assets/icons/star_reddish2.svg', svg3: 'assets/icons/star_reddish2.svg',)
            ],
          ),
        ],
      ),
    );
  }
}



