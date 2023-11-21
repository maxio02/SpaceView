import 'package:flutter/material.dart';

class PicOfTheDayScreen extends StatelessWidget {
const PicOfTheDayScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(child: Column(
      children: [
        Center(child: const Text('Pic Of the Day')),
      ],
    ));
  }
}