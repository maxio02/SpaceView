import 'package:flutter/material.dart';

class CarouselElement extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;

  const CarouselElement(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            Expanded(
                child: Stack(
              children: [
                Text(
                  description,
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.left,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
