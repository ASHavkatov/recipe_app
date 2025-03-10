import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_recipe_app/core/routess.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';
import 'package:new_recipe_app/features/community/presentation/widgets/like_button.dart';


class CommunityCard extends StatelessWidget {
  const CommunityCard({
    super.key,
    required this.photo,
    required this.title,
    required this.description,
    required this.rating,
    required this.timeRequired,
    required this.reviewsCount, required this.recipe,
  });
  final String photo;
  final String title;
  final String description;
  final int rating;
  final int timeRequired;
  final int reviewsCount;
  final int recipe;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.ReddishPink,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                topLeft: Radius.circular(14),
              ),
              child: GestureDetector(
                onTap: (){},
                child: CachedNetworkImage(
                  imageUrl: photo,
                  width: double.infinity,
                  height: 173,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 11,
            right: 11,
            child: LikeButton(),
          ),
          Positioned(
            left: 15,
            bottom: 50,
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/icons/star.svg',
                  colorFilter: ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                left: 15,
                right: 15,
                bottom: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400,),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              '$timeRequired min',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              reviewsCount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset('assets/icons/izoh.svg'),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
