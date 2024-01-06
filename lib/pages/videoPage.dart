import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  final String videoLink;
  final String videoTitle;

  const VideoScreen(
      {Key? key, required this.videoLink, required this.videoTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
                videoLink,
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
