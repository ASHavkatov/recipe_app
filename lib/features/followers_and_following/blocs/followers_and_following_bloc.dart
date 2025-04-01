import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/data/repositories/follow_and_following_repository.dart';
import 'package:recipe_app/features/followers_and_following/blocs/followers_and_following_state.dart';

part 'followers_and_following_event.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final FollowersAndFollowingRepository _repo;

  FollowBloc({
    required FollowersAndFollowingRepository repo,
    required int userId,
  })  : _repo = repo,
        super(FollowState.initial()) {
    on<FollowLoading>(_onLoad);
    add(FollowLoading(userId: userId));
  }

  Future<void> _onLoad(FollowLoading event, Emitter<FollowState> emit) async {
    emit(state.copyWith(status: FollowAndFollowerStatus.loading));

    try {
      final follow = await Future.wait([
        _repo.fetchFollowers(event.userId),
        _repo.fetchFollowing(event.userId),
      ]);
      emit(
        state.copyWith(
          followers: follow[0],
          following: follow[1],
          status: FollowAndFollowerStatus.success,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint("Xatolik yuz berdi: $e");
      debugPrint("StackTrace: $stackTrace");

      emit(state.copyWith(status: FollowAndFollowerStatus.error));
    }
  }
}
