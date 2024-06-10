import 'package:coffee_test_1/controller/cartcontroller.dart';
import 'package:coffee_test_1/payment/checkout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartWidgetBottom extends StatelessWidget {
  CartWidgetBottom({super.key});
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Get.to(() => CheckoutWidget());
        },
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(
                20,
              )),
          alignment: Alignment.center,
          child: Text(
            "Check Out",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
