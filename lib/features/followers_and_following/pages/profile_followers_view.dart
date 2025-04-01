import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/followers_and_following/blocs/followers_and_following_bloc.dart';
import 'package:recipe_app/features/followers_and_following/blocs/followers_and_following_state.dart';
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
        body: BlocBuilder<FollowBloc, FollowState>(
          builder: (context, state) {
            switch (state.status) {
              case FollowAndFollowerStatus.idle:
                return Center(child: Text("malumot topilmadi"));
              case FollowAndFollowerStatus.loading:
                return Center(child: CircularProgressIndicator());
              case FollowAndFollowerStatus.error:
                return Text("malumotlarni olib kelishda hatolik bor");
              case FollowAndFollowerStatus.success:
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: state.following.length,
                        itemBuilder: (context, index) {
                          final user = state.following[index];
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              RecipeTextFormField(text: "Search", textController: searchController),
                              SizedBox(
                                height: 20,
                              ),
                              FollowUser(
                                userName: user.username,
                                name: user.firstName,
                                userImage: user.profilePhoto,
                                following: true,
                              )
                            ],
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: state.followers.length,
                        itemBuilder: (context, index) {
                          final user = state.followers[index];
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              RecipeTextFormField(text: "Search", textController: searchController),
                              SizedBox(
                                height: 20,
                              ),
                              FollowUser(
                                userName: user.username,
                                name: user.firstName,
                                userImage: user.profilePhoto,
                                following: true,
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
            }
          },
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
