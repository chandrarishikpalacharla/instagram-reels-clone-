
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class videoPlayerItem extends StatefulWidget {
  final String videoUrl;
  const videoPlayerItem({super.key,required this.videoUrl});

  @override
  State<videoPlayerItem> createState() => _videoPlayerItemState();
}

class _videoPlayerItemState extends State<videoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setVolume(1);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}