import 'package:flutter/material.dart';
import 'package:new_recipe_app/features/community/data/models/community_model.dart';
import 'package:new_recipe_app/features/community/data/repositories/community_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({required CommunityRepository comRepo}) : _comRepo = comRepo {
    pageController = PageController(initialPage: selectedIndex);
    load();
  }

  final CommunityRepository _comRepo;
  bool isLoading = true;
  int selectedIndex = 0;
  List<String> bottomTitles = ['Top Recipes', 'Newest', 'Oldest'];
  List<List<CommunityModel>> Lists = [[], [], []];
  late PageController pageController;

  void selectCategory(int index) {
    selectedIndex = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

  void onPageChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    Lists[0] = await _comRepo.fetchCommunityRecipes(orderBy: 'rating');
    Lists[1] = await _comRepo.fetchCommunityRecipes(orderBy: 'date');
    Lists[2] = await _comRepo.fetchCommunityRecipes(orderBy: 'date', descending: false);

    isLoading = false;
    notifyListeners();
  }
}
