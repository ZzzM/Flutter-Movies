import 'package:flutter/material.dart';
import 'constant.dart';

showSnackBar(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: ConsColor.theme,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        action: SnackBarAction(label: 'X', textColor: Colors.white, onPressed: () {})
    )
  );
}

showModalContent(BuildContext context, String title, Widget child) {

  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)
        ),
      ),
      builder: (_) {
        return Container(
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Container(
                  height: screenWidth(context),
                  child: child,
                )
              ],
            ));
      });
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
