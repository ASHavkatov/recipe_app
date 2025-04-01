import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/followers_and_following_model/followers_and_following_model.dart';

enum FollowAndFollowerStatus { idle, loading, error, success }

class FollowState extends Equatable{
  final List<FollowersAndFollowingModel> followers;
  final List<FollowersAndFollowingModel> following;
  final FollowAndFollowerStatus status;

  const FollowState({
    required this.followers,
    required this.following,
    required this.status,
  });

  factory FollowState.initial() {
    return const FollowState(
      followers: [],
      following: [],
      status: FollowAndFollowerStatus.idle,
    );
  }

  FollowState copyWith({
    List<FollowersAndFollowingModel>? followers,
    List<FollowersAndFollowingModel>? following,
    FollowAndFollowerStatus? status,
  }) {
    return FollowState(
      followers: followers ?? this.followers,
      following: following ?? this.following,
      status: status ?? this.status,
    );
  }
  @override
  List<Object?> get props => [];
}
