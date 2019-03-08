import 'package:flutter/material.dart';

class ImageManager {
  static Image getTabImage(String name) {
    return Image.asset(
      'packages/flutter_app_template/resouces/images/tab/' + name,
      width: 28,
      height: 28,
    );
  }
}

class ColorManager {
  static const Color navColor = Color(0xffff8a00);

  static const Color tabNormal = Color(0xff999999);
  static const Color tabSelected = Color(0xff333333);

  static const Color mainYellow = Color(0xffff8a00);
  static const Color mainBlack = Color(0xff333333);
}
