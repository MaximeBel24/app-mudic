import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/raw_model/song.dart';

class PlayerView extends StatelessWidget {
   final Song song;
   final EdgeInsets padding = const EdgeInsets.all(8);
   final Container spacer = Container(width: 16);
   final Color bgDarkRed = const Color.fromRGBO(100, 11, 11, 0.75);
   final Function() onRepeatPressed;
   final Function() onShufflePressed;
   final Function() onPlayPausePressed;
   final Function() onRewindPressed;
   final Function() onForwardPressed;


   PlayerView({
     required this.song,
     required this.onRepeatPressed,
     required this.onShufflePressed,
     required this.onPlayPausePressed,
     required this.onRewindPressed,
     required this.onForwardPressed
   });

   @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgDarkRed,
      appBar: AppBar(
        backgroundColor: bgDarkRed,
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
                color: bgDarkRed,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(onPressed: onRepeatPressed, icon: const Icon(Icons.repeat)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: padding, child: IconButton(icon: const Icon(Icons.fast_rewind), onPressed: onRewindPressed,),),
                            Padding(padding: padding, child: IconButton(icon: const Icon(Icons.play_arrow), onPressed: onPlayPausePressed,),),
                            Padding(padding: padding, child: IconButton(icon: const Icon(Icons.fast_forward), onPressed: onForwardPressed,),)
                          ],
                        ),
                        IconButton(onPressed: onShufflePressed, icon: const Icon(Icons.shuffle))
                      ],
                    ),
                    Column(

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
}