import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

BuildContext context = context;
void alert() {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: 'Something went Wrong',
    titleTextStyle: TextStyle(fontSize: 25),
    desc: 'New Password must be different form current password',
    descTextStyle: TextStyle(fontSize: 23),
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  )..show();
}
