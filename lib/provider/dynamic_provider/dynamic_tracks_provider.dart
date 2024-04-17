import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/api_fetcher.dart';
import 'package:music_app/data/converter/track_converter.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/model/track.dart';

class CurrentTracksNotifier extends StateNotifier<List<Track>> {
  CurrentTracksNotifier() : super([]);

  void addTracks(Track track, List<Track> fetchedTracks) {
    fetchedTracks.removeWhere((t) => t.id == track.id);
    state = [track, ...fetchedTracks];
  }

  void addTracksNoDelete(List<Track> fetchedTracks) {
    state = [...fetchedTracks];
  }

  void removeAllTracks() {
    state = [];
  }
}

class TracksSearcherNotifier extends StateNotifier<List<Track>> {
  TracksSearcherNotifier() : super([]);
  TrackConverter dataConverter = TrackConverter();
  Future<void> searchArtistTopTracks(String id) async {
    state = await (dataConverter
        .convertListData(ApiFetcher.fetchData('v1/artists/$id/top-tracks')));
  }

  Future<void> searchByAlbum(String id, Album album) async {
    state = await (dataConverter.convertListData(
        ApiFetcher.fetchData('v1/albums/$id/tracks'),
        existingAlbum: album));
  }
}

final currentTracksProvider =
    StateNotifierProvider<CurrentTracksNotifier, List<Track>>(
        (ref) => CurrentTracksNotifier());

final tracksSearcherProvider =
    StateNotifierProvider<TracksSearcherNotifier, List<Track>>(
        (ref) => TracksSearcherNotifier());

final currentPlayingTrackProvider = StateProvider<List<Track>>((ref) => []);
