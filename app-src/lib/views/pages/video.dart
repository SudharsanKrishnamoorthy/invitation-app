import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;

  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'Vf_Qx70xViU',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        forceHideAnnotation: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
       controller: _controller,
       showVideoProgressIndicator: true,
       
       onReady: () {
          print('Player is ready.');
       },
    );
  }

}
