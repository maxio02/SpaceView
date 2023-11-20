import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  /*TODO 
  Just get this working as for now I have no Idea how
  */
  get themeMode => _themeMode;

  toggleTheme(bool isDark){
    _themeMode=isDark? ThemeMode.dark: ThemeMode.light;
    notifyListeners();
  }
}