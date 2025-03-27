class FollowersAndFollowingModel {
  final int id;
  final String username, firstName, lastName;
  final String profilePhoto;

  FollowersAndFollowingModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  factory FollowersAndFollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowersAndFollowingModel(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePhoto: json['profilePhoto'],
    );
  }
}
