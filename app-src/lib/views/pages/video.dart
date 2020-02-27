import 'package:flutter/material.dart';
import 'package:invitation/styles/app_theme.dart';


import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
   VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
    void initPlayer() {
    _videoPlayerController1 = VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: false,
    );
  }


   @override
  void dispose() {
    // _videoPlayerController1.dispose();
    // _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initPlayer();
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Trailer'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
      ],
    );
  }
}