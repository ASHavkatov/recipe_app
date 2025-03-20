class ChefModel {
  final String username, firstName, lastName;
  final String image;
  final int id;
  ChefModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.id
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) {
    return ChefModel(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
    );
  }
}
