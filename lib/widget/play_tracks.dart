import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/provider/dynamic_provider/dynamic_tracks_provider.dart';
import 'package:music_app/provider/dynamic_provider/track_controller_provider.dart';
import 'package:music_app/utility/track_controller.dart';
import 'package:music_app/widget/data_widget/song/full_track.dart';
import 'package:music_app/widget/data_widget/song/mini_track.dart';

class PlayTracks extends ConsumerStatefulWidget {
  const PlayTracks({super.key});
  @override
  ConsumerState<PlayTracks> createState() {
    return _StatePlayTracks();
  }
}

class _StatePlayTracks extends ConsumerState<PlayTracks> {
  late TrackController trackController;
  late List<Track> tracks;

  void initiateTracks() async {
    await trackController
        .playing(tracks[trackController.currentTrackIndex].previewUrl);
  }

  void changeTrackIndex(int index) {
    if (context.mounted) {
      setState(() {
        trackController.changeIndex(index);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    trackController = ref.read(trackControllerProvider);
    trackController.clickToUpdateTrack = changeTrackIndex;
    trackController.audioPlayer.onPlayerComplete.listen((event) {
      if (tracks.isNotEmpty) {
        setState(() {
          if (trackController.isShuffle) {
            final random = Random();
            trackController.currentTrackIndex = random.nextInt(tracks.length);
          } else if (trackController.currentTrackIndex == tracks.length - 1 &&
              !trackController.isLooping) {
            trackController.currentTrackIndex = 0;
          } else if (!trackController.isLooping) {
            trackController.nextIndex;
          }
        });
      }
    });
  }

  void _onDismissMiniPlayer() {
    trackController.currentTrackIndex = 0;
    ref.read(currentPlayingTrackProvider.notifier).state = [];
    ref.read(trackControllerProvider).audioPlayer.pause();
  }

  void nextTrack() {
    setState(() {
      if (trackController.currentTrackIndex == tracks.length - 1) {
        trackController.currentTrackIndex = 0;
      } else {
        trackController.nextIndex;
      }
    });
  }

  void previousTrack() {
    setState(() {
      if (trackController.currentTrackIndex == 0) {
        trackController.currentTrackIndex = tracks.length - 1;
      } else {
        trackController.previousIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    tracks = ref.watch(currentPlayingTrackProvider);
    initiateTracks();
    return tracks.isNotEmpty
        ? Miniplayer(
            onDismissed: _onDismissMiniPlayer,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 10,
            minHeight: 80,
            maxHeight: MediaQuery.of(context).size.height,
            builder: ((height, percentage) {
              if (MediaQuery.of(context).size.height * percentage <= 80) {
                return MiniTrack(
                  track: tracks[trackController.currentTrackIndex],
                );
              }
              return FullTrack(
                nextTrack: nextTrack,
                previousTrack: previousTrack,
                track: tracks[trackController.currentTrackIndex],
              );
            }))
        : const SizedBox(
            width: double.infinity,
            height: 60,
            child: CircularProgressIndicator(),
          );
  }
}
