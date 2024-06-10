import 'package:coffee_test_1/controller/authcontroller.dart';
import 'package:coffee_test_1/model/firebase_model.dart';
import 'package:coffee_test_1/service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key, required this.showLoginscreen});
  final VoidCallback showLoginscreen;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final _db = ServiceDb();
final controll = Get.put(AuthController());

class _RegisterPageState extends State<RegisterPage> {
  bool isCheck = false;
  bool isCheckk = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 45,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome to Register",
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
                  key: formController.username,
                  child: TextFormField(
                    controller: formController.usernamee,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter username";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "username",
                      ),
                      suffixIcon: Icon(Icons.person),
                    ),
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
                        return "Please Enter email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "email",
                      ),
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: Form(
                  key: formController.txtpass,
                  child: TextFormField(
                    obscureText: isCheck ? false : true,
                    controller: formController.txtpasss,
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isCheck = !isCheck;
                            });
                          },
                          child: isCheck
                              ? Icon(
                                  Icons.visibility,
                                )
                              : Icon(Icons.visibility_off)),
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: Form(
                  key: formController.txtcf,
                  child: TextFormField(
                    obscureText: isCheckk ? false : true,
                    controller: formController.txtcff,
                    decoration: InputDecoration(
                      label: Text(
                        "Confirm Password",
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isCheckk = !isCheckk;
                          });
                        },
                        child: isCheckk
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter confirm password";
                      } else {
                        return null;
                      }
                    },
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
                  child: Text('ចុះឈ្មោះ'),
                  onPressed: () {
                    setState(() {
                      if (formController.txtname.currentState!.validate() &&
                          formController.txtpass.currentState!.validate() &&
                          formController.username.currentState!.validate() &&
                          formController.txtcf.currentState!.validate()) {
                        if (formController.txtpasss != formController.txtcff) {
                          Get.snackbar(
                              "Notification", "Fail to create an account");
                        } else {
                          controll.createAccount();
                          DatabaseModel cloud = DatabaseModel(
                            email: formController.txtnamee.text,
                            name: formController.usernamee.text,
                            password: formController.txtpasss.text,
                          );
                          _db.addData(cloud);
                          Get.snackbar("Notification", "Success");
                        }
                      } else {
                        return null;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "មានគណនីរួចរាល់?",
                      ),
                    ),
                    TextButton(
                      onPressed: widget.showLoginscreen,
                      child: Text(
                        "ចូលគណនី",
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
