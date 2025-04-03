import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ThreeDotsButton extends StatelessWidget {
  const ThreeDotsButton({super.key,required this.callback});

  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SvgPicture.asset(
        "assets/svg/three_dots.svg",
        width: 4.w,
        height: 15.h,
      ),
    );
  }
}
