import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/services/music_handler.dart';
import 'package:learn_music/views/cells/album_view_cell.dart';

import '../../model/raw_model/album.dart';

class AlbumsContainer extends StatelessWidget {
  List<Album> albums = MusicHandler().allAlbums();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Albums : ", style: GoogleFonts.signika(fontSize: 20)),
          Container(
            height: 300,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 9, crossAxisSpacing: 9),
                itemBuilder: ((context, index) => AlbumViewCell(album: albums[index]))
            )
          )
        ],
      ),
    );
  }
}