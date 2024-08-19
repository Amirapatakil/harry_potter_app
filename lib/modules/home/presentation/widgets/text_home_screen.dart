import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';

class TextHomeScreen extends StatelessWidget {
  const TextHomeScreen({
    super.key,
    required this.text,
    required this.isStyle,
    required this.isAlign,
  });
  final String text;
  final bool isAlign;
  final bool isStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      child: Align(
        alignment: isAlign ? Alignment.centerLeft : Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: isStyle
              ? AppTextStyle.s25w400.copyWith(color: AppColour.textColor)
              : AppTextStyle.s30w600.copyWith(color: AppColour.textColor),
        ),
      ),
    );
  }
}
