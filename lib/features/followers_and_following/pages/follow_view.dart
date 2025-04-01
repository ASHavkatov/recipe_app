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
              return ListView.builder(
                itemCount: state.followers.length,
                itemBuilder: (context, index) {
                  // final user = state.following[index];
                  final user2 = state.followers[index];
                  return Column(
                    children: [
                      // Image.network(user.profilePhoto, width: 50, height: 50, fit: BoxFit.cover),
                      Image.network(user2.profilePhoto, width: 200, height: 200, fit: BoxFit.cover)
                    ],
                  );
                },
              );
            default:
              return const Center(child: Text("Unknown state"));
          }

        },
      ),
    );
  }
}
