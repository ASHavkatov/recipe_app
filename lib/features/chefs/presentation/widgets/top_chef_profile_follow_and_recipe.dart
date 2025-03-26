import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/chefs/blocs/top_chef_bloc.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chef_follow_and_follower.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_bloc.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_event.dart';

import '../../../../core/utils/colors.dart';
import '../../../top_chef_detail/blocs/top_chef_detail_state.dart';

class TopChefProfileFollowAndRecipe extends StatelessWidget {
  const TopChefProfileFollowAndRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefDetailBloc, TopChefDetailState>(builder: (context, state){
      if (state is TopChefDetailLoading) {
        return const Center(child: CircularProgressIndicator());
      } else{
       return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.pink),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopChefFollowAndFollower(number: state.chefProfileModel!.recipeCount.toString(), title: 'recipe'),
              Container(width: 1, height: 26, color: AppColors.pink),
              TopChefFollowAndFollower(number: state.chefProfileModel!.followingCount.toString(), title: 'Following'),
              Container(width: 1, height: 26, color: AppColors.pink),
              TopChefFollowAndFollower(number: state.chefProfileModel!.followerCount.toString(), title: 'Followers')
            ],
          ),
        );
      }
    });
  }
}
