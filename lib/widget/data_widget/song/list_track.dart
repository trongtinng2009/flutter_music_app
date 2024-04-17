import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/provider/dynamic_provider/track_controller_provider.dart';
import 'package:music_app/widget/data_widget/song/song_item.dart';

class ListTrack extends ConsumerWidget {
  const ListTrack({super.key, required this.tracks});
  final List<Track> tracks;

  void clickToPlayTrack(Track track, WidgetRef ref) {
    final clickedTrackIndex = tracks.indexOf(track);
    ref.read(currentPlayingTrackProvider.notifier).state = tracks;
    ref.read(trackControllerProvider).updateIndex(clickedTrackIndex);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (ctx, i) => SongItem(
        track: tracks[i],
        onClickTrack: clickToPlayTrack,
      ),
      itemCount: tracks.length,
    );
  }
}
