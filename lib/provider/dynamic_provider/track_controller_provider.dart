import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/utility/track_controller.dart';

class TrackControllerNotifier extends StateNotifier<TrackController> {
  TrackControllerNotifier() : super(TrackController());
}

final trackControllerProvider =
    StateNotifierProvider<TrackControllerNotifier, TrackController>(
  (ref) => TrackControllerNotifier(),
);
