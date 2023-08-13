import 'package:flutter/material.dart';

extension ScreenSizes on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
//   get getHeight {
//     return MediaQuery.of(this).size.height;
//   }
}