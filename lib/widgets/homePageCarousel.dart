import 'package:flutter/material.dart';

import 'carouselElement.dart';

class HomePageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CarouselElement(),
          CarouselElement(),
          CarouselElement(),
          CarouselElement(),
        ],
      ),
    );
  }
}