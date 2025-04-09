import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../categories/presentation/widgets/recipe_icon_button.dart';
import '../../../categories_detail/presentation/widgets/recipe_icon_button_container.dart';

class RecipeCreateInstructionItem extends StatelessWidget {
  const RecipeCreateInstructionItem({
    super.key,
    required this.callback,
    required this.instController,
    required this.index,
  });

  final int index;
  final VoidCallback callback;
  final TextEditingController instController;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReorderableDragStartListener(
          index: index,
          child: RecipeIconButton(
            image: 'assets/icons/three_dots.svg',
            width: 6,
            height: 28,
            callback: () {},
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: instController,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Instruction ${index + 1}",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              filled: true,
              fillColor: AppColors.pink,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),
        RecipeIconButtonContainer(
          image: 'assets/svg/delete.svg',
          callback: callback,
          iconWidth: 30,
          iconHeight: 30,
          containerHeight: 56,
          containerWidth: 56,
        ),
      ],
    );
  }
}
