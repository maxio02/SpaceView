import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
const MapScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(child: Column(
      children: [
        SizedBox(height: 300),
        Center(child: const Text('Map Screen')),
      ],
    ));
  }
}