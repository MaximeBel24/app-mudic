import 'package:learn_music/model/services/music_datas.dart';

import '../raw_model/artist.dart';

class MusicHandler {
  final datas = MusicDatas();

  List<Artist> allArtists(){
    List<Artist> artists = [];
    final all = datas.allDatas();
    for (var song in all) {
      if (!artists.contains(song.artist)) {
        artists.add(song.artist);
      }
    }
    return artists;
  }

}