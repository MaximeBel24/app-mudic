import 'dart:math';

import 'package:flutter/material.dart';

import '../../controller/player_controller.dart';
import '../../model/raw_model/song.dart';

class ClassicTile extends StatelessWidget {

  final List<Song> playlist;
  final int index;

  const ClassicTile({required this.playlist, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(playlist[index].thumb),
      title: Text(playlist[index].title),
      trailing: Icon(Icons.arrow_right),
      onTap: () {
        final route  = MaterialPageRoute(builder: ((context) => MyPlayerController(
          songToPlay: playlist[index],
          playlist: playlist,
          backgroundColor: Color.fromRGBO(
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
              1),
        )
        ));
        Navigator.push(context, route);
      },
    );
  }
}