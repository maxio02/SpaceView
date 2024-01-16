import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryElement extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const GalleryElement(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 363,
        height: 510,
        margin: EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 330,
              width: double.infinity,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: SizedBox(
                  width: 330 * 0.15,
                  height: 330 * 0.15,
                  child: CircularProgressIndicator(value: downloadProgress.progress),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Expanded(
              child: Stack(
            children: [
              Text(
                description,
                style: TextStyle(fontSize: 16),
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
        ]));
  }
}
