import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/controller/player_controller.dart';
import 'package:learn_music/model/enums/playlist.dart';
import 'package:learn_music/model/raw_model/song.dart';

class PlayListController extends StatelessWidget {
  final List<Song> playlist;
  final String title;
  final Playlist type;
  const PlayListController({required this.title, required this.playlist, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            topView(MediaQuery.of(context).size),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
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
                    ) ;
                  },
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: playlist.length
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topView(Size size) {
    switch (type) {
      case Playlist.artist: return Column(
        children: [
          Text(playlist.first.artist.name, style: GoogleFonts.signika(fontSize: 35),),
          ClipOval(child: Image.network(playlist.first.artist.urlImage, height: 125),)
        ],
      );
      case Playlist.album:
        return Container(
          child: Column(
            children: [
              Image.network(playlist.first.thumb, height: size.height / 4,),
              Text(playlist.first.album, style: GoogleFonts.signika(fontSize: 25),),
              Text(playlist.first.artist.name, style: GoogleFonts.signika(fontSize: 16, color: Colors.red),)
            ],
          ),

        );
      case Playlist.genre: return Center(
        child: Text(playlist.first.genre.name, style: GoogleFonts.signika(fontSize: 35, color: Colors.red),),
      );
      default: return Container();
    }
  }
}