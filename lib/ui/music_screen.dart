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
 // String url = "";
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration playPosition = Duration.zero;
  late Size size;
  bool musicPlaylist= false;

  List<String> urlMusicList = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];

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
        playPosition = event;
      });
    });
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

            height: 10.0,
              width:10.0 ,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: const Icon(Icons.arrow_left_sharp))),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('lib/images/music_backgroud_img.png',
                fit: BoxFit.fill,
                height: size.height / 2.8,
                width: size.width / 1),
          ),

          ListTile(
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
          Slider(
              activeColor: Colors.white38,
              thumbColor: Colors.white,
              inactiveColor: Colors.white38,
              max: duration.inSeconds.toDouble(),
              min: 0,
              value: playPosition.inSeconds.toDouble(),
              onChanged: (val) async {
                final playPosition = Duration(seconds: val.toInt());
                await audioPlayer.seek(playPosition);
                await audioPlayer.resume();
              }),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formateTime(playPosition),
                    style: const TextStyle(color: Colors.white)),
                Text(formateTime(duration - playPosition),
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
                  icon: const Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: multipleURLplay,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  )),
              IconButton(
                onPressed: playAudio,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white),
                iconSize: 50,
              ),
              IconButton(
                  onPressed: multipleURLplay,
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: repeatSong,
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
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      musicPlaylist = !musicPlaylist;
                    });
                  },
                  icon: musicPlaylist? const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ): const Icon(Icons.arrow_drop_down,color: Colors.white,) ) ,
              Visibility(
                visible: musicPlaylist,
                child: Container(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: music_list.length,
                      itemBuilder: (context, i) {
                        final MusicLists = music_list[i];

                        return ListTile(
                          title: Text(MusicLists.title + i.toString() ,
                              style: const TextStyle(color: Colors.white)),
                          leading:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("lib/images/music_background.png"),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.play_circle,
                                color: Colors.white),
                          ),
                        );
                      },
                    )),
              )
            ],
          )
        ],
      )),
    );
  }

  void playAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      String url =
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
      await audioPlayer.play(url);
    }
  }

  void playNext() async {
    String songURL2 =
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
    await audioPlayer.play(songURL2);
  }

  void playprevious() async {
    String songURL2 =
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
    await audioPlayer.play(songURL2);
  }

  void repeatSong() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    String songURL2 =
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
    await audioPlayer.play(songURL2);
  }

  void setofAudio() async {
    String songURL2 =
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
    await audioPlayer.play(songURL2);
  }

  Future multipleURLplay() async {
    for (var i = 0; i < urlMusicList.length; i++) {
      await audioPlayer.resume();

      await audioPlayer.play(urlMusicList[i]);
    }
  }
}
