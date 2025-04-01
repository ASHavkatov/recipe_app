part of 'followers_and_following_bloc.dart';

@immutable
sealed class FollowEvent extends Equatable {
  const FollowEvent();

  @override
  List<Object?> get props => [];
}

class LoadFollowAndFollower extends FollowEvent {
  final int userId;
  const LoadFollowAndFollower( this.userId);

  @override
  List<Object?> get props => [userId];
}

class ToggleFollow extends FollowEvent {
  final int userId;
  const ToggleFollow(this.userId);

  @override
  List<Object?> get props => [userId];
}

class FollowBack extends FollowEvent {
  final int userId;
  const FollowBack(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UnFollow extends FollowEvent {
  final int userId;
  const UnFollow(this.userId);

  @override
  List<Object?> get props => [userId];
}
