import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_view/theme/themeProvider.dart';

class ThemeSwitch extends StatelessWidget {
const ThemeSwitch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
    value: themeProvider.isDarkMode, 
    onChanged: (value){
      final provider = Provider.of<ThemeProvider>(context, listen: false);
      provider.toggleTheme(value);
    },
    
    );
  }
}