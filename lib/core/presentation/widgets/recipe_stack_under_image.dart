import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/core.dart';

class RecipeStack extends StatelessWidget {
  const RecipeStack({super.key, required this.rating, required this.time, required this.title, required this.image});
  final String title, rating, time, image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
             image,
            width: 168.w,
            height: 162.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -10,
          child: Container(
            width: 168.w,
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      rating,
                      style: TextStyle(
                        color: AppColors.pinkSub,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SvgPicture.asset("assets/svg/star.svg"),
                    SizedBox(
                      width: 25.w,
                    ),
                    SvgPicture.asset("assets/svg/clock.svg"),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: AppColors.pinkSub,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right : 8.5.w,
          top: 7.h,
          child: Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
            child: Center(child: SvgPicture.asset("assets/svg/heart.svg")),
          ),
        )
      ],
    );
  }
}
