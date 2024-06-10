import 'package:flutter/material.dart';

const largescreenSize = 1280;
const meduimscreenSize = 768;
const smallscreenSize = 360;

class Mainresponsive extends StatelessWidget {
  final Widget largesreen;
  final Widget meduimscreen;
  final Widget smallscreen;
  const Mainresponsive(
      {super.key,
      required this.largesreen,
      required this.meduimscreen,
      required this.smallscreen});
  static bool isLargescreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largescreenSize;
  }

  static bool isMeduimscreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= meduimscreenSize &&
        MediaQuery.of(context).size.width < largescreenSize;
  }

  static bool isSmallscreen(BuildContext context) {
    return MediaQuery.of(context).size.width < meduimscreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isLargescreen(context)) {
          return largesreen;
        } else if (isMeduimscreen(context)) {
          return meduimscreen;
        } else {
          return smallscreen;
        }
      },
    );
  }
}
