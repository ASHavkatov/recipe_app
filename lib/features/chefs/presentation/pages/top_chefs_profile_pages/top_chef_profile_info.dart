import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class TopChefProfileInfo extends StatelessWidget {
  const TopChefProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/top_chefs/andrew.png',
            width: 100,
            height: 100,
          ),
        ),
        const SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Neil Tran-Chef',
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Passionate chef in creative and\ncontemporary cuisine.',
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.white),
            ),
            const SizedBox(height: 4),
            GestureDetector(
                onTap: () {},
                child: Container(
                  width: 81,
                  height: 19,
                  decoration: BoxDecoration(color: AppColors.pink, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Following',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.pinkSub,
                          fontSize: 10),
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }
}
