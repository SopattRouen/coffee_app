import 'package:coffee_test_1/model/model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(Model mproducts) {
    if (_products.containsKey(mproducts)) {
      _products[mproducts] += 1;
    } else {
      _products[mproducts] = 1;
    }
  }

  get products => _products;
  void removeProduct(Model mproducts) {
    if (_products.containsKey(mproducts) && _products[mproducts] == 1) {
      _products.removeWhere((key, value) => key == mproducts);
    } else {
      _products[mproducts] -= 1;
    }
  }

  get productsubtotal => _products.entries
      .map((mproducts) => mproducts.key.price * mproducts.value)
      .toList();
  get total => _products.entries
      .map((mproducts) => mproducts.key.price * mproducts.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
