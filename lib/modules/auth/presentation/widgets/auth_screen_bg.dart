import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_assets.dart';

class AuthScreenBgg extends StatelessWidget {
  const AuthScreenBgg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.authScreenBg,
          ),
        ),
      ),
    );
  }
}
