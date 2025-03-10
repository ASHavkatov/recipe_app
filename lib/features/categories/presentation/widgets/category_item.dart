import 'package:flutter/material.dart';

import '../manager/categories_view_model.dart';

// ignore: camel_case_types
class category_item extends StatelessWidget {
  const category_item({
    super.key,
    required this.cvm,
    required this.index, required this.image, required this.text,
  });

  final int index;
<<<<<<< HEAD
  final CategoriesViewModel cvm;
=======
  final CategoriesCubit cvm;
>>>>>>> 36711fb (init commit)
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
<<<<<<< HEAD
            cvm.categories[index].image,
=======
            cvm.state.categories[index].image,
>>>>>>> 36711fb (init commit)
            width: 158,
            height: 145,
            fit: BoxFit.cover,
          ),
        ),
<<<<<<< HEAD
        Text(cvm.categories[index].title),
=======
        Text(cvm.state.categories[index].title),
>>>>>>> 36711fb (init commit)
      ],
    );
  }
}
