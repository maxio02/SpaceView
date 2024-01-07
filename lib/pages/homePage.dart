import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:space_view/theme/themeProvider.dart';
import 'package:space_view/widgets/homePageCarousel.dart';
import 'package:space_view/widgets/settingsDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showSettingsPane(BuildContext context) {
    showAlignedDialog(
      context: context,
      followerAnchor: Alignment.topLeft,
      targetAnchor: Alignment.topLeft,
      offset: Offset(16, 52),
      builder: (BuildContext context) {
        return SettingsDrawer();
      },
    );
  }

@override
  Widget build(BuildContext context) {
    // Listen to the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(children: [
      Positioned(
        top: MediaQuery.of(context).padding.top,
        left: 0,
        child: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.menu),
          onPressed: () => _showSettingsPane(context),
        ),
      ),
      Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              // Use AnimatedCrossFade for the SVG images
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: SvgPicture.asset(
                  'assets/vectors/logo_no_bg_dark.svg', // Light theme SVG
                  width: 300,
                ),
                secondChild: SvgPicture.asset(
                  'assets/vectors/logo_no_bg_light.svg', // Dark theme SVG
                  width: 300,
                ),
                crossFadeState: themeProvider.isDarkMode 
                    ? CrossFadeState.showSecond 
                    : CrossFadeState.showFirst,
              ),
              HomePageCarousel(),
            ],
          ),
        ),
      )
    ]);
  }
}
