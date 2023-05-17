import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Text('Playing Music'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.arrow_left_sharp)),
      body: SafeArea(
          child: Column(
        children: [
          Image.asset('lib/images/music_backgroud_img.png',
              fit:BoxFit.cover,
              height: 400, width: 400),
          SizedBox(
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
        ],
      )),
    );
  }
}
