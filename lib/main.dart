import 'package:flutter/material.dart';
import 'package:space_view/pages/splashscreen.dart';
import 'package:space_view/theme/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:space_view/theme/themeConstants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            themeMode: themeProvider.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
          );
        },
      );
}
