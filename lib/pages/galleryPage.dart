import 'package:flutter/material.dart';
import 'package:space_view/widgets/verticalGallery.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({ super.key });

  final GlobalKey<VerticalGalleryState> verticalGalleryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalGallery(key: verticalGalleryKey),
      ],
    );
  }
}