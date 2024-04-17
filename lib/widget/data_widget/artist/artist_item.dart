import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/artist.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_albums.provider.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/screen/artist_details_screen.dart';

class ArtistItem extends ConsumerWidget {
  const ArtistItem({super.key, required this.artist});
  final Artist artist;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              await ref
                  .read(tracksSearcherProvider.notifier)
                  .searchArtistTopTracks(artist.id);
              await ref
                  .read(albumsSearcherProvider.notifier)
                  .searchByArtist(artist.id);
              if (context.mounted) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ArtistDetailsScreen(
                    albums: ref.read(albumsSearcherProvider),
                    artist: artist,
                    tracks: ref.read(tracksSearcherProvider),
                  );
                }));
              }
            },
            child: Hero(
              tag: ValueKey(artist.id),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(artist.imgUrl),
              ),
            ),
          ),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            artist.name,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}
