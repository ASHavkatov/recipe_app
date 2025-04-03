import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/data/models/top_chef/top_chef_model.dart';

enum TopChefsStatus { idle, loading, error, success }

class TopChefsState extends Equatable {
  final List<ChefModel> mostViewedChefs;
  final TopChefsStatus mostViewedChefsStatus;
  final List<ChefModel> mostLikedChefs;
  final TopChefsStatus mostLikedChefsStatus;
  final List<ChefModel> newChefs;
  final TopChefsStatus newChefsStatus;

  const TopChefsState({
    required this.mostViewedChefs,
    required this.mostLikedChefs,
    required this.newChefs,
    required this.mostViewedChefsStatus,
    required this.mostLikedChefsStatus,
    required this.newChefsStatus
  });

  factory TopChefsState.initial(){
    return TopChefsState(
      mostViewedChefs: [],
      mostLikedChefs: [],
      newChefs: [],
      mostViewedChefsStatus: TopChefsStatus.idle,
      mostLikedChefsStatus: TopChefsStatus.idle,
      newChefsStatus: TopChefsStatus.idle,
    );
  }

  TopChefsState copyWith({
    List<ChefModel>? mostViewedChefs,
    List<ChefModel>? mostLikedChefs,
    List<ChefModel>? newChefs,
    TopChefsStatus? mostViewedChefsStatus,
    TopChefsStatus? mostLikedChefsStatus,
    TopChefsStatus? newChefsStatus,
  }) {
    return TopChefsState(
      mostViewedChefs: mostViewedChefs ?? this.mostViewedChefs,
      mostLikedChefs: mostLikedChefs ?? this.mostLikedChefs,
      newChefs: newChefs ?? this.newChefs,
      mostViewedChefsStatus: mostViewedChefsStatus ?? this.mostViewedChefsStatus,
      mostLikedChefsStatus: mostLikedChefsStatus?? this.mostLikedChefsStatus,
      newChefsStatus: newChefsStatus ?? this.newChefsStatus,);
  }
  @override
  List<Object?>get props =>[
    mostViewedChefs,
    mostLikedChefs,
    newChefs,
    mostViewedChefsStatus,
    mostLikedChefsStatus,
    newChefsStatus,
  ];
}