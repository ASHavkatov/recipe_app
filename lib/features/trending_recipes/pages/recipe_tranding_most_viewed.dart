import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import '../../home/presentation/widgets/home_title_page.dart';

class RecipeTrendingMostViewed extends StatelessWidget {
  const RecipeTrendingMostViewed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 36, right: 36, top: 9),
      width: double.infinity,
      height: 241.h,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Viewed Today',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 9),
          SizedBox(
            width: 358.w,
            height: 182,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Align(alignment: Alignment.bottomCenter, child: HomeTitlePage()),
                SizedBox(
                  width: double.infinity,
                  height: 143,
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
                Positioned(
                  top: 7,
                  right: 8,
                  child: Container(
                    width: 28,
                    height: 29,
                    decoration: BoxDecoration(color: AppColors.pink, borderRadius: BorderRadius.circular(14)),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/heart.svg",
                        color: AppColors.pinkSub,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
