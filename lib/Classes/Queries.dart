import 'package:flutter/material.dart';

class Queries {
  static double ScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double ScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
