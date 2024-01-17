import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal(){
      _player.setPlayerMode(PlayerMode.mediaPlayer);
  }

  final AudioPlayer _player = AudioPlayer();

  void playClickSound() async {
    if(isSoundEnabled){
    await _player.play(AssetSource('sounds/click.wav'));
    }else{
      return;
    }
  }

  bool _isSoundEnabled = true;

  bool get isSoundEnabled => _isSoundEnabled;

  void setSound(bool isEnabled) {
    _isSoundEnabled = isEnabled;
  }

  void dispose() {
    _player.dispose();
  }
}
