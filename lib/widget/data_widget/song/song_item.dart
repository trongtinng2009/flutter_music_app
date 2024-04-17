import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/widget/ui_widget/card/image_card.dart';

class SongItem extends ConsumerWidget {
  const SongItem({super.key, required this.track, required this.onClickTrack});
  final Track track;
  final void Function(Track track, WidgetRef ref) onClickTrack;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        onClickTrack(track, ref);
      },
      child: ListTile(
        leading: track.album != null
            ? ImageCard(
                url: track.album!.imgUrl, width: 60, height: 60, radius: 5)
            : null,
        title: Text(
          track.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: const Icon(Icons.more_vert),
        subtitle: Text(
          track.artists[0].name,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
