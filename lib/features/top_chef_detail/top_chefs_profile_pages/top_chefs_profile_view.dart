import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chef_app_bar.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_bloc.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_state.dart';
import 'package:recipe_app/features/top_chef_detail/widgets/top_chef_recipe.dart';

import '../widgets/top_chef_detail_follower_container.dart';
import '../widgets/top_chef_detail_profile_info.dart';

class TopChefsProfileView extends StatelessWidget {
  const TopChefsProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: TopChefAppBar(title: 'Chefs'),
      body: BlocBuilder<TopChefDetailBloc, TopChefDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case TopChefDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case TopChefDetailStatus.error:
              return const Center(child: Text("Xatolik yuz berdi!"));

            case TopChefDetailStatus.success:
              return state.chefProfileModel != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
                      child: Column(
                        children: [
                          TopChefDetailProfileInfo(
                            image: state.chefProfileModel!.profilePhoto,
                            name: state.chefProfileModel!.firstName,
                            desc: state.chefProfileModel!.presentation,
                          ),
                          SizedBox(height: 13.h),
                          TopChefDetailFollowerContainer(
                            recipe: state.chefProfileModel!.recipeCount.toString(),
                            following: state.chefProfileModel!.followingCount.toString(),
                            follower: state.chefProfileModel!.followerCount.toString(),
                          ),
                          SizedBox(height: 13.h),
                          Text('Recipes', style: TextStyle(color: Colors.white, fontSize: 12)),
                          Container(width: double.infinity, height: 1, color: AppColors.redPinkMain,),
                          SizedBox(height: 20.h),
                          TopChefRecipes(title: 'Vegan Recipes', image: 'assets/images/salat.jpg',),
                          SizedBox(height: 20.h),
                          TopChefRecipes(title: 'Asian Heritage', image: 'assets/images/salat.jpg',),
                          SizedBox(height: 20.h),
                          TopChefRecipes(title: 'Guilty Pleasures', image: 'assets/images/salat.jpg',)

                        ],
                      ),
                    )
                  : const Center(child: Text("Ma'lumot topilmadi"));
            default:
              return const Center(child: Text("Ma'lumot yuklanmoqda..."));
          }
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}

