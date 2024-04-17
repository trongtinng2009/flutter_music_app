import 'package:flutter/material.dart';
import 'package:music_app/model/artist.dart';
import 'package:music_app/widget/data_widget/artist/artist_item.dart';

class ListArtist extends StatelessWidget {
  const ListArtist({super.key, required this.artists});
  final List<Artist> artists;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: SizedBox(
        width: double.infinity,
        height: 230,
        child: ListView.builder(
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: ArtistItem(artist: artists[i]),
          ),
          scrollDirection: Axis.horizontal,
          itemCount: artists.length,
        ),
      ),
    );
  }
}
