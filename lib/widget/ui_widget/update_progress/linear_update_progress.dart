import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/provider/dynamic_provider/track_controller_provider.dart';
import 'package:music_app/utility/track_controller.dart';

class LinearUpdateProgress extends ConsumerStatefulWidget {
  const LinearUpdateProgress({super.key});
  @override
  ConsumerState<LinearUpdateProgress> createState() {
    return _StateLinearUpdateProgress();
  }
}

class _StateLinearUpdateProgress extends ConsumerState<LinearUpdateProgress> {
  late TrackController trackController;
  Duration trackDuration = Duration.zero;
  double currentProgress = 0;
  late StreamSubscription<Duration> _positionChangeSubscription;
  @override
  void initState() {
    super.initState();
    trackController = ref.read(trackControllerProvider);
    getDuration();
    _positionChangeSubscription =
        trackController.audioPlayer.onPositionChanged.listen((duration) {
      setState(() {
        currentProgress = duration.inSeconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _positionChangeSubscription.cancel();
    super.dispose();
  }

  Future<void> getDuration() async {
    trackDuration = await trackController.audioPlayer.getDuration() as Duration;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (value) async {
        await trackController.seek(Duration(seconds: value.toInt()));
      },
      value: currentProgress,
      max: trackDuration.inSeconds.toDouble(),
    );
  }
}
