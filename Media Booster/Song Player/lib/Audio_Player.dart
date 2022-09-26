import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  initAudio() async {
    for (Map<String, dynamic> data in musicPlayer) {
      await data['Player'].open(
        Audio(data['Music']),
        autoStart: false,
      );
    }

    for (Map<String, dynamic> data in musicPlayer) {
      setState(() {
        data['Time'] = data['Player'].current.value!.audio.duration;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Song Player"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: musicPlayer.length,
          itemBuilder: (context, i) => Card(
            elevation: 3,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              tileColor: Colors.grey,
              textColor: Colors.white,
              isThreeLine: true,
              leading: Text("${i + 1}"),
              title: Text("${musicPlayer[i]['Name']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 70,),
                      IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          await musicPlayer[i]['Player'].play();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          await musicPlayer[i]['Player'].pause();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          await musicPlayer[i]['Player'].stop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  StreamBuilder(
                    stream: musicPlayer[i]['Player'].currentPosition,
                    builder: (context, AsyncSnapshot<Duration> snapshot) {
                      Duration? currentPosition = snapshot.data;

                      return Column(
                        children: [
                          Text(
                              "${"$currentPosition".split(".")[0]}/${"${musicPlayer[i]['Time']}".split(".")[0]}"),
                          Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.white38,
                            min: 0,
                            max: musicPlayer[i]['Time'].inSeconds.toDouble(),
                            value: (currentPosition != null)
                                ? currentPosition.inSeconds.toDouble()
                                : 0,
                            onChanged: (val) async {
                              await musicPlayer[i]['Player']
                                  .seek(Duration(seconds: val.toInt()));
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
