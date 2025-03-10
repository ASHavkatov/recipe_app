import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> 36711fb (init commit)
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';

import '../manager/categories_view_model.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.cvm});

<<<<<<< HEAD
  final CategoriesViewModel cvm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cvm,
      builder: (context, _) {
        return Scaffold(
=======
  final   CategoriesCubit cvm;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) => RefreshIndicator(
        onRefresh: context.read<CategoriesCubit>().load,
        child: Scaffold(
>>>>>>> 36711fb (init commit)
          appBar: AppBar(
            leading: Center(
              child: SvgPicture.asset(
                "assets/icons/back-arrow.svg",
              ),
            ),
            title: Text(
              "Categories",
              style: TextStyle(color: AppColors.ReddishPink),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
<<<<<<< HEAD
                  itemCount: cvm.categories.length,
                  itemBuilder: (context, index) {
                    return category_item(
                      cvm: cvm,
                      index: index,
                      image: cvm.categories[index].image,
                      text: cvm.categories[index].title,
=======
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return category_item(
                      index: index,
                      image: state.categories[index].image,
                      text: state.categories[index].title, cvm: cvm,
>>>>>>> 36711fb (init commit)
                    );
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                GoRouter.of(context).go('/profile');
              }, child: Text('data'))
            ],
          ),
<<<<<<< HEAD
        );
      },
=======
        ),
      ),
>>>>>>> 36711fb (init commit)
    );
  }
}
