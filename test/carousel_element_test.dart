import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:space_view/widgets/carouselElement.dart';
import 'package:provider/provider.dart';
import 'package:space_view/managers/audioManager.dart';


void main() {
  mockNetworkImagesFor(() {
    testWidgets('CarouselGalleryElement displays with required elements', (WidgetTester tester) async {
      // Define expected values
      final String expectedImageUrl = 'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg';
      final String expectedTitle = 'Test Title';
      final String expectedDescription = 'Test Description';

      // Create a mock AudioManager or the actual object, depending on your requirements
      final mockAudioManager = AudioManager();

      // Wrap your widget with the Provider
      await tester.pumpWidget(MaterialApp(
        home: Provider<AudioManager>(
          create: (context) => mockAudioManager,
          child: CarouselGalleryElement(
            imageUrl: expectedImageUrl,
            title: expectedTitle,
            description: expectedDescription,
          ),
        ),
      ));

      // Verify if a CachedNetworkImage is present and has the correct imageUrl
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      final CachedNetworkImage image = tester.widget(find.byType(CachedNetworkImage));
      expect(image.imageUrl, equals(expectedImageUrl));

      // Validate the title and description texts are displayed
      expect(find.text(expectedTitle), findsOneWidget);
      expect(find.text(expectedDescription), findsOneWidget);

      // Confirm the presence of GestureDetector for handling taps
      expect(find.byType(GestureDetector), findsOneWidget);

      // Verify Hero widget is used with the correct tag
      expect(find.byType(Hero), findsOneWidget);
      final Hero heroWidget = tester.widget(find.byType(Hero));
      expect(heroWidget.tag, equals(expectedTitle));
    });
  });
}

