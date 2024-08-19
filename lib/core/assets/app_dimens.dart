import 'package:flutter/material.dart';

abstract class AppDimens {
  static const double smallPadding = 8;
  static const double mediumPadding = 15;
  static const double bigPadding = 32;
  static const double largePadding = 64;
  static const double hugePadding = 100;
  static const double elButtonHeight = 60;
  static const double elButtonRadius = 20;
  static const double textFormFieldRadius = 15;
  static const double containerRadius = 20;
  static const double mainPadding = 270;
  static const double containerPadding = 20;
}

extension DoubleExtension on double {
  Widget get vertical => SizedBox(
        height: this,
      );
  Widget get horizontal => SizedBox(
        width: this,
      );

  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get symmetricHorizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get symmetricVertical => EdgeInsets.symmetric(vertical: this);
}

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
