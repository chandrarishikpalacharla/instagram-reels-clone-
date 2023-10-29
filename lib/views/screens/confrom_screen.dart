import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/upload_video_controller.dart';
import 'package:project1/views/widgets/textfieldinput.dart';
import 'package:video_player/video_player.dart';

class ConformScreen extends StatefulWidget {
  final File videoFile;

  final String videoPath;

  const ConformScreen({super.key,required this.videoFile,required this.videoPath});

  @override
  State<ConformScreen> createState() => _ConformScreenState();
}

class _ConformScreenState extends State<ConformScreen> {
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController = Get.put(UploadVideoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(height: 30,),
            SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:const EdgeInsets.only(left:10,right: 10),
                  width: MediaQuery.of(context).size.width-20,
                  child: TextInputField(controller: _songController, labelText: "song name", icon: Icons.music_note),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin:const EdgeInsets.only(left:10,right: 10),
                  width: MediaQuery.of(context).size.width-20,
                  child: TextInputField(controller: _captionController, labelText: "caption", icon: Icons.closed_caption),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  uploadVideoController.uploadVideo(_songController.text, _captionController.text, widget.videoPath);
                }, child: Text("share!",style: TextStyle(fontSize: 20,color: Colors.white),))
              ],
            ),)
          ],
        ),
      ),
    );
  }
}