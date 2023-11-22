import 'package:flutter/material.dart';

class PicOfTheDayScreen extends StatelessWidget {
const PicOfTheDayScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(child: Column(
      children: [
        SizedBox(height: 300),
        Center(child: const Text('Pic Of the Day')),
      ],
    ));
  }
}