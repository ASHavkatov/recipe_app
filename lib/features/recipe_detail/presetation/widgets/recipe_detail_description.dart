import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/recipe_detail_view_model.dart';

class RecipeDetailDescription extends StatelessWidget {
  const RecipeDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                      color: AppColors.ReddishPink,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 15),
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('${vm.recipe.timeRequired} min'),
                ],
              ),
              SizedBox(height: 5),
              Text(
                vm.recipe.description,
                softWrap: true,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );

  }
}