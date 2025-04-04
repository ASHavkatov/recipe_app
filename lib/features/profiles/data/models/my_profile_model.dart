class MyProfileModel {
  final int id;
  final String image;
  final String username;
  final String firstname,lastname;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  MyProfileModel({
    required this.id,
    required this.image,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      id: json['id'],
      image: json['profilePhoto'],
      username: json['username'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      presentation: json['presentation'],
      recipesCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount'],
    );
  }
}