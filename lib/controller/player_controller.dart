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
  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 0);

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
      maxDuration: maxDuration,
      position: position,
    onRepeatPressed: onRepeatPressed,
    onShufflePressed: onShufflePressed,
    onPlayPausePressed: onPlayPausePressed,
    onRewindPressed: onRewindPressed,
    onForwardPressed: onForwardPressed,
    onPositionChanged: onPositionChanged,
  );

  onRepeatPressed(){}

  onShufflePressed(){}

  onPlayPausePressed(){}

  onRewindPressed(){}

  onForwardPressed(){}

  onPositionChanged(double newPosition) {}

}