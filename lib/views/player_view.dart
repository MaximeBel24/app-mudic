import 'package:flutter/material.dart';
import 'package:learn_music/model/raw_model/song.dart';

class PlayerView extends StatelessWidget {
   final Song song;
   final EdgeInsets padding = const EdgeInsets.all(8);

   const PlayerView({required this.song});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(song.title),
      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}