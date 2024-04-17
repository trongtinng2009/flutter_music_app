import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/api_fetcher.dart';
import 'package:music_app/data/converter/data_converter.dart';
import 'package:music_app/data/converter/track_converter.dart';
import 'package:music_app/model/track.dart';

List<Track> tracks = [];

final tracksProvider = FutureProvider((ref) async {
  DataConverter data = TrackConverter();
  final results = await data.convertListData(ApiFetcher.fetchData(
      'v1/tracks?ids=0ANTnEM0En14CMHPxs0MZj%2C2GquhrcHbl2zOnF5javAFp%2C2gYj9lubBorOPIVWsTXugG%2C1njlnn8ZKHI77Pe9szIONR%2C3r8RuvgbX9s7ammBn07D3W%2C1ULdASrNy5rurl1TZfFaMP%2C4uOBL4DDWWVx4RhYKlPbPC%2C5SusX17QvBBkH7WfMbTU0j%2C7uyeEbG6hyApgXuEypGcsZ'));
  tracks = results as List<Track>;
  return tracks;
});
