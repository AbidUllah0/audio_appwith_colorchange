import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  List<Color> _color = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
  ];

  int appbar = 0;
  int scaffold = 0;
  Random randon = Random();
  final player = AudioPlayer();

  //String file = 'audio1.wav';
  List sound = [
    'audio1.wav',
    'audio2.wav',
    'audio3.wav',
    'audio4.wav',
  ];
  int soundPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[scaffold],
      appBar: AppBar(
        //refresh button is a sound changer
        //elevated button is a color changer
        title: IconButton(
          onPressed: () {
            soundPosition = randon.nextInt(3);
          },
          icon: Icon(
            Icons.refresh,
            color: Colors.yellow,
            size: 30,
          ),
        ),
        backgroundColor: _color[appbar],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(player.playerId),
          Container(
            height: 50,
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 100,
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    appbar = randon.nextInt(6);
                    scaffold = randon.nextInt(6);
                    player.play(AssetSource(sound[soundPosition]));
                    //player.play(AssetSource('audio1.wav'));
                  },
                );
              },
              child: Icon(
                Icons.play_arrow,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
