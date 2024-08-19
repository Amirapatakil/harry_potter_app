import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';
import 'package:harry_potter_app/core/common/common_buttin.dart';
import 'package:harry_potter_app/core/common/common_text_form_filed.dart';
import 'package:harry_potter_app/core/validators/emty_text_validators.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.isBack,
    required this.nameController,
    required this.passwordController,
    required this.verifyPasswordController,
    this.validator,
    required this.signUp,
  });
  final Function()? isBack;
  final Function()? signUp;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign up, Wizard',
          style: AppTextStyle.s25w400.copyWith(color: Colors.white),
        ),
        AppDimens.smallPadding.vertical,
        TextFormFieldForm(
          validator: (value) {
            return EmptyValidator().validators(value);
          },
          controller: nameController,
          hinttext: 'Name',
        ),
        AppDimens.smallPadding.vertical,
        TextFormFieldForm(
          validator: validator,
          isHidden: true,
          controller: passwordController,
          hinttext: 'Password',
        ),
        AppDimens.smallPadding.vertical,
        TextFormFieldForm(
          validator: validator,
          isHidden: true,
          controller: verifyPasswordController,
          hinttext: 'Verify your password',
        ),
        AppDimens.mediumPadding.vertical,
        CommonButton(
          onTap: signUp,
          title: 'Sign Up',
        ),
        AppDimens.smallPadding.vertical,
        GestureDetector(
          onTap: isBack,
          child: Text(
            'Back',
            style: AppTextStyle.secondButtonTextStyle
                .copyWith(color: AppColour.buttonText),
          ),
        )
      ],
    );
  }
}
