import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/core.dart';

class TrendingRecipeTitleHome extends StatelessWidget {
  const TrendingRecipeTitleHome({
    super.key, required this.time, required this.color,
  });

  final int time;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Salami and cheese pizza",
        style: TextStyle(
            color: color, fontWeight: FontWeight.w500, fontSize: 13),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RecipeTime(time: time)
          ]
      ),
    ]
    );
  }
}
