
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class LikeButton extends StatefulWidget {
  LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLike = !isLike;
        });
      },
      icon: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: isLike ? AppColors.PinkSub : AppColors.Pink,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
            child: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: ColorFilter.mode(
                isLike ? Colors.white : AppColors.ReddishPink,
                BlendMode.srcIn,
              ),
            )),
      ),
    );
  }
}