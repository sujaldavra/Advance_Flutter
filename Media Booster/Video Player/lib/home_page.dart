import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Videos> VideosList = [];

  lodeJasonBank() async {
    String jsonData =
        await rootBundle.loadString("assets/Data/videosList.json");

    List res = jsonDecode(jsonData);

    setState(() {
      VideosList = res.map((e) => Videos.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    lodeJasonBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: VideosList.length,
          itemBuilder: (context, i) => Container(
            margin: const EdgeInsets.only(top: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                setState(() {
                  Global.res1 = VideosList[i];
                });
                Navigator.of(context)
                    .pushNamed("Videos_Page", arguments: VideosList[i]);
              },
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(VideosList[i].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${VideosList[i].category}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
