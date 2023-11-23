import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_view/widgets/themeSwitch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          SizedBox(height: 59),
          SvgPicture.asset('assets/vectors/logo_no_bg_light.svg', width: 300),
          SizedBox(height: 200),
          ThemeSwitch()
        ],
      )),
    );
  }
}
