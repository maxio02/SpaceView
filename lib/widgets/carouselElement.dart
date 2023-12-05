import 'package:flutter/material.dart';

class CarouselElement extends StatelessWidget {
  final AssetImage image;
  final String title;

  const CarouselElement({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 177,
        height: 276,
        margin: EdgeInsets.symmetric(horizontal: 21),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 211,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    image: DecorationImage(fit: BoxFit.cover, image: image))),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.left,
            )
          ],
        )
      );
  }
}
