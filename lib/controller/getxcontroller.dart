import 'package:coffee_test_1/model/model.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0.obs;
  void increase() {
    count++;
  }

  void decrease() {
    count--;
  }

  double total(Model pro) {
    return pro.price * count.value;
  }
}
