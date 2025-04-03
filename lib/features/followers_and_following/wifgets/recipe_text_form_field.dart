import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class RecipeTextFormField extends StatelessWidget {
  const RecipeTextFormField({
    super.key,
    required this.text,
    this.size = const Size(355, 34),
    required this.textController,
    this.isNum = false,
  });

  final String text;
  final Size size;
  final TextEditingController textController;
  final bool isNum;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: TextFormField(
        clipBehavior: Clip.hardEdge,
        keyboardType: isNum ? TextInputType.number : TextInputType.text,
        minLines: 2,
        maxLines: 3,
        controller: textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          hintText: text,
          hintStyle: TextStyle(
            color: AppColors.redPinkMain,
            fontFamily: "Poppins",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: AppColors.pink,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
