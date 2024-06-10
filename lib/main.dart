import 'dart:developer';
import 'package:coffee_test_1/mainpage.dart';
import 'package:coffee_test_1/payment/checkout.dart';
import 'package:coffee_test_1/widget.dart/cartwidget.dart';
import 'package:coffee_test_1/widget.dart/product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => log("Ok"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        // "/": (context) => HomeScreen(),
        "cart": (context) => CartWidget(),
        "product": (context) => ProductWidget(),
        "checkout": (context) => CheckoutWidget(),
      },
    );
  }
}
