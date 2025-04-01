import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/data/repositories/follow_and_following_repository.dart';
import 'package:recipe_app/features/followers_and_following/blocs/followers_and_following_state.dart';

part 'followers_and_following_event.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final FollowersAndFollowingRepository _repo;

  FollowBloc({required FollowersAndFollowingRepository repo, required int userId})
      : _repo = repo,
        super(FollowState.initial()) {
    on<LoadFollowAndFollower>(_onLoad);
    on<ToggleFollow>(_toggleFollow);

    add(LoadFollowAndFollower(userId));
  }

  Future<void> _onLoad(LoadFollowAndFollower event, Emitter<FollowState> emit) async {
    emit(state.copyWith(status: FollowAndFollowerStatus.loading));

    try {
      final followers = await _repo.fetchFollowers(event.userId);
      final following = await _repo.fetchFollowing(event.userId);

      emit(state.copyWith(
        followers: followers,
        following: following,
        status: FollowAndFollowerStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FollowAndFollowerStatus.error,
      ));
    }
  }
  
  Future<void> _toggleFollow(ToggleFollow event, Emitter<FollowState> emit) async {
    emit(state.copyWith(status: FollowAndFollowerStatus.loading));

    try {
      await _repo.unFollow(event.userId);

      final followers = await _repo.fetchFollowers(event.userId);
      final following = await _repo.fetchFollowing(event.userId);

      emit(state.copyWith(
        followers: followers,
        following: following,
        status: FollowAndFollowerStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FollowAndFollowerStatus.error,
      ));
    }
  }
}
