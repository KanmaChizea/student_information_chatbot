import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData theme = ThemeData(
    primaryColor: primary,
    primarySwatch: Colors.purple,
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedStyle),
    textTheme: textTheme);

ButtonStyle elevatedStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return primary100;
      } else if (states.contains(MaterialState.pressed)) {
        return primary200;
      } else {
        return primary;
      }
    }),
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20, horizontal: 45)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 18, color: Colors.white)));
TextTheme textTheme = const TextTheme(
  headline1: TextStyle(
      fontSize: 52, fontWeight: FontWeight.bold, color: Colors.black87),
  headline2: TextStyle(
      fontSize: 36, fontWeight: FontWeight.w600, color: Colors.black87),
  bodyText1: TextStyle(fontSize: 24, height: 1.2),
  bodyText2: TextStyle(fontSize: 20, height: 1.2),
  headline3: TextStyle(
      fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black87),
  headline4: TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
  subtitle1: TextStyle(fontSize: 18, height: 1.2, fontWeight: FontWeight.w500),
  subtitle2: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.w500),
  caption: TextStyle(
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w500,
      color: Colors.white),
);
