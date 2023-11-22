import 'package:flutter/material.dart';

class CarouselElement extends StatelessWidget {
  const CarouselElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 177,
        height: 276,
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/background_temp_image.png")))));
  }
}
