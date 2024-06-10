import 'package:coffee_test_1/respone/HomeLarge_screen.dart';
import 'package:coffee_test_1/respone/homemeduim_screen.dart';
import 'package:coffee_test_1/respone/homesmall_screen.dart';
import 'package:coffee_test_1/respone/mainrespone.dart';
import 'package:flutter/material.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return Mainresponsive(
      largesreen: HomeLargeScreen(),
      meduimscreen: HomeMeduimScreen(),
      smallscreen: HomeSmallScreen(),
    );
  }
}
