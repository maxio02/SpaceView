import 'package:flutter/material.dart';
import 'package:space_view/widgets/verticalGallery.dart';

class GalleryPage extends StatelessWidget {
const GalleryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(child: Column(
      children: [
        VerticalGallery()
      ],
    ));

  }
}