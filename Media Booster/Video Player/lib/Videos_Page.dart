import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  List<VideoPlayerController> controller = [];
  List<ChewieController> Chewiecontroller = [];
  List<VideoPlayerController> Networkcontroller = [];
  List<ChewieController> NetworkChewieController = [];

  List assetsVideos = [];
  List networkVideos = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      assetsVideos = Global.res1.assetsVideos;
      networkVideos = Global.res1.networkVideos;

      for (var e in assetsVideos) {
        controller.add(VideoPlayerController.asset(e)
          ..initialize().then(
            (_) {
              setState(() {});
            },
          ));
      }

      for (var e in controller) {
        Chewiecontroller.add(ChewieController(
          videoPlayerController: e,
          autoPlay: false,
          looping: false,
        ));
        setState(() {});
      }

      Timer.periodic(const Duration(microseconds: 200), (timer) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(res.category),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...assetsVideos
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                    height: 230,
                    width: double.infinity,
                    color: Colors.black,
                    child: AspectRatio(
                      aspectRatio:
                          controller[assetsVideos.indexOf(e)].value.aspectRatio,
                      child: Chewie(
                        controller: Chewiecontroller[assetsVideos.indexOf(e)],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var e in controller) {
      Chewiecontroller[controller.indexOf(e)].dispose();
      e.dispose();
    }
    for (var e in Networkcontroller) {
      NetworkChewieController[Networkcontroller.indexOf(e)].dispose();
      e.dispose();
    }

    super.dispose();
  }
}
