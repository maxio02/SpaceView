import 'package:flutter/material.dart';
  /*TODO 
  Finish importing the constants, but first understand how to switch between themes
  dont want to import them the wrong way and then have to rewrite everything
  */
const accentColor = Color.fromRGBO(125, 122, 255, 1);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark
);