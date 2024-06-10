import 'package:coffee_test_1/postscreen/posts.dart';
import 'package:coffee_test_1/screen/cartscreen.dart';
import 'package:coffee_test_1/screen/homepage.dart';
import 'package:coffee_test_1/screen/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profilescreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CartScreen(),
    ProfileScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: Icon(
      //     Icons.menu,
      //     size: 32,
      //     color: Colors.white,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(
      //         Icons.notifications,
      //         size: 32,
      //         color: Colors.amber,
      //       ),
      //     ),
      //   ],
      // ),
      body: _pages[index],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedIndex: index,
        onDestinationSelected: (int value) {
          setState(() {
            index = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 3,
        elevation: 0,
        hoverColor: Colors.red,
        shape: CircleBorder(),
        backgroundColor: Colors.amber,
        onPressed: () {
          Get.to(PostScreen());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
