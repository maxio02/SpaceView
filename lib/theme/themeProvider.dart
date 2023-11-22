import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  toggleTheme(bool isDark){
    themeMode=isDark? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}