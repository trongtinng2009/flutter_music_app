import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/provider/static_provider/albums_provider.dart';
import 'package:music_app/provider/static_provider/artists_provider.dart';
import 'package:music_app/provider/static_provider/tracks_provider.dart';
import 'package:music_app/widget/data_widget/album/list_album.dart';
import 'package:music_app/widget/data_widget/artist/list_artist.dart';
import 'package:music_app/widget/data_widget/song/banner_song.dart';
import 'package:music_app/widget/data_widget/song/column_song.dart';
import 'package:music_app/widget/ui_widget/text/show_all_item_line.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsFuture = ref.read(albumsProvider.future);
    final tracksFuture = ref.read(tracksProvider.future);
    final artistsFuture = ref.read(artistsProvider.future);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BannerSong(mvUrl: 'assets/video/ditto.mp4'),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ShowAllItemLine(mainText: 'Trending Albums'),
          ),
          FutureBuilder(
            future: albumsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListAlbum(albums: snapshot.data!);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ShowAllItemLine(mainText: 'Trending songs'),
          ),
          FutureBuilder(
            future: tracksFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListSong(tracks: snapshot.data!);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ShowAllItemLine(
              mainText: 'Trending Artists',
            ),
          ),
          FutureBuilder(
            future: artistsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListArtist(artists: snapshot.data!);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
