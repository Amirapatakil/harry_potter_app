import 'package:flutter/material.dart';
import 'package:harry_potter_app/modules/auth/presentation/widgets/auth_login_field.dart';
import 'package:harry_potter_app/modules/auth/presentation/widgets/auth_screen_bg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          AuthScreenBgg(),
          AuthloginField(),
        ],
      ),
    );
  }
}
