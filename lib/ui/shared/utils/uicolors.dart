import 'package:flutter/material.dart';

class UiColors {
  static const Color bg = Color(0xFF353A76);
  static const Color darkbg = Color(0xFF202448);

  static Color backgroundColor(bool themedark) {
    return themedark ? darkbg : bg;
  }
}
