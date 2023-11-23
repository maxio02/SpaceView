import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
const GalleryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(child: Column(
      children: [
        SizedBox(height: 300),
        Center(child: Text('Gallery')),
      ],
    ));

  }
}