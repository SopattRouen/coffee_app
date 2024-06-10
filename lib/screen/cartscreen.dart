import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_test_1/controller/cartcontroller.dart';
import 'package:coffee_test_1/model/model.dart';
import 'package:coffee_test_1/widget.dart/cartwidget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping with us"),
        actions: [
          InkWell(
              onTap: () {
                Get.to(() => CartWidget());
              },
              child: Icon(Icons.shopping_cart)),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 15,
            //     vertical: 35,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Shop with Us",
            //         style: TextStyle(
            //           fontSize: 24,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           Get.to(() => CartWidget());
            //         },
            //         child: Icon(
            //           Icons.shopping_cart,
            //           size: 26,
            //           color: Colors.amber,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Model.model.length,
                itemBuilder: ((context, index) {
                  return AddtoCart(index: index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddtoCart extends StatefulWidget {
  AddtoCart({super.key, required this.index});
  final int index;

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final addtocart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final product = Model.model[widget.index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.23,
        // color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${product.title}"),
                    Text(
                      "${product.des}",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(
                          0.7,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (addtocart == 0) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'Hello!',
                                  titleTextStyle: TextStyle(fontSize: 25),
                                  desc: 'Error',
                                  descTextStyle: TextStyle(fontSize: 23),
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                )..show();
                              } else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'Hello!',
                                  titleTextStyle: TextStyle(fontSize: 25),
                                  desc: 'Success',
                                  descTextStyle: TextStyle(fontSize: 23),
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                )..show();
                                addtocart.addProduct(product);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("${product.image}"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
