import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/provider/dynamic_provider/track_controller_provider.dart';
import 'package:music_app/utility/track_controller.dart';

class ActionTrackBar extends ConsumerStatefulWidget {
  const ActionTrackBar(
      {super.key,
      required this.clickPreviousButton,
      required this.clickNextButton});
  final void Function() clickPreviousButton, clickNextButton;
  @override
  ConsumerState<ActionTrackBar> createState() => _ActionTrackBarState();
}

class _ActionTrackBarState extends ConsumerState<ActionTrackBar> {
  late TrackController trackController = ref.read(trackControllerProvider);
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
    trackController.audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              trackController.changeLoopingState();
            });
          },
          icon: Icon(Icons.loop_outlined,
              color: trackController.isLooping
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black),
        ),
        IconButton(
            onPressed: widget.clickPreviousButton,
            icon: const Icon(Icons.skip_previous_rounded)),
        Card(
          elevation: 10,
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: IconButton(
              onPressed: () async {
                isPlaying
                    ? await trackController.pause()
                    : await trackController.resume();
              },
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: widget.clickNextButton,
            icon: const Icon(Icons.skip_next_rounded)),
        IconButton(
            onPressed: () {
              setState(() {
                trackController.changeShuffleState;
              });
            },
            icon: Icon(
              Icons.shuffle,
              color: trackController.isShuffle
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black,
            )),
      ],
    );
  }
}
