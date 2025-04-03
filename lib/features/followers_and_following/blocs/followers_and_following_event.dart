part of 'followers_and_following_bloc.dart';

sealed class FollowEvent{}
class FollowLoading extends FollowEvent{
  final int userId;
  FollowLoading({required this.userId});
}
