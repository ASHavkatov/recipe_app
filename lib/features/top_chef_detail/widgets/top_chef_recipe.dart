import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopChefRecipes extends StatelessWidget {
  const TopChefRecipes({super.key, required this.title, required this.image});
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430.w,
      height: 133.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 336.w,
              height: 44.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: 356.w,
              height: 103.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}