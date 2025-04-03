class TrendingRecipesModel {
  final int id, categoryId;
  final String title, desc, difficulty;
  final String photo;
  final num rating;
  final int timeRequired;

  TrendingRecipesModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.desc,
    required this.photo,
    required this.rating,
    required this.timeRequired,
    required this.difficulty
  });

  factory TrendingRecipesModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipesModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      desc: json['description'],
      photo: json['photo'],
      rating: json['rating'],
      difficulty: json['difficulty'],
      timeRequired: json['timeRequired'],
    );
  }
}
