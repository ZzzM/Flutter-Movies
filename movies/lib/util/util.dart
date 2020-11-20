import 'package:flutter/material.dart';
import 'constant.dart';

showSnackBar(GlobalKey<ScaffoldState> key, String text) {
  if (key.currentState != null) {
    key.currentState.showSnackBar(
        SnackBar(content: Text(text, style: TextStyle(color: Colors.white),), backgroundColor: ConsColor.theme)
    );
  }
}

Color hexColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}
double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

ThemeData themeData(BuildContext context) {
  return Theme.of(context);
}

bool isDark(BuildContext context) {
  return themeData(context).brightness == Brightness.dark;
}