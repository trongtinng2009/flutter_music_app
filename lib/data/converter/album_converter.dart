import 'dart:convert';
import 'package:http/http.dart';
import 'package:music_app/data/converter/data_converter.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/model/artist.dart';

class AlbumConverter implements DataConverter {
  @override
  Album convertSingleData(Map<String, dynamic> item) {
    Album album = Album(
        artists: convertListArtistInAlbum(item),
        id: item['id'],
        albumType: AlbumType.values.byName(item['album_type']),
        totalTrack: item['total_tracks'],
        imgUrl: item['images'][0]['url'],
        name: item['name'],
        releaseDate: DateTime.parse(item['release_date']));
    return album;
  }

  @override
  Future<List<Album>> convertListData(Future<Response> response) async {
    final data = await response;
    final decodedData = json.decode(data.body);
    final List<Album> resultList = [];
    final List<dynamic> items = decodedData["albums"] ?? decodedData["items"];
    for (final item in items) {
      Album album = convertSingleData(item);
      resultList.add(album);
    }
    return resultList;
  }

  List<Artist> convertListArtistInAlbum(Map<String, dynamic> item) {
    final List<dynamic> encodedArtists = item['artists'];
    final List<Artist> artists = [];
    for (final artist in encodedArtists) {
      Artist newA = Artist(
          id: artist['id'],
          name: artist['name'],
          imgUrl: "",
          followers: 0,
          genres: [],
          popularity: 0,
          uri: artist['uri']);
      artists.add(newA);
    }
    return artists;
  }
}
