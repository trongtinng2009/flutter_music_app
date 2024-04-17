import 'dart:convert';
import 'package:http/http.dart';
import 'package:music_app/data/converter/album_converter.dart';
import 'package:music_app/data/converter/data_converter.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/model/artist.dart';
import 'package:music_app/model/track.dart';

class TrackConverter implements DataConverter {
  @override
  Future<List<Track>> convertListData(Future<Response> response,
      {Album? existingAlbum}) async {
    final data = await response;
    final decodedData = json.decode(data.body);
    final List<Track> resultList = [];
    final List<dynamic> items = decodedData["tracks"] ?? decodedData["items"];
    for (final item in items) {
      Track track = convertSingleData(item, existingAlbum: existingAlbum);
      resultList.add(track);
    }
    return resultList;
  }

  @override
  Track convertSingleData(Map<String, dynamic> item, {Album? existingAlbum}) {
    DataConverter converter = AlbumConverter();
    Album? album;
    final Map<String, dynamic>? key = item["album"];
    album = key != null ? converter.convertSingleData(key) : existingAlbum;
    Track track = Track(
        artists: convertListArtistInTrack(item),
        previewUrl: item['preview_url'],
        id: item['id'],
        name: item['name'],
        album: album,
        uri: item['uri'],
        popularity: item['popularity'] ?? 0);
    return track;
  }

  List<Artist> convertListArtistInTrack(Map<String, dynamic> item) {
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
