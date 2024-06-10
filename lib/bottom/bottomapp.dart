import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {
  BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomWidget> {
  final List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];
  int visit = 0;
  @override
  Widget build(BuildContext context) {
    return BottomBarCreative(
      items: items,
      iconSize: 32,
      backgroundColor: Colors.green.withOpacity(0.21),
      color: Colors.green,
      colorSelected: Colors.red,
      indexSelected: visit,
      isFloating: true,
      highlightStyle: const HighlightStyle(
          sizeLarge: true, background: Colors.red, elevation: 3),
      onTap: (int index) => setState(() {
        visit = index;
      }),
    );
  }
}
