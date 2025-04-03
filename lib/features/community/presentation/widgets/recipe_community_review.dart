import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class RecipeCommunityReview extends StatelessWidget {
  const RecipeCommunityReview({
    super.key,
    required this.topCommunity, required this.reviews,
  });

  final List topCommunity;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          reviews,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'),
        ),
        SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          'assets/svg/reviews.svg',
          color: Colors.white,
        )
      ],
    );
  }
}
