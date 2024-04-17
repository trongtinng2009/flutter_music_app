import 'package:flutter/material.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/widget/data_widget/song/action_track_bar.dart';
import 'package:music_app/widget/ui_widget/update_progress/linear_update_progress.dart';

class FullTrack extends StatelessWidget {
  const FullTrack(
      {super.key,
      required this.track,
      required this.nextTrack,
      required this.previousTrack});
  final Track track;
  final void Function() nextTrack, previousTrack;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(track.album!.imgUrl),
              radius: 200,
            ),
            ListTile(
              title: Text(
                track.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_rounded)),
              subtitle: Text(
                track.artists[0].name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const LinearUpdateProgress(),
            ListTile(
              leading: Text(
                '0:00',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Text(
                '0:30',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ActionTrackBar(
              clickNextButton: nextTrack,
              clickPreviousButton: previousTrack,
            ),
          ],
        ),
      ),
    );
  }
}
