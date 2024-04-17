import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/clutter/theme.dart';
import 'package:music_app/provider/static_provider/albums_provider.dart';
import 'package:music_app/provider/static_provider/artists_provider.dart';
import 'package:music_app/provider/static_provider/tracks_provider.dart';
import 'package:music_app/screen/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsFuture = ref.read(albumsProvider.future);
    final tracksFuture = ref.read(tracksProvider.future);
    final artistsFuture = ref.read(artistsProvider.future);
    return MaterialApp(
      title: 'MusicApp',
      theme: CustomTheme().lightTheme,
      home: const HomeScreen(),
    );
  }
}
