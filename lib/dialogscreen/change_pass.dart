import 'package:coffee_test_1/otp/pass_change.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChangPassword extends StatelessWidget {
  const ChangPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => ChangPassWordWidget());
      },
      leading: Icon(
        Icons.key_outlined,
        color: Colors.white,
      ),
      title: Text(
        "Change Password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
