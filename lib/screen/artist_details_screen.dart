import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/model/artist.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/widget/data_widget/album/list_album.dart';
import 'package:music_app/widget/data_widget/song/list_track.dart';
import 'package:music_app/widget/play_tracks.dart';
import 'package:music_app/widget/ui_widget/icon/background_icon.dart';
import 'package:music_app/widget/ui_widget/text/show_all_item_line.dart';
import 'package:music_app/widget/ui_widget/text/vertical_text.dart';

class ArtistDetailsScreen extends ConsumerWidget {
  const ArtistDetailsScreen(
      {super.key,
      required this.artist,
      required this.albums,
      required this.tracks});
  final Artist artist;
  final List<Track> tracks;
  final List<Album> albums;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 250,
        title: Stack(children: [
          Hero(
            tag: ValueKey(artist.id),
            child: Image.network(
              artist.imgUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: BackgroundIcon(
                onClick: () => Navigator.of(context).pop(),
                icon: Icons.arrow_back_ios_new_outlined,
                radius: 20,
                bgColor: Theme.of(context).colorScheme.primary,
              )),
          Positioned(
            bottom: 10,
            left: 30,
            child: Text(
              artist.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ]),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    VerticalText(
                      mainText: artist.name,
                      subText: 'Follower: ${artist.followers}',
                      mainSize: 18,
                      subSize: 16,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      child: const Text(
                        'Follow',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: ShowAllItemLine(
                    mainText: "Top Tracks",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListTrack(tracks: tracks),
                const SizedBox(
                  height: 12,
                ),
                ListAlbum(albums: albums),
              ],
            ),
          ),
        ),
        Offstage(
            offstage: ref.watch(currentPlayingTrackProvider).isEmpty,
            child: const PlayTracks()),
      ]),
    );
  }
}
