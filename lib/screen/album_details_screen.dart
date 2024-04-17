import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/widget/data_widget/album/album_item.dart';
import 'package:music_app/widget/data_widget/song/list_track.dart';
import 'package:music_app/widget/play_tracks.dart';
import 'package:music_app/widget/ui_widget/icon/background_icon.dart';
import 'package:music_app/widget/ui_widget/stack/vertical_text_in_stack.dart';
import 'package:music_app/widget/ui_widget/text/show_all_item_line.dart';
import 'package:music_app/widget/ui_widget/text/vertical_text.dart';

class AlbumDetailsScreen extends ConsumerWidget {
  const AlbumDetailsScreen(
      {super.key,
      required this.album,
      required this.suggestedAlbums,
      required this.currentTracks});
  final Album album;
  final List<Album> suggestedAlbums;
  final List<Track> currentTracks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 250,
        title: Stack(children: [
          Hero(
            tag: ObjectKey(album),
            child: Image.network(
              album.imgUrl,
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
          VerticalTextInStack(
            mainText: album.name,
            subText: album.artists[0].name,
            bottom: 10,
            left: 30,
          )
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
                VerticalText(
                  mainText: album.name,
                  subText:
                      '${album.artists[0].name} • Since ${album.releaseDate.year}',
                  mainSize: 18,
                  subSize: 16,
                ),
                const SizedBox(
                  height: 12,
                ),
                ListTrack(tracks: currentTracks),
                const SizedBox(
                  height: 20,
                ),
                const ShowAllItemLine(
                  mainText: "Suggested Albums",
                ),
                const SizedBox(
                  height: 12,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) =>
                      AlbumItem(album: suggestedAlbums[index]),
                  itemCount: suggestedAlbums.length,
                ),
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
