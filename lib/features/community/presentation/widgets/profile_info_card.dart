import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/community_view_model.dart';
import 'minus_date.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key, required this.photo, required this.username, required this.created});

  final String photo;
  final String username, created;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<CommunityViewModel>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: CachedNetworkImage(
            imageUrl: photo,
            width: 46,
            height: 46,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            Text(
              MinusDate(created),
              style: TextStyle(
                color: AppColors.PinkSub,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }
}
