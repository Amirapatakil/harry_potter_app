import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, this.onTap, required this.title});
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: AppDimens.elButtonHeight,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade100.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(
              AppDimens.elButtonRadius,
            ),
            gradient: LinearGradient(
              colors: [
                AppColour.buttonFirstColor.withOpacity(0.5),
                AppColour.buttonSecondColor.withOpacity(0.5)
              ],
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.bottonTextStyle.copyWith(
                color: AppColour.buttonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
