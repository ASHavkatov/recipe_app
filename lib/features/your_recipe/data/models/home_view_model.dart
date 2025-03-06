import 'package:flutter/cupertino.dart';

import '../../../categories/data/models/categories_model.dart';
import '../../../categories/data/repositories/categories_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required CategoriesRepository repo}) : _repo = repo {
    load();
  }

  final CategoriesRepository _repo;

  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  Future<void> load() async {
    try {
      var allCategories = await _repo.fetchCategories();
      categories = allCategories.where((category) => category.id != mainCategory?.id).toList();
    } finally {
      notifyListeners();
    }
  }
}