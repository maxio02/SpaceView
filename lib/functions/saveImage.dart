import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

class SaveImage {
  static Future<String> saveImage(ImageProvider imageProvider,
      {bool reallySave = true}) async {
    String? message;

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
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to a file
      if (reallySave) {
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
      } else {
        message = 'Image saved to disk.';
      }
    } catch (e) {
      message = 'An error occurred while saving the image.';
    }
    return Future.value(message);
  }
}
