import 'package:coffee_test_1/auth/login.dart';
import 'package:coffee_test_1/auth/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showloginscreen = true;
  void toogleScreen() {
    setState(() {
      showloginscreen = !showloginscreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginscreen) {
      return Login_Page(showRegisterscreen: toogleScreen);
    } else {
      return RegisterPage(showLoginscreen: toogleScreen);
    }
  }
}
