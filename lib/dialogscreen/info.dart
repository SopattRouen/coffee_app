import 'package:coffee_test_1/dialogscreen/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => InfoWidget());
      },
      leading: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      title: Text(
        "Information",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
