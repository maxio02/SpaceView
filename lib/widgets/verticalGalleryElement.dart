import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:space_view/widgets/galleryElementBase.dart';

class VerticalGalleryElement extends GalleryElementBase {
  VerticalGalleryElement({
    super.key,
    required super.imageUrl,
    required super.title,
    required super.description,
  });

  @override
  _VerticalGalleryElementState createState() => _VerticalGalleryElementState();
}

class _VerticalGalleryElementState extends GalleryElementBaseState {
  late ImageProvider imageProvider;

  @override
  void initState() {
    super.initState();
    imageProvider = AssetImage('assets/images/transparent.png');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => navigateToFullScreenArticle(widget, this),
        child: Container(
            width: 362,
            height: 510,
            margin: EdgeInsets.symmetric(horizontal: 21, vertical: 16),
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(26),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Hero(
                tag: widget.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    imageBuilder: (context, newImageProvider) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (imageProvider != newImageProvider) {
                          setState(() {
                            imageProvider = newImageProvider;
                          });
                        }
                      });
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    height: 330,
                    width: double.infinity,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        width: 330 * 0.15,
                        height: 330 * 0.15,
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Icon(Icons.error_outline, size:20),
                        SizedBox(height: 10),
                        Text(
                          "Couldn't fetch the image from the internet",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Please try again later",
                            style: TextStyle(
                              fontSize: 16,
                            ))
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Flexible(
                  child: Stack(
                children: [
                  Text(
                    widget.description,
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
            ])));
  }
}
