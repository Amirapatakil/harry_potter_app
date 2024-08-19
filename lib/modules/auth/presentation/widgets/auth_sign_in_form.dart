import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';
import 'package:harry_potter_app/core/common/common_buttin.dart';
import 'package:harry_potter_app/core/common/common_text_form_filed.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.isSignUp,
    required this.isSignIn,
    required this.nameController,
    required this.passwordController,
    this.validator,
  });
  final Function()? isSignUp;
  final Function()? isSignIn;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Who are you, Wizard?',
          style: AppTextStyle.s25w400.copyWith(color: Colors.white),
        ),
        AppDimens.bigPadding.vertical,
        TextFormFieldForm(
          validator: validator,
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
        AppDimens.mediumPadding.vertical,
        CommonButton(
          onTap: isSignIn,
          title: 'Sign In',
        ),
        AppDimens.smallPadding.vertical,
        GestureDetector(
          onTap: isSignUp,
          child: Text(
            'Sign Up',
            style: AppTextStyle.secondButtonTextStyle
                .copyWith(color: AppColour.buttonText),
          ),
        )
      ],
    );
  }
}
