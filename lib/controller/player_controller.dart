import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_music/model/enums/media_type.dart';
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
  late AudioPlayer audioPlayer;
  AudioCache? audioCache;
  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 0);
  bool playShuffle = false;
  bool repeat = false;

  @override
  void initState() {
    super.initState();
    song = widget.songToPlay;
    setupPlayer();
  }

  @override
  void dispose() {
    clearPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayerView(
      song: song,
      maxDuration: maxDuration,
      position: position,
      shuffle: playShuffle,
      repeat: repeat,

    onRepeatPressed: onRepeatPressed,
    onShufflePressed: onShufflePressed,
    onPlayPausePressed: onPlayPausePressed,
    onRewindPressed: onRewindPressed,
    onForwardPressed: onForwardPressed,
    onPositionChanged: onPositionChanged,
  );

  onRepeatPressed(){
    setState(() {
      repeat = !repeat;
    });
  }

  onShufflePressed(){
    setState(() {
      playShuffle = !playShuffle;
    });
  }

  onPlayPausePressed(){}

  onRewindPressed(){}

  onForwardPressed(){}

  onPositionChanged(double newPosition) {}

  Future<String> pathForInApp() async {
    String string = "";
    audioCache = AudioCache();
    if (audioCache != null) {
      final uri = await audioCache!.load(song.path);
      string = uri.toString();
      return string;
    } else {
      return string;
    }
    return string;
  }

  setupPlayer() async {
    audioPlayer = AudioPlayer();
    final url = (song.mediaType == MediaType.internet) ? song.path : await pathForInApp();
    await audioPlayer.play(UrlSource(url));
  }

  clearPlayer() {
    audioPlayer.stop();
    audioPlayer.dispose();
    if (audioCache != null) audioCache?.clearAll();
    audioCache = null;
  }

}