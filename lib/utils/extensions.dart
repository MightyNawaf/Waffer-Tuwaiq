import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waffer/constants/colors.dart';

extension ScreenSizes on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
//   get getHeight {
//     return MediaQuery.of(this).size.height;
//   }
}

extension ShimmerThisWidget on Widget {
  Widget get shimmered => Shimmer.fromColors(
        baseColor: WColors.blue,
        highlightColor: WColors.green,
        child: this,
      );
}

extension BlurThisWidget on Widget {
  Widget get blurred => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: this,
      );
}
