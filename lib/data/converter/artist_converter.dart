import 'dart:convert';

import 'package:http/http.dart';
import 'package:music_app/data/converter/data_converter.dart';
import 'package:music_app/model/artist.dart';

class ArtistConverter implements DataConverter {
  @override
  Future<List<Artist>> convertListData(Future<Response> response) async {
    final data = await response;
    final decodedData = json.decode(data.body);
    final List<Artist> resultList = [];
    final List<dynamic> items = decodedData["artists"];
    for (final item in items) {
      Artist artist = convertSingleData(item);
      resultList.add(artist);
    }
    return resultList;
  }

  @override
  Artist convertSingleData(Map<String, dynamic> item) {
    Artist artist = Artist(
        id: item['id'],
        name: item['name'],
        imgUrl: item['images'][0]['url'],
        followers: item['followers']['total'],
        genres: List<String>.from(item['genres'] as List),
        popularity: item['popularity'],
        uri: item['uri']);
    return artist;
  }
}
