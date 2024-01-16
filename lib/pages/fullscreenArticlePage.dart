import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

import 'package:space_view/managers/audioManager.dart';
import 'package:provider/provider.dart';
import 'package:space_view/widgets/galleryElementBase.dart';
import 'package:space_view/widgets/verticalGalleryElement.dart';

class FullscreenArticleScreen extends StatelessWidget {
  final GalleryElementBase galleryElement;
  final ImageProvider imageProvider;

  const FullscreenArticleScreen({
    Key? key,
    required this.galleryElement,
    required this.imageProvider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioManager audioManager = Provider.of<AudioManager>(context);

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'articleImage', // Unique tag for the hero animation
                    child: GestureDetector(
                      onTap: () {
                        audioManager.playClickSound();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(
                              imageProvider: imageProvider,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          galleryElement.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          galleryElement.description,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final ImageProvider imageProvider;

  const FullScreenImage(
      {Key? key,  required this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioManager audioManager = Provider.of<AudioManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Save image to disk'),
        actions: [
          IconButton(
            onPressed: () {
              audioManager.playClickSound();
              _saveImage(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Center(
        child: Hero(
          tag: 'articleImage', // Same tag as used in FullscreenArticleScreen
          child: PhotoViewGallery.builder(
            itemCount: 1,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: imageProvider,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            scrollPhysics: BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(
              color: Colors.black,
            ),
            pageController: PageController(),
          ),
        ),
      ),
    );
  }

Future<void> _saveImage(BuildContext context) async {
  String? message;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    // Create a stream of image data from the ImageProvider
    final ImageStream stream = imageProvider.resolve(ImageConfiguration());
    final Completer<ImageInfo> completer = Completer();
    void imageListener(ImageInfo info, bool _) {
      completer.complete(info);
      stream.removeListener(ImageStreamListener(imageListener));
    }
    stream.addListener(ImageStreamListener(imageListener));

    // Get the image info (which includes the image itself)
    final ImageInfo imageInfo = await completer.future;
    final ui.Image image = imageInfo.image;

    // Convert the ui.Image to a ByteData
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Save the image to a file
    final dir = await getTemporaryDirectory();
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    var filename = '${dir.path}/space_view_$timestamp.png';
    final file = File(filename);
    await file.writeAsBytes(pngBytes);

    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      message = 'Image saved to disk.';
    }
  } catch (e) {
    message = 'An error occurred while saving the image.';
  }

  if (message != null) {
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
}