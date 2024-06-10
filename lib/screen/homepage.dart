import 'package:coffee_test_1/widget.dart/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List categary = [
    "Cappucino",
    "Coffee",
    "Ice Latte",
  ];
  bool isClick = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find the best \n\tcoffee for you",
              style: TextStyle(
                fontSize: 38,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 200,
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search what you want...",
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ProductWidget(),
          ],
        ),
      ),
    ));
  }
}
