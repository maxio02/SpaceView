import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_view/managers/audioManager.dart';
import 'package:space_view/pages/fullscreenArticlePage.dart';

abstract class GalleryElementBase extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final CachedNetworkImage cachedImage;

  GalleryElementBase({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  })  : cachedImage = CachedNetworkImage(imageUrl: imageUrl),
        super(key: key);

  @override
  State<GalleryElementBase> createState();
}

abstract class GalleryElementBaseState extends State<GalleryElementBase> {
  late ImageProvider imageProvider;

  @override
  Widget build(BuildContext context);

  void navigateToFullScreenArticle(GalleryElementBase galleryElementBase, GalleryElementBaseState galleryElementBaseState) {
    final AudioManager audioManager = Provider.of<AudioManager>(context, listen: false);
    audioManager.playClickSound();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullscreenArticleScreen(
          galleryElement: galleryElementBase,
          imageProvider: galleryElementBaseState.imageProvider, // Use the bang operator to cast it as non-nullable
        ),
      ),
    );
    }
}