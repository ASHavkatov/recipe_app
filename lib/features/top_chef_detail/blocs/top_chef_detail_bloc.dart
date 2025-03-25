import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/data/repositories/top_chef_repository.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_event.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_state.dart';

class TopChefDetailBloc extends Bloc<TopChefDetailEvent, TopChefDetailState> {
  final ChefRepository _repo;

  TopChefDetailBloc({
    required ChefRepository repo,
    required int profileId,
  })  : _repo = repo,
        super(TopChefDetailState.initial()) {
    on<TopChefDetailLoading>(_onLoad);
    add(TopChefDetailLoading(profileId: profileId));
  }

  Future<void> _onLoad(TopChefDetailLoading event, Emitter<TopChefDetailState> emit) async {
    emit(state.copyWith(
      topChefDetailStatus: TopChefDetailStatus.loading,
    ));
    final topChefDetail = await _repo.fetchTopChefProfile(event.profileId);
    emit(state.copyWith(chefProfileModel: topChefDetail, topChefDetailStatus: TopChefDetailStatus.idle));
  }
}
