import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';
import 'package:harry_potter_app/core/assets/app_dimens.dart';
import 'package:harry_potter_app/core/assets/app_textstyles.dart';
import 'package:harry_potter_app/core/common/common_message.dart';
import 'package:harry_potter_app/core/extension/widget_extension.dart';
import 'package:harry_potter_app/core/service/shared_prefs.dart';
import 'package:harry_potter_app/core/validators/emty_text_validators.dart';
import 'package:harry_potter_app/modules/auth/presentation/widgets/auth_sign_in_form.dart';
import 'package:harry_potter_app/modules/auth/presentation/widgets/auth_sign_up_form.dart';
import 'package:harry_potter_app/modules/home/presentation/home_screen.dart';

class AuthloginField extends StatefulWidget {
  const AuthloginField({super.key});

  @override
  State<AuthloginField> createState() => _AuthloginFieldState();
}

class _AuthloginFieldState extends State<AuthloginField> {
  late String finalUserName;
  late String finalPassword;

  final _key = GlobalKey<FormState>();
  final _isSignInForm = ValueNotifier<bool>(true);
  final nameControllerIn = TextEditingController();
  final passwordControllerIn = TextEditingController();
  final nameControllerP = TextEditingController();
  final passwordControllerP = TextEditingController();
  final verifyPasswordControllerP = TextEditingController();
  String? userName;
  String? passwordOne;

  @override
  void dispose() {
    nameControllerIn.dispose();
    passwordControllerIn.dispose();
    nameControllerP.dispose();
    passwordControllerP.dispose();
    verifyPasswordControllerP.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isSignInForm,
      builder: (context, value, child) {
        return ListView(children: [
          Padding(
            padding: AppDimens.mediumPadding.symmetricHorizontal,
            child: Column(
              children: [
                AppDimens.largePadding.vertical,
                Text(
                  'Welcome to Hogwatrts!',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.s36w800.copyWith(
                    color: AppColour.textColor,
                  ),
                ),
                AppDimens.mainPadding.vertical,
                Container(
                  padding: AppDimens.containerPadding.all,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppDimens.containerRadius,
                    ),
                    color: Colors.grey.withOpacity(0.15),
                  ),
                  child: Form(
                    key: _key,
                    child: value
                        ? SignInForm(
                            validator: (value) {
                              return EmptyValidator().validators(value);
                            },
                            isSignIn: () async {
                              _key.currentState?.validate();
                              if (_key.currentState?.validate() ?? false) {
                                userName = await SharedPrefs().read(
                                  key: PrefsKeys.user,
                                );
                                passwordOne = await SharedPrefs().read(
                                  key: PrefsKeys.password,
                                );
                                setState(() {
                                  finalUserName = userName ?? '';
                                  finalPassword = passwordOne ?? '';
                                });
                                log(finalUserName);
                                log(finalPassword);

                                if (finalUserName == nameControllerIn.text &&
                                    finalPassword ==
                                        passwordControllerIn.text) {
                                  FlutterToast()
                                      .message('Auth gone successful.');
                                  Navigator.push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      const HomeScreen().route);
                                }
                              }
                              if (finalUserName != nameControllerIn.text &&
                                  finalPassword != passwordControllerIn.text) {
                                FlutterToast()
                                    .message('You are not registered!');
                              } else {
                                FlutterToast().message('Invalid');
                              }
                            },
                            isSignUp: () {
                              _isSignInForm.value = false;
                            },
                            nameController: nameControllerIn,
                            passwordController: passwordControllerIn,
                          )
                        : SignUpForm(
                            validator: (value) {
                              final emptyError =
                                  EmptyValidator().validators(value);
                              if (emptyError != null) {
                                return emptyError; // Если есть ошибка, возвращаем её
                              }
                              if (passwordControllerP.text !=
                                  verifyPasswordControllerP.text) {
                                return 'Passwords does not match!';
                              } // Если обе проверки пройдены, возвращаем null
                              return null;
                            },
                            signUp: () async {
                              _key.currentState?.validate();
                              if (_key.currentState?.validate() ?? false) {
                                SharedPrefs().save(
                                    key: PrefsKeys.user,
                                    value: nameControllerP.text);
                                SharedPrefs().save(
                                    value: passwordControllerP.text,
                                    key: PrefsKeys.password);
                                userName = await SharedPrefs().read(
                                  key: PrefsKeys.user,
                                );
                                passwordOne = await SharedPrefs().read(
                                  key: PrefsKeys.password,
                                );
                                FlutterToast().message('You are registered!');
                                _isSignInForm.value = true;
                              }
                            },
                            isBack: () {
                              _isSignInForm.value = true;
                            },
                            nameController: nameControllerP,
                            passwordController: passwordControllerP,
                            verifyPasswordController: verifyPasswordControllerP,
                          ),
                  ),
                )
              ],
            ),
          ),
        ]);
      },
    );
  }
}
