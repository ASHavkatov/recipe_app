import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/widgets/recipe_elevated_button.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';

class FollowUser extends StatelessWidget {
  const FollowUser({
    super.key,
    required this.userName,
    required this.name,
    required this.userImage,
    required this.following
  });

  final String userName, name;
  final String userImage;
  final bool following;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 63.h,
      color: AppColors.beigeColor,
      child: Row(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.go(Routes.myProfile);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: CachedNetworkImage(
                imageUrl: userImage,
                  width: 61.w,
                  height: 63.h,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@$userName",
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            spacing: 9,
            children: [
              RecipeElevatedButton(
                text: following ? "Following" : "Follower",
                callback: () {},
                size: Size(109.w, 21.h),
              ),
              SvgPicture.asset(
                "assets/svg/three_dots.svg",
                width: 4.w,
                height: 15.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
