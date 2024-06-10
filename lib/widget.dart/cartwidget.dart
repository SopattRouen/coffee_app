import 'package:coffee_test_1/bottom/cartwidgetbottom.dart';
import 'package:coffee_test_1/controller/cartcontroller.dart';
import 'package:coffee_test_1/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWidget extends StatelessWidget {
  CartWidget({super.key});
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 69, 77),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(color: Colors.white),
          title: Text(
            "Your Cart",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.favorite,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: controller.products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CartAdd(
                controller: controller,
                index: index,
                quentity: controller.products.values.toList()[index],
                model: controller.products.keys.toList()[index],
              );
            },
          ),
        ),
        bottomNavigationBar: CartWidgetBottom(),
      ),
    );
  }
}

class CartAdd extends StatelessWidget {
  const CartAdd({
    super.key,
    required this.controller,
    required this.model,
    required this.index,
    required this.quentity,
  });
  final CartController controller;
  final Model model;
  final int index;
  final int quentity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[200],
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("${model.image}"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${model.title}",
                          ),
                          Text(
                            "\$${model.price}",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.addProduct(Model.model[index]);
                      },
                      child: Icon(
                        CupertinoIcons.add_circled,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${quentity}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        controller.removeProduct(Model.model[index]);
                      },
                      child: Icon(
                        CupertinoIcons.minus_circle,
                        size: 32,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
