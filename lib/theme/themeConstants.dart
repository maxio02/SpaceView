import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        primary: Color.fromRGBO(79, 77, 187, 1),
        secondary: Color.fromRGBO(79, 77, 187, 1)),
    scaffoldBackgroundColor: Colors.white70,
    primaryColor: Color.fromARGB(255, 185, 185, 189),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color.fromRGBO(230, 230, 230, 0.569)));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: Color.fromRGBO(125, 122, 255, 1),
        secondary: Color.fromRGBO(125, 122, 255, 1)),
    scaffoldBackgroundColor: Color.fromARGB(255, 14, 16, 22),
    primaryColor: Color(0xFF1B1B1C),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color.fromRGBO(35, 39, 48, 0.57)));
