import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class RecipeReviewContainer extends StatelessWidget {
  const RecipeReviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 223,
      decoration: BoxDecoration(
        color: AppColors.ReddishPink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 37, bottom: 30),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/burger.png',
                  width: 163,
                  height: 163,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chicken Burger', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    SizedBox(height: 5),
                    Row(
                      spacing: 5,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        SvgPicture.asset(
                          'assets/icons/white_star.svg',
                          width: 11,
                          height: 11,
                        ),
                        SizedBox(width: 7),
                        Text('(456 reviews)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20), child: Image.asset('assets/icons/andrew.png', width: 33, height: 33)),
                        SizedBox(width: 5),
                        Column(
                          children: [
                            Text('@Andrew-Mar', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                            Text('Andrew Martinez-Chef', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 126,
                      height: 24,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                            'Add Review',
                            style: TextStyle(color: AppColors.ReddishPink, fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}