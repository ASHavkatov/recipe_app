import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/trending_recipes/pages/trending_info.dart';

class TrendingRecipInfo extends StatelessWidget {
  const TrendingRecipInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 36, right: 36),
      child: Column(
        children: [
          SizedBox(
            width: 358.w,
            height: 150.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 207,
                    height: 122,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        TrendingRecipesInfo(
                          title1: 'Chicken Curry',
                          title2: 'Savor the aromatic Chicken Curry—\na rich bl end of spices...',
                          title3: 'By Chef Josh Ryan',
                          text1: '45min',
                          text2: 'Easy',
                          text3: '4',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/pizza.png',
                      width: 358,
                      height: 143,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}