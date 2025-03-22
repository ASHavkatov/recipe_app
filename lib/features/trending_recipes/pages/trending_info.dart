import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class TrendingRecipesInfo extends StatelessWidget {
  const TrendingRecipesInfo({super.key,required this.title, required this.desc, required this.timeRequired, required this.dificult, required this.rating});

  final title, desc;
  final String timeRequired, dificult, rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              height: 1,
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/svg/clock.svg'),
              SizedBox(width: 3),
              Text(
                timeRequired,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 22),
              Text(
                dificult,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              SvgPicture.asset('assets/svg/medium.svg'),
              SizedBox(width: 30),
              Text(
                rating,
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
