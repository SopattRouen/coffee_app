import 'package:coffee_test_1/dialogscreen/up_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Upgrade extends StatelessWidget {
  const Upgrade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => Update_Widget());
      },
      leading: Icon(
        Icons.update,
        color: Colors.white,
      ),
      title: Text(
        "Upgrade",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
