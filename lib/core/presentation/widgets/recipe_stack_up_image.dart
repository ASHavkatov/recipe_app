import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class RecipeStackUpImage extends StatelessWidget {
  const RecipeStackUpImage({super.key, required this.title, required this.time, required this.desc, required this.rating, required this.image});
final String title, desc, rating, time, image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -65,
          left: 5,
          // right: 0,
          child: Container(
            height: 76.h,
            width: 159.w,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.w300, fontFamily: "League Spartan", height: 1),
                ),
                SizedBox(height: 10.h),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            image,
            width: 170.w,
            height: 153.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
