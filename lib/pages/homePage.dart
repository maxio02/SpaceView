import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_view/widgets/homePageCarousel.dart';
import 'package:space_view/widgets/settingsDrawer.dart';

import '../widgets/themeSwitch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              SizedBox(height: 59),
              SvgPicture.asset(
                'assets/vectors/logo_no_bg_light.svg',
                width: 300,
              ),
              HomePageCarousel(),
              ThemeSwitch()
            ],
          ),
        ),
      )
    ]);
  }
}
