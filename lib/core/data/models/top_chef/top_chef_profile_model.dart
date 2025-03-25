class TopChefProfileModel {
  final int id, recipeCount, followerCount, followingCount;
  final String profilePhoto;
  final String firstName, lastName, presentation;

  TopChefProfileModel({
    required this.id,
    required this.recipeCount,
    required this.followerCount,
    required this.followingCount,
    required this.profilePhoto,
    required this.lastName,
    required this.firstName,
    required this.presentation,
  });

  factory TopChefProfileModel.fromJson(Map<String, dynamic> json) {
    return TopChefProfileModel(
      id: json['id'],
      recipeCount: json['recipesCount'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      profilePhoto: json['profilePhoto'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      presentation: json['presentation'],
    );
  }
}
