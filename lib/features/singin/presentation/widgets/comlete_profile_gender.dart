import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CompleteProfileGender extends StatelessWidget {
  const CompleteProfileGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 358,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.Pink,
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Text(
            'Male/Female',
            style: TextStyle(
              color: AppColors.MainColor.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
