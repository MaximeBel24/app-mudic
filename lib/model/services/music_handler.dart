import 'package:learn_music/model/services/music_datas.dart';

import '../enums/genre.dart';
import '../raw_model/album.dart';
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

  List<Album> allAlbums(){
    List<Album> albums = [];
    final all = datas.allDatas();
    for (var song in all) {
      final singer = song.artist.name;
      final albumTitle = song.album;
      Album newAlbum = albums.firstWhere((album) => (album.artist.name == singer && album.title == albumTitle),
      orElse: () => Album(title: song.album, artist: song.artist, songs: [song]));
      if (!newAlbum.songs.contains(song)) newAlbum.songs.add(song);
      if (!albums.contains(newAlbum)) albums.add(newAlbum);
    }
    return albums;
  }

  List<Genre> allGenres() {
    List<Genre> genres = [];
    final all = datas.allDatas();
    for (var song in all) {
      if (!genres.contains(song.genre)) genres.add(song.genre);
    }
    return genres;
  }

}