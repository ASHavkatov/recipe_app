import 'package:flutter/material.dart';

import '../manager/categories_view_model.dart';
class Category_item extends StatelessWidget {
  const Category_item({
    super.key,
    required this.cvm,
    required this.index, required this.image, required this.text,
  });

  final int index;
  final CategoriesCubit cvm;
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
            cvm.categories[index].image,
            width: 158,
            height: 145,
            fit: BoxFit.cover,
          ),
        ),
        Text(cvm.categories[index].title),
        Text(cvm.state.categories[index].title),
      ],
    );
  }
}
