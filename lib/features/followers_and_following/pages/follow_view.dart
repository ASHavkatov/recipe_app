import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/followers_and_following/blocs/followers_and_following_bloc.dart';
import 'package:recipe_app/features/followers_and_following/blocs/followers_and_following_state.dart';

class FollowView extends StatelessWidget {
  const FollowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FollowBloc, FollowState>(
        builder: (context, state) {
          switch (state.status) {
            case FollowAndFollowerStatus.idle:
              return const Center(child: Text("No data available"));
            case FollowAndFollowerStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case FollowAndFollowerStatus.error:
              return const Center(child: Text("An error occurred"));
            case FollowAndFollowerStatus.success:
              if (state.following.isEmpty) {
                return const Center(child: Text("No following users"));
              }
              return ListView.builder(
                itemCount: state.following.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(state.following[index].profilePhoto),
                    ),
                    title: Text(state.following[index].username),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
