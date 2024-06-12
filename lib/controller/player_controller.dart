import 'package:flutter/material.dart';
import 'package:learn_music/model/raw_model/song.dart';
import 'package:learn_music/views/player_view.dart';

class PlayerController extends StatefulWidget {

  final Song songToPlay;
  final List<Song> playlist;

  const PlayerController({required this.songToPlay, required this.playlist});

  @override
  PlayerControllerState createState() => PlayerControllerState();
}

class PlayerControllerState extends State<PlayerController> {

  late Song song;

  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayerView(
      song: song,
    onRepeatPressed: onRepeatPressed,
    onShufflePressed: onShufflePressed,
    onPlayPausePressed: () {  },
    onRewindPressed: () {  },
    onForwardPressed: () {  },
  );

  onRepeatPressed(){}

  onShufflePressed(){}

}