import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class TopChefDetailProfileInfo extends StatefulWidget {
  const TopChefDetailProfileInfo({super.key, required this.image, required this.name, required this.desc});

  final String image, name, desc;

  @override
  State<TopChefDetailProfileInfo> createState() => _TopChefDetailProfileInfoState();
}

class _TopChefDetailProfileInfoState extends State<TopChefDetailProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            widget.image,
            width: 100.w,
            height: 100.h,
          ),
        ),
        SizedBox(width: 15.w),
        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.desc,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 81,
                height: 19,
                decoration: BoxDecoration(color: AppColors.pink, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  textAlign: TextAlign.center,
                  'Following',
                  style: TextStyle(
                    color: AppColors.pinkSub,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}