import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/services/music_handler.dart';
import 'package:learn_music/views/cells/artist_circle_cell.dart';

import '../../model/raw_model/artist.dart';

class ArtistContainer extends StatelessWidget{

  final List<Artist> artists = MusicHandler().allArtists();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Artistes", style: GoogleFonts.signika(fontSize: 20)),
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => ArtistCircleCell(artist: artists[index], height: 75)),
              itemCount: artists.length,
            ),
          )
        ],
      ),
    );
  }
}