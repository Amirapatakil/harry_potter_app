import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:harry_potter_app/modules/auth/presentation/auth_screen.dart';
import 'package:harry_potter_app/core/di/service_locator.dart' as get_it;

GetIt di = GetIt.instance;

void main() {
  get_it.setup(di);
  runApp(const HarryPottersApp());
}

class HarryPottersApp extends StatelessWidget {
  const HarryPottersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter',
      home: const AuthScreen(),
    );
  }
}
