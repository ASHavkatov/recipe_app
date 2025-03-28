import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/core.dart';

import '../../../features/categories/data/models/categories_model.dart';
import '../../../features/categories/presentation/widgets/recipe_appbar_action.dart';
import '../../../features/categories/presentation/widgets/recipe_icon_button.dart';
import '../../routing/routes.dart';

class RecipeAppbarCatDetail extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppbarCatDetail({
    super.key,
    required this.title,
    required this.categories,
    required this.selected,
  });

  final String title;
  final List<CategoryModel> categories;
  final CategoryModel selected;

  @override
  Size get preferredSize => const Size(double.infinity, 132);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38, vertical: 0),
      child: AppBar(
        backgroundColor: AppColors.beigeColor,
        toolbarHeight: 132,
        leadingWidth: 20,
        leading: RecipeIconButton(
          callback: () => context.go(Routes.categories),
          image: "assets/svg/arrow.svg",
          width: 30,
          height: 14,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.appBarTitleStyle,
        ),
        actions: [
          RecipeAppBarAction(
            image: "assets/svg/notification.svg",
            color: AppColors.pinkSub,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeAppBarAction(
            image: "assets/svg/search.svg",
            color: AppColors.pinkSub,
            callback: () {},
          )
        ],
        bottom: CategoriesHorizontalScrollBar(
          categories: categories,
          selected: selected,
        ),
      ),
    );
  }
}

class CategoriesHorizontalScrollBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesHorizontalScrollBar({
    super.key,
    required this.categories,
    required this.selected,
  });

  final List<CategoryModel> categories;
  final CategoryModel selected;

  @override
  Size get preferredSize => const Size(double.infinity, 30);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoriesHorizontalBarItem(
          category: categories[index],
          selected: categories[index].id == selected.id,
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    );
  }
}

class CategoriesHorizontalBarItem extends StatelessWidget {
  const CategoriesHorizontalBarItem({
    super.key,
    required this.category,
    required this.selected,
  });

  final CategoryModel category;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go('/categories/detail', extra: category),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10),
        foregroundColor: selected ? Colors.white : AppColors.redPinkMain,
        backgroundColor: selected ? AppColors.redPinkMain : Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      child: Text(
        category.title,
        style: TextStyle(
          fontFamily: 'League Spartan',
          fontSize: 16,
        ),
      ),
    );
  }
}
