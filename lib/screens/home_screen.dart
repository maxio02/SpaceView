import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_view/theme/theme_constants.dart';
import 'package:space_view/widgets/bottomNavBar.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          //TODO Fix the svg size, its not centering correctly probably because of how it was exported
          'assets/logo_no_bg.svg',
          width: 400
        )
      ),
      bottomNavigationBar: SpaceViewBottomNavBar(selectedIndex: 2)
    );
  }
}