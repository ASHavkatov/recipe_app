import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class BottomNavigationBarr extends StatelessWidget {
  const BottomNavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.ReddishPink,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ikonkalar orasida teng bo'sh joy
        children: [
          SvgPicture.asset('assets/icons/home.svg', width: 24, height: 24),
          SvgPicture.asset('assets/icons/community.svg', width: 24, height: 24),
          SvgPicture.asset('assets/icons/category_item.svg', width: 24, height: 24),
          SvgPicture.asset('assets/icons/profile.svg', width: 24, height: 24),
        ],
      ),
    );
  }
}
