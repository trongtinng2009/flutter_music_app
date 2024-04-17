import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/api_fetcher.dart';
import 'package:music_app/data/converter/album_converter.dart';
import 'package:music_app/model/album.dart';

class AlbumsSearcherNotifier extends StateNotifier<List<Album>> {
  AlbumsSearcherNotifier() : super([]);

  Future<void> searchByArtist(String artistId,
      {String? removeThisAlbumId, int limit = 4}) async {
    AlbumConverter albumConverter = AlbumConverter();
    state = await albumConverter.convertListData(
      ApiFetcher.fetchData('v1/artists/$artistId/albums?limit=$limit'),
    );
    final clone = state;

    clone.removeWhere((album) => album.id == removeThisAlbumId);
    state = clone;
  }
}

final albumsSearcherProvider =
    StateNotifierProvider<AlbumsSearcherNotifier, List<Album>>(
        (ref) => AlbumsSearcherNotifier());
