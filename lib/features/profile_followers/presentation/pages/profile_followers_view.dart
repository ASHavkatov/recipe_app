import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/profile_followers/presentation/wifgets/followers_app_bar.dart';

class ProfileFollowersView extends StatelessWidget {
  const ProfileFollowersView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: FollowersAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
          child: TabBarView(
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    width: 355.w,
                    height: 34.h,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppColors.redPinkMain,
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: AppColors.pink,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 63.h,
                    color: AppColors.beigeColor,
                    child: Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.asset(
                            'assets/top_chefs/andrew.png',
                            width: 61.w,
                            height: 63.h,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@neil_tran",
                              style: TextStyle(
                                color: AppColors.redPinkMain,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Text(
                              "Neil Tran-Chef",
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
                              text: "Following",
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
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    width: 355.w,
                    height: 34.h,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppColors.redPinkMain,
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: AppColors.pink,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 63.h,
                    color: AppColors.beigeColor,
                    child: Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.asset(
                            'assets/top_chefs/andrew.png',
                            width: 61.w,
                            height: 63.h,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@neil_tran",
                              style: TextStyle(
                                color: AppColors.redPinkMain,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Text(
                              "Neil Tran-Chef",
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
                              text: "Follower",
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
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
