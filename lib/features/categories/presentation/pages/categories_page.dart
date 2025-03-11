import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';

import '../manager/categories_view_model.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.cvm});
  final CategoriesCubit cvm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) => RefreshIndicator(
        onRefresh: context.read<CategoriesCubit>().load,
        child: Scaffold(
          appBar: AppBar(
            leading: Center(
              child: SvgPicture.asset("assets/icons/back-arrow.svg"),
            ),
            title: const Text(
              "Categories",
              style: TextStyle(color: AppColors.ReddishPink),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return Category_item(
                      cvm: cvm,
                      index: index,
                      image: state.categories[index].image,
                      text: state.categories[index].title,
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/profile');
                },
                child: const Text('Go to Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
