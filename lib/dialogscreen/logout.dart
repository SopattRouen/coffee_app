import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_test_1/controller/authcontroller.dart';

import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({
    super.key,
  });

  @override
  State<Logout> createState() => _LogoutState();
}

final controll = AuthController();

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'តើអ្នកចង់ចាកចេញមែនទេ?',
            titleTextStyle: TextStyle(fontSize: 25),
            desc: '',
            descTextStyle: TextStyle(fontSize: 23),
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              controll.signout();
            },
          )..show();
        });
      },
      leading: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      title: Text(
        "Logout",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
