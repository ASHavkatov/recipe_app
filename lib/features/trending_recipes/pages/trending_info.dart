import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class TrendingRecipesInfo extends StatelessWidget {
  const TrendingRecipesInfo({super.key,required this.title1, required this.title2, required this.title3, required this.text1, required this.text2, required this.text3});

  final title1, title2, title3;
  final String text1, text2, text3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            title2,
            style: TextStyle(
              height: 1,
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            title3,
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/svg/clock.svg'),
              SizedBox(width: 3),
              Text(
                text1,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 22),
              Text(
                text2,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              SvgPicture.asset('assets/svg/medium.svg'),
              SizedBox(width: 30),
              Text(
                text3,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 3),
              SvgPicture.asset('assets/svg/star.svg'),
            ],
          )
        ],
      ),
    );
  }
}
