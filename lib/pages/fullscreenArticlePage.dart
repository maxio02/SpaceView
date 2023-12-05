import 'package:flutter/material.dart';

class FullscreenArticleScreen extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String description;

  const FullscreenArticleScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
             width: screenSize.width,
             height: screenSize.width,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: image))),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            )
          ],)
          )
         
            
            ]),
    );
  }
}
