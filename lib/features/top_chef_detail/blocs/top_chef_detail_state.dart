import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/top_chef/top_chef_profile_model.dart';

enum TopChefDetailStatus { idle, loading, error, success }

class TopChefDetailState extends Equatable{
  final TopChefProfileModel? chefProfileModel;
  final TopChefDetailStatus status;

  const TopChefDetailState({
    required this.chefProfileModel,
    required this.status,
  });

  factory TopChefDetailState.initial() {
    return TopChefDetailState(
      chefProfileModel: null,
      status: TopChefDetailStatus.idle,
    );
  }

  TopChefDetailState copyWith({TopChefProfileModel? chefProfileModel, TopChefDetailStatus? topChefDetailStatus}) {
    return TopChefDetailState(
      chefProfileModel: chefProfileModel ?? this.chefProfileModel,
      status: topChefDetailStatus ?? this.status,
    );
  }
  @override
  List<Object?> get props => [chefProfileModel,status];
}
