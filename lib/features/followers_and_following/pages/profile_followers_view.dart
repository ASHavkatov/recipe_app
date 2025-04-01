import 'package:flutter/material.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/followers_and_following/wifgets/follow_user.dart';
import 'package:recipe_app/features/followers_and_following/wifgets/recipe_text_form_field.dart';

import '../wifgets/followers_app_bar.dart';

class ProfileFollowersView extends StatelessWidget {
  const ProfileFollowersView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: FollowersAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
          child: TabBarView(
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  RecipeTextFormField(text: "Search", textController: searchController),
                  SizedBox(
                    height: 20,
                  ),
                  FollowUser(
                    userName: "neil_t",
                    name: "neil_trant",
                    userImage: "assets/image/andrew.png",
                    following: true,
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 10),
                  RecipeTextFormField(text: "Search", textController: searchController),
                  SizedBox(
                    height: 20,
                  ),
                  FollowUser(
                    userName: "neil_t",
                    name: "neil_trant",
                    userImage: "assets/image/andrew.png",
                    following: false,
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
