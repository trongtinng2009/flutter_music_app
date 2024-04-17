import 'package:music_app/model/album.dart';
import 'package:music_app/model/artist.dart';

class Track {
  const Track(
      {required this.id,
      required this.name,
      this.album,
      required this.uri,
      required this.artists,
      required this.previewUrl,
      required this.popularity});
  final String id, name, uri, previewUrl;
  final int popularity;
  final Album? album;
  final List<Artist> artists;

  @override
  String toString() {
    return "Name: $name, Album: [${album.toString()}]";
  }
}
