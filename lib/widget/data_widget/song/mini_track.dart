import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/widget/ui_widget/card/image_card.dart';

class MiniTrack extends ConsumerWidget {
  const MiniTrack({super.key, required this.track});
  final Track track;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: ImageCard(
              url: track.album!.imgUrl, width: 60, height: 60, radius: 5),
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
        LinearProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
