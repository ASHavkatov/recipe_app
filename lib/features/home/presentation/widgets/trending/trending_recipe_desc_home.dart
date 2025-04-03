import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';

class TrendingRecipeDescHome extends StatelessWidget {
  const TrendingRecipeDescHome({
    super.key, required this.rating,
  });

  final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 248,
          child: Text(
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
            "This is a quick overview of the ingredients...",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 13, height: 1),
          ),
        ),
        Row(
          children: [
            RecipeRating(rating: rating)
          ],
        )
      ],
    );
  }
}
