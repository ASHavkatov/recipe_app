import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/features/home/presentation/manager/home_view_model.dart';
import 'package:recipe_app/features/home/presentation/widgets/recently_added_section_item.dart';
import 'package:recipe_app/features/profiles/presentation/widgets/profile_item.dart';

class RecentlyAddedSectionHome extends StatelessWidget {
  const RecentlyAddedSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return switch(vm.isLoading){
      true => Center(child: CupertinoActivityIndicator(),),
    false => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 9,
        children: [
          Text(
            MyLocalizations.of(context)!.recentlyAdded,
            style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecentlyAddedSectionItem(image: vm.recentRecipe[0].image, title: vm.recentRecipe[0].title, desc: vm.recentRecipe[0].desc, rating: 4, duration: 30),
              RecentlyAddedSectionItem(image: vm.recentRecipe[1].image, title: vm.recentRecipe[1].title, desc: vm.recentRecipe[1].desc, rating: 4, duration: 30),
            ],
          )
        ],
      ),
    )
    };
  }
}
