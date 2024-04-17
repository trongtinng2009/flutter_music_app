import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/api_fetcher.dart';
import 'package:music_app/data/converter/album_converter.dart';
import 'package:music_app/data/converter/data_converter.dart';
import 'package:music_app/model/album.dart';

List<Album> albums = [];

final albumsProvider = FutureProvider((ref) async {
  DataConverter data = AlbumConverter();
  final results = await data.convertListData(ApiFetcher.fetchData(
      'v1/albums?ids=6irebIc6UO8fN0jl4UlzBS%2C1HMLpmZAnNyl9pxvOnTovV%2C4N1fROq2oeyLGAlQ1C1j18%2C0UHkOZ8WajZ9lJ3Ww6MF4q%2C1AFVTHHm7kKoQ6Rgb25x3p'));
  albums = results as List<Album>;
  return albums;
});

final albumsOffProvider = Provider((ref) {
  ref.watch(albumsProvider);
  return albums;
});
