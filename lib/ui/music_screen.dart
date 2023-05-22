import 'package:audio_player/helper_functions/music_list.dart';
import 'package:audio_player/helper_functions/time_formate.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  String url = "";
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late Size size;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });

    // audioPlayer.onPlayerStateChanged.listen((newPosition) {
    //   setState(() {
    //     position = newPosition;
    //   });
    // });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Text('Playing Music'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: const Icon(Icons.arrow_left_sharp))),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('lib/images/music_backgroud_img.png',
                fit: BoxFit.cover,
                height: size.height / 10,
                width: size.width / 1),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListTile(
                title: const Text('Rabindranath Tagore',
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text(
                  'Akonda',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    ))),
          ),
          Slider(
              activeColor: Colors.white38,
              thumbColor: Colors.white,
              inactiveColor: Colors.white38,
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              min: 0,
              // divisions: 50,
              //  label: '${_playingTime.round()}',
              onChanged: (val) {
                setState(() {
                  // position = val.toString();
                });
              }),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formateTime(position),
                    style: const TextStyle(color: Colors.white)),
                Text(formateTime(duration - position),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  )),
              IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    String url =
                        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
                    await audioPlayer.play(url);
                    //simple changes [as Source];
                  }
                },
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white),
                iconSize: 50,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.repeat,
                    color: Colors.white,
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Episode',
                  style: TextStyle(fontSize: 40, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )),
              Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: music_list.length,
                    itemBuilder: (context, i) {
                      final MusicLists = music_list[i];

                      return ListTile(
                        title: Text(MusicLists.title,
                            style: const TextStyle(color: Colors.white)),
                        leading: Icon(Icons.man,color: Colors.white),
                       // Image.asset(""),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle,
                              color: Colors.white),
                        ),
                      );
                    },
                  ))
            ],
          )
        ],
      )),
    );
  }
}
