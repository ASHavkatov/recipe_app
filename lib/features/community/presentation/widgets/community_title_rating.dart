import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CommunityTitleRating extends StatelessWidget {
  const CommunityTitleRating({
    super.key,
    required this.topCommunity, required this.text, required this.rating,
  });

  final List topCommunity;

  final String text, rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        SvgPicture.asset(
          'assets/svg/star.svg',
          color: Colors.white,
        ),
        SizedBox(width: 5.w),
        Text(
          rating,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
      ],
    );
  }
}
