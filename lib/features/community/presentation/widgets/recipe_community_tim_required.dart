import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class RecipeCommunityTimRequired extends StatelessWidget {
  const RecipeCommunityTimRequired({
    super.key,
    required this.topCommunity, required this.timeRequired,
  });

  final List topCommunity;
  final String timeRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/clock.svg',
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          timeRequired,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
