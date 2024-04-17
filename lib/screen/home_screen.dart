import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/screen/discover_screen.dart';
import 'package:music_app/widget/bottom_navigation.dart';
import 'package:music_app/widget/main_drawer.dart';
import 'package:music_app/widget/play_tracks.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _StateHomeScreen();
  }
}

class _StateHomeScreen extends ConsumerState<HomeScreen> {
  Widget activeScreen = const DiscoverScreen();
  void _changeScreen(int id) {
    if (id == 0) {
      setState(() {
        activeScreen = const DiscoverScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 5,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        centerTitle: true,
        title: const Text(
          'Discover',
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        onClickItem: _changeScreen,
      ),
      body: Stack(
        children: [
          activeScreen,
          Offstage(
              offstage: ref.watch(currentPlayingTrackProvider).isEmpty,
              child: const PlayTracks()),
        ],
      ),
    );
  }
}
