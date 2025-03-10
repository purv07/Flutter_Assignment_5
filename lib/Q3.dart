import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Q3 extends StatefulWidget {
  const Q3({super.key});

  @override
  State<Q3> createState() => _Q3State();
}

class _Q3State extends State<Q3> {
  late VideoPlayerController _controllerVideo;

  @override
  void initState() {
    super.initState();
    _controllerVideo = VideoPlayerController.asset('assets/videos/Sam.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh UI after initialization
        _controllerVideo.setLooping(true); // Optional: Loop the video
      });
  }

  @override
  void dispose() {
    _controllerVideo.dispose(); // Free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
            _controllerVideo.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controllerVideo.value.aspectRatio,
              child: VideoPlayer(_controllerVideo),
            )
                : CircularProgressIndicator()
            ,
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              _controllerVideo.value.isPlaying? _controllerVideo.pause():_controllerVideo.play();
            });
          }, child: Icon(!_controllerVideo.value.isPlaying?Icons.play_arrow:Icons.stop_circle)),
        ],
      ),
    );
  }
}
