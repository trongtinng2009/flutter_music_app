import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/model/album.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_albums.provider.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/screen/album_details_screen.dart';
import 'package:music_app/widget/ui_widget/card/image_card.dart';
import 'package:music_app/widget/ui_widget/stack/vertical_text_in_stack.dart';

class AlbumItem extends ConsumerWidget {
  const AlbumItem({super.key, required this.album});
  final Album album;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        await ref
            .read(tracksSearcherProvider.notifier)
            .searchByAlbum(album.id, album);
        await ref
            .read(albumsSearcherProvider.notifier)
            .searchByArtist(album.artists[0].id);
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AlbumDetailsScreen(
                    album: album,
                    currentTracks: ref.read(tracksSearcherProvider),
                    suggestedAlbums: ref.read(albumsSearcherProvider),
                  )));
        }
      },
      child: Stack(
        children: [
          Hero(
            tag: ObjectKey(album),
            child: ImageCard(
                url: album.imgUrl,
                width: 220,
                height: double.infinity,
                radius: 20),
          ),
          VerticalTextInStack(
              bottom: 15,
              left: 20,
              mainText: album.name,
              subText: album.artists[0].name),
        ],
      ),
    );
  }
}
