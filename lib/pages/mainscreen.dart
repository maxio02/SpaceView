import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_view/widgets/floatingCirclesBg.dart';
import 'package:space_view/managers/audioManager.dart';
import 'package:provider/provider.dart';

import 'galleryPage.dart';
import 'homePage.dart';
import 'mapPage/mapPage.dart';
import 'picOfTheDayPage.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

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
    final AudioManager audioManager = Provider.of<AudioManager>(context);

    return Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            FloatingCirclesBg(),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            _screens[selectedIndex]
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.33),
                  spreadRadius: 4,
                  blurRadius: 6)
            ],
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    HapticFeedback.lightImpact();
                  });
                  audioManager.playClickSound();
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
                showUnselectedLabels: true,
                backgroundColor:
                    Theme.of(context).navigationBarTheme.backgroundColor,
              ),
            ),
          ),
        ));
  }
}
