import 'package:flutter/cupertino.dart';

class AppSizes {
  static late double wRatio;
  static late double hRatio;
  static late double bottomNavBarWidth;
  static late double bottomNavBarHeight;
  static late double padding36;  // Remove "final"
  static late double padding38;  // Remove "final"

  static void init(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    wRatio = size.width / 430;
    hRatio = size.height / 932;
    padding36 = 36 * wRatio;  // Now it can be reassigned
    padding38 = 38 * wRatio;  // Now it can be reassigned
    bottomNavBarWidth = 281 * wRatio;
    bottomNavBarHeight = 56 * hRatio;
  }
}
