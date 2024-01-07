import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal();

  final AudioPlayer _player = AudioPlayer();

  void playClickSound() async {
    await _player.play(AssetSource('sounds/click.mp3'));
  }

  bool _isSoundEnabled = true;

  bool get isSoundEnabled => _isSoundEnabled;

  void toggleSound(bool isEnabled) {
    _isSoundEnabled = isEnabled;
    if (_isSoundEnabled) {
      _player.setVolume(1.0);
    } else {
      _player.setVolume(0.0);
    }
  }

  void dispose() {
    _player.dispose();
  }
}
