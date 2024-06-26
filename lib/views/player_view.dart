import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/raw_model/song.dart';

class PlayerView extends StatelessWidget {

   final Song song;
   final EdgeInsets padding = const EdgeInsets.all(8);
   final Container spacer = Container(width: 16);
   final Color bgDarkRed = const Color.fromRGBO(100, 11, 11, 0.75);
   final Duration maxDuration;
   final Duration position;
   final bool shuffle;
   final bool repeat;
   final IconData playPauseIcon;
   final Color backgroundColor;

   final Function() onRepeatPressed;
   final Function() onShufflePressed;
   final Function() onPlayPausePressed;
   final Function() onRewindPressed;
   final Function() onForwardPressed;
   final Function(double) onPositionChanged;

   PlayerView({
     required this.song,
     required this.maxDuration,
     required this.position,
     required this.shuffle,
     required this.repeat,
     required this.playPauseIcon,
     required this.backgroundColor,

     required this.onRepeatPressed,
     required this.onShufflePressed,
     required this.onPlayPausePressed,
     required this.onRewindPressed,
     required this.onForwardPressed,
     required this.onPositionChanged
   });

   @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(song.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              child: Image.network(
                  song.thumb,
                fit: BoxFit.fill,
                height: size.width / 2,
              ),
            ),
            const Divider(thickness: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.ios_share),
                spacer,
                const Icon(Icons.menu),
                spacer,
                const Icon(Icons.whatshot)
              ],
            ),
            Text(song.artist.name, style: GoogleFonts.signika(color: Colors.redAccent, fontSize: 35)),
            Text(song.title, style: GoogleFonts.signika(fontWeight: FontWeight.bold, fontSize: 25)),
            Card(
              child: Container(
                color: backgroundColor.withOpacity(0.75),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(onPressed: onRepeatPressed, icon: Icon((repeat) ? Icons.repeat_on_outlined : Icons.repeat),),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: padding, child: IconButton(icon: const Icon(Icons.fast_rewind), onPressed: onRewindPressed,),),
                            Padding(padding: padding, child: IconButton(icon: Icon(playPauseIcon), onPressed: onPlayPausePressed,),),
                            Padding(padding: padding, child: IconButton(icon: const Icon(Icons.fast_forward), onPressed: onForwardPressed,),)
                          ],
                        ),
                        IconButton(onPressed: onShufflePressed, icon: Icon((shuffle) ? Icons.shuffle_on_outlined : Icons.shuffle))
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(0.toString(), style: GoogleFonts.signika(fontSize: 18),),
                            Text(readableDuration(position), style: GoogleFonts.signika(fontSize: 18),),
                            Text(readableDuration(maxDuration), style: GoogleFonts.signika(fontSize: 18),),
                          ],
                        ),
                        Slider(
                          min: 0,
                            max: maxDuration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: onPositionChanged,
                          thumbColor: Colors.red,
                          activeColor: Colors.red,
                          inactiveColor: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.speaker),
                Icon(Icons.timer),
                Icon(Icons.whatshot_outlined)
              ],
            )
          ],
        ),
      ),
    );
  }

  String readableDuration(Duration duration) {
     int minutes = duration.inMinutes.remainder(60);
     int seconds = duration.inSeconds.remainder(60);
     String minutesStr = (minutes < 10) ? "0$minutes" : minutes.toString();
     String secondsStr = (minutes < 10) ? "0$seconds" : seconds.toString();
     return "$minutesStr:$secondsStr";
  }
}