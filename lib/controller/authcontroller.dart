import 'dart:developer';
import 'package:coffee_test_1/helper/form.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Ensure this import is correct
import 'package:get/get.dart';

final formController = ClassForm();

class AuthController extends GetxController {
  Future createAccount() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: formController.txtnamee.text.trim(),
        password: formController.txtpasss.text.trim(),
      );
      if (credential != 0) {
        Get.snackbar("Notification", "Account created successfully");
      } else {
        Get.snackbar("Notification", "Failed to create account");
      }
      log("$credential");
    } catch (e) {
      print(e);
    }
  }

  Future signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: formController.txtnamee.text.trim(),
        password: formController.txtpasss.text.trim(),
      );
      if (credential != 0) {
        Get.snackbar("Notification", "Sign in successful");
      } else {
        Get.snackbar("Notification", "Sign in failed");
      }
      log("$credential");
    } catch (e) {
      print(e);
    }
  }

  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }

// Function to get user email and username
}
