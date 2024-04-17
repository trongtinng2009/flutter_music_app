import 'package:flutter/material.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/widget/data_widget/album/album_item.dart';

class ListAlbum extends StatelessWidget {
  const ListAlbum({super.key, required this.albums});
  final List<Album> albums;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: ListView.builder(
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: AlbumItem(album: albums[i]),
          ),
          scrollDirection: Axis.horizontal,
          itemCount: albums.length,
        ),
      ),
    );
  }
}
