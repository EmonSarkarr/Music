import 'dart:async';

import 'package:audio_player/ui/music_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const MusicScreen()) );
    });
    super.initState();
  }
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'lib/images/musicapp.png',
            height: size.height / 9,
            width: size.width / 7,
          )),
          SizedBox(
            height: size.height / 7,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
