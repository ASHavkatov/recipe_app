import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';

class CreateRecipeDeleteButton extends StatelessWidget {
  const CreateRecipeDeleteButton({
    super.key,
    this.width = 41,
    this.height = 41,
    required this.callback,
  });

  final double width, height;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SvgPicture.asset("assets/svg/delete.svg",width: 15,height: 22),
        ),
      ),
    );
  }
}
