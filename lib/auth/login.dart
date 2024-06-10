import 'package:coffee_test_1/controller/authcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_Page extends StatefulWidget {
  final VoidCallback showRegisterscreen;
  Login_Page({super.key, required this.showRegisterscreen});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final controll = AuthController();
  bool ischek = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Welcome to Login",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Image(
                  image: AssetImage(
                    "images/coffee.png",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: Form(
                  key: formController.txtname,
                  child: TextFormField(
                    controller: formController.txtnamee,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter username";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        label: Text(
                          "Username or email",
                        ),
                        suffixIcon: Icon(Icons.email)),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: 300,
                child: Form(
                  key: formController.txtpass,
                  child: TextFormField(
                    obscureText: ischek ? false : true,
                    controller: formController.txtpasss,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            ischek = !ischek;
                          });
                        },
                        child: ischek
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "ភ្លេចពាក្យសម្ងាត់?",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  child: Text('ចូលគណនី'),
                  onPressed: () {
                    if (formController.txtname.currentState!.validate() &&
                        formController.txtpass.currentState!.validate()) {
                      controll.signIn();
                      Get.snackbar("Notification", "Success");
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "មិនទាន់មានគណនី?",
                      ),
                    ),
                    TextButton(
                      onPressed: widget.showRegisterscreen,
                      child: Text(
                        "ចុះឈ្មោះ",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
