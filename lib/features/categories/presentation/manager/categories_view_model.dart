<<<<<<< HEAD
import 'package:flutter/cupertino.dart';

import '../../data/models/categories_model.dart';
import '../../data/repositories/categories_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required CategoriesRepository repo}) : _repo = repo {
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/categories_model.dart';
import '../../data/repositories/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoriesRepository repo})
      : _repo = repo,
        super(
          CategoriesState(categories: [], mainCategory: null, status: CategoriesStatus.loading),
        ) {
>>>>>>> 36711fb (init commit)
    load();
  }

  final CategoriesRepository _repo;

<<<<<<< HEAD
  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  Future<void> load() async {
    try {
      var allCategories = await _repo.fetchCategories();
      mainCategory = allCategories.where((category) => category.main).firstOrNull;
      categories = allCategories.where((category) => category.id != mainCategory?.id).toList();
    } finally {
      notifyListeners();
    }
=======
  Future<void> load() async {
    final allCategories = await _repo.fetchCategories();
    emit(
      CategoriesState(
          categories: allCategories.where((category) => !category.main).toList(),
          mainCategory: allCategories.firstWhere((category) => category.main),
          status: CategoriesStatus.idle),
    );
>>>>>>> 36711fb (init commit)
  }
}
