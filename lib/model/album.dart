import 'package:music_app/model/artist.dart';

enum AlbumType {
  album,
  single,
  compilation,
}

class Album {
  const Album(
      {required this.id,
      required this.albumType,
      required this.totalTrack,
      required this.imgUrl,
      required this.name,
      required this.artists,
      required this.releaseDate});
  final int totalTrack;
  final AlbumType albumType;
  final String id, name, imgUrl;
  final DateTime releaseDate;
  final List<Artist> artists;

  @override
  String toString() {
    return "Name: $name, Total Tracks: $totalTrack, Album Type: $albumType, Image: $imgUrl";
  }
}
