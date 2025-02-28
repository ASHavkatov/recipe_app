class RecipeDetailUserModel {
  final int id;
  final String profilePhoto, userName, firstName, lastName;

  RecipeDetailUserModel({
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.firstName,
    required this.lastName,
  });

  factory RecipeDetailUserModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      userName: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
