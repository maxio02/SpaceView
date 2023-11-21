import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
         SvgPicture.asset(
          'assets/logo_no_bg_light.svg',
          width: 400
        ),
        CupertinoSwitch(value: true, onChanged: (bool value) {

        }
        )
        ],)
      ),

    );
  }
}