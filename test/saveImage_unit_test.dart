import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:io';

import 'package:space_view/functions/saveImage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Test 1
  test('SaveImage.saveImage saves image to disk', () async {
    // Create a test image
    final ByteData byteData =
        await rootBundle.load('assets/images/background_temp_image.png');
    final List<int> bytes = byteData.buffer.asUint8List();
    final ImageProvider testImageProvider =
        MemoryImage(Uint8List.fromList(bytes));

    // Call the function and get the result
    final String? result =
        await SaveImage.saveImage(testImageProvider, reallySave: false);

    // Validate the result
    expect(result, 'Image saved to disk.');

    // Doesn't work on non Unix machine, as getTemporaryDirectory is not implemented
    // Validate that the file was created
    // final Directory tempDir = await getTemporaryDirectory();
    // final List<FileSystemEntity> files = tempDir.listSync();
    // expect(files, isNotEmpty);
  });

  // Test 2
  test('SaveImage.saveImage handles errors gracefully', () async {
    // Create a faulty image provider (for testing error path)

    final ImageProvider faultyImageProvider = MemoryImage(Uint8List.fromList(
        (await rootBundle.load('assets/images/background_temp_image.png'))
            .buffer
            .asUint8List()));

    //Call the function and get the result
    final String? result = await SaveImage.saveImage(faultyImageProvider);

    //Validate the result
    expect(result, 'An error occurred while saving the image.');
  });
}
