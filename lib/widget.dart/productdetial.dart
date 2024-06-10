// import 'package:demo_app/controller/cartcontroller.dart';
import 'package:coffee_test_1/model/model.dart';
import 'package:coffee_test_1/widget.dart/detial.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ProductDetailWidget extends StatefulWidget {
  ProductDetailWidget({super.key, required this.productmodel});
  final Model productmodel;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  // final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("${widget.productmodel.image}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.amber,
                              size: 32,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.coffee_outlined,
                              color: Colors.amber,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 27, 1, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                      color: Colors.grey.withOpacity(0.9),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    DetialWidget(pro: widget.productmodel),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
