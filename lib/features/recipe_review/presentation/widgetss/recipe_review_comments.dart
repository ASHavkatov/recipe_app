import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class RecipeReviewComments extends StatelessWidget {
  const RecipeReviewComments({super.key, required this.email, required this.minuts, required this.svg1, required this.svg2, required this.svg3, required this.profilePhoto});
  final String email, minuts, svg1, svg2, svg3, profilePhoto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(23), child: Image.asset(profilePhoto, width: 46, height: 46)),
              SizedBox(width: 13),
              Text(email, style: TextStyle(color: AppColors.ReddishPink, fontSize: 15, fontWeight: FontWeight.w400)),
              SizedBox(width: 105),
              Text(minuts, style: TextStyle(color: AppColors.PinkSub, fontSize: 15, fontWeight: FontWeight.w400)),
            ],
          ),
          SizedBox(height: 11),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fringilla eleifend purus vel dignissim. Praesent urna ante, iaculis at lobortis eu.',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              maxLines: 3,
              softWrap: true),
          SizedBox(height: 10),
          Row(
            spacing: 16,
            children: [
              SvgPicture.asset('assets/icons/reddish_star.svg', width: 16, height: 16),
              SvgPicture.asset('assets/icons/reddish_star.svg', width: 16, height: 16),
              SvgPicture.asset(svg1, width: 16, height: 16),
              SvgPicture.asset(svg2, width: 16, height: 16),
              SvgPicture.asset(svg3, width: 16, height: 16),
              SizedBox(height: 26),
            ],
          ),
          SizedBox(height: 26),
          Container(width: 353, height: 1, color: AppColors.ReddishPink,)
        ],
      ),
    );
  }
}