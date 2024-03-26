import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const primaryColor = Color(0xFF39A552);
  static const redColor = Color(0xFFC91C22);
  static const darkBlue = Color(0xFF003E90);
  static const pinkColor = Color(0xFFED1E79);
  static const brownColor = Color(0xFFCF7E48);
  static const yellowColor = Color(0xFFF2D352);
  static Color whiteColor=Color(0xffF8F8F8);
  static const lightBlue = Color(0xFF4882CF);
  static const grayColor = Color(0xFF79828B);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(actionsIconTheme: IconThemeData(color: whiteColor),
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color:  Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: 'ElMessiri-SemiBold.ttf',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color:  Colors.black,
      ),
    ),
  );
}
