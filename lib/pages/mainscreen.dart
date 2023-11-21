import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/theme_constants.dart';
import 'galleryPage.dart';
import 'homePage.dart';
import 'mapPage.dart';
import 'picOfTheDayPage.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({ Key? key }) : super(key: key);
  
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  static int selectedIndex = 2;
  final _screens = [
    GalleryPage(),
    PicOfTheDayScreen(),
    HomeScreen(),
    MapScreen()
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            HapticFeedback.lightImpact();
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Picture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
      )
    );
  }
}