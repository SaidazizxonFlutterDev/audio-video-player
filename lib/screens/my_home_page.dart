import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_and_audio_player/core/constants/color_const.dart';
import 'package:video_and_audio_player/core/constants/fontweight_const.dart';
import 'package:video_and_audio_player/core/constants/size_const.dart';
import 'package:video_and_audio_player/widgets/my_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer? _player;
  AudioCache? _cashe;

  Duration musicLength = const Duration();
  Duration musicPosition = const Duration();
  IconData stopStartIcon = Icons.pause;
  bool isPlay = false;
  String myUrl = "MyAudio.mp3";
  Map<String, dynamic> lst = {
    "url": "MyAudio.mp3",
    "author" : "Emilie Hollow",
    "name" : "LILY"
  };

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _cashe = AudioCache(fixedPlayer: _player);

    _player!.onDurationChanged.listen((Duration event) {
      musicLength = event;
    });

    _player!.onAudioPositionChanged.listen((Duration event) {
      setState(() {
        
        musicPosition = event;
        
      });
    });

    _cashe!.load(myUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.invisible,
        elevation: 0,
        centerTitle: true,
        title: MyText(txt: "Audio & Video Player"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/lilly.jpg"),
                ),
              ),
            ),
            const SizedBox(height: 50),
            MyText(
                txt: "LILY",
                size: ConstSize.doubleExtralarge,
                clr: ConstColor.primary,
                weight: ConstWeight.bold),
            MyText(
                txt: "Emilie Hollow",
                size: ConstSize.large,
                clr: ConstColor.grey,
                weight: ConstWeight.normal),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText(
                    txt: musicPosition.inMinutes.toString().padLeft(2, "0") +
                        ":" +
                        musicPosition.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0")),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: slider(),
                ),
                MyText(
                  txt: musicLength.inMinutes.toString().padLeft(2, "0") +
                      ":" +
                      musicLength.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 40,
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isPlay) {
                        isPlay = false;
                        _player!.pause();
                      } else {
                        setState(() {
                          isPlay = true;
                          _cashe!.play(myUrl);
                        });
                      }
                    });
                  },
                  iconSize: 40,
                  icon: Icon(isPlay ? Icons.pause : Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 40,
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  seekToSec(sec) {
    Duration newPos = Duration(seconds: sec);
    setState(() {
      _player!.seek(newPos);
    });
  }

  Widget slider() {
    return Slider.adaptive(
        activeColor: ConstColor.primary,
        inactiveColor: ConstColor.grey,
        value: musicPosition.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (double v) {
          setState(() {
            seekToSec(v.toInt());
          });
        });
  }
}
