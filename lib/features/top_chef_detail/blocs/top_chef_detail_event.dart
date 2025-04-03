sealed class TopChefDetailEvent{}

class TopChefDetailLoading extends TopChefDetailEvent{
  final int profileId;
  TopChefDetailLoading({required this.profileId});
}