import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:space_view/main.dart' as app;
import 'package:space_view/widgets/verticalGalleryElement.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Mainscreen Tests', () {
    testWidgets('Navigate and interact with gallery', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final totalDuration = Duration(milliseconds: 1000);
      final singlePumpDuration = Duration(milliseconds: 10);
      for (var elapsed = Duration.zero; elapsed < totalDuration; elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }
      // Tap on the Gallery icon in the BottomNavigationBar.
      final galleryIcon = find.byIcon(Icons.photo_library);
      await tester.tap(galleryIcon);
      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds:5000); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }

      // Find a VerticalGalleryElement and tap it.
      final galleryElementFinder = find.byType(VerticalGalleryElement).first;
      await tester.tap(galleryElementFinder);
      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds:300); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }

      final imageFinder = find.byType(Hero).first;
      await tester.tap(imageFinder);
      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds:300); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }

      final saveIconFinder = find.byIcon(Icons.save);
      // Check if the save icon exists in the widget tree
      expect(saveIconFinder, findsOneWidget);


      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds:300); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }

      for(int i = 0; i < 2; i++){
         final NavigatorState navigator = tester.state(find.byType(Navigator));
          navigator.pop();
          for (var elapsed = Duration.zero; elapsed < Duration(milliseconds:300); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }
      }

      final homeIcon = find.byIcon(Icons.home);
      await tester.tap(homeIcon);
      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds:3000); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }


    });
  });
}