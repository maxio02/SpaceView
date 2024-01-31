import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:space_view/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Mainscreen Tests', () {
    testWidgets('Navigate through navbar items', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

            final totalDuration = Duration(milliseconds: 5000);
      final singlePumpDuration = Duration(milliseconds: 10);
      for (var elapsed = Duration.zero; elapsed < totalDuration; elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }
      

      final settingsIcon = find.byIcon(Icons.menu);
      await tester.tap(settingsIcon);
      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds: 400); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }

      final screenSize = tester.view.physicalSize;
      final middleOfScreen = Offset(screenSize.width / 2, screenSize.height / 2);
      await tester.tapAt(middleOfScreen);
      for (var elapsed = Duration.zero; elapsed < Duration(milliseconds: 400); elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }

      List<IconData> navBarIcons = [Icons.photo_library, Icons.photo, Icons.map, Icons.home];

      for (var icon in navBarIcons) {
        final finder = find.byIcon(icon);
        await tester.tap(finder);
      for (var elapsed = Duration.zero; elapsed < totalDuration; elapsed += singlePumpDuration) {
        await tester.pump(singlePumpDuration);
      }
      }
    });
  });
}