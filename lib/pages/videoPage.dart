import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:space_view/managers/audioManager.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  final String videoLink;
  final String videoTitle;

  const VideoScreen(
      {Key? key, required this.videoLink, required this.videoTitle})
      : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    // Set preferred orientations only for portrait when entering fullscreen mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Reset preferred orientations when exiting fullscreen mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AudioManager audioManager = Provider.of<AudioManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            audioManager.playClickSound();
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BetterPlayer.network(
                widget.videoLink,
                betterPlayerConfiguration: BetterPlayerConfiguration(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
