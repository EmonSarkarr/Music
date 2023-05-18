import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double _playingTime = 100;

  @override
  Widget build(BuildContext context) {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('lib/images/music_backgroud_img.png',
                fit: BoxFit.cover, height: 200, width: 200),
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
              value: _playingTime,
              max: 200,
              min: 0,
              // divisions: 50,
              label: '${_playingTime.round()}',
              onChanged: (val) {
                setState(() {
                  _playingTime = val;
                });
              }),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("3:50", style: TextStyle(color: Colors.black54)),
                Text("4:21"),
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
                    Icons.play_arrow_sharp,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.repeat,
                    color: Colors.white,
                  )),
            ],
          ),
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const  Text('Episode', style: TextStyle(color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(

                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      )),
    );
  }
}
