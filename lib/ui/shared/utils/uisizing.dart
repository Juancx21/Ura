import 'package:flutter/material.dart';

class UiSizing {
  static double wScreen(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double hScreen(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double hStatusbar(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  static double pwidth(BuildContext context, double width) =>
      width / wScreen(context);
  static double pheight(BuildContext context, double height) =>
      height / hScreen(context);
}
