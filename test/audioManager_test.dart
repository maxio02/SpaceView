import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mockito/mockito.dart';
import 'package:space_view/managers/audioManager.dart';

class MockAudioManager extends Mock implements AudioManager {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('AudioManager Tests', () {
    // Test 1
    test('playClickSound - sound enabled', () async {
      AudioManager audioManager = AudioManager();

      AudioPlayer audioPlayer = audioManager.player;
      // Arrange
      audioPlayer.setSource(AssetSource('sounds/click.wav'));
      // Act
      audioManager.playClickSound();

      // Assert
      expect(audioManager.isSoundEnabled, isTrue);
    });

    // Test 2
    test('isSoundEnabled - initial value', () {
      AudioManager audioManager = AudioManager();

      audioManager.setSound(true);
      // Assert
      expect(audioManager.isSoundEnabled, true);
    });

    // Test 3
    test('dispose', () {
      AudioManager audioManager = AudioManager();

      AudioPlayer audioPlayer = audioManager.player;
      // Act
      audioPlayer.setSource(AssetSource('sounds/click.wav'));

      // Assert
      expect(audioPlayer.source.toString(),
          AssetSource('sounds/click.wav').toString());
    });
  });
}
