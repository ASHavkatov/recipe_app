class YourRecipeModel {
  final int id, categoryId;
  final String title, desc, difficultly, photo;
  final num rating;
  final int timeRequired;

  YourRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.desc,
    required this.difficultly,
    required this.timeRequired,
    required this.rating,
    required this.photo,
  });

  factory YourRecipeModel.fromJson(Map<String, dynamic> json) {
    return YourRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      desc: json['desc'],
      difficultly: json['difficultly'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      photo: json['photo'],
    );
  }
}
