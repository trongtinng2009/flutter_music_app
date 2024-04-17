import 'package:audioplayers/audioplayers.dart';

class TrackController {
  AudioPlayer audioPlayer = AudioPlayer();
  int currentTrackIndex = 0;
  bool isLooping = false;
  bool isShuffle = false;
  late void Function(int i) clickToUpdateTrack;
  Future<void> playing(String url) async {
    await audioPlayer.setSourceUrl(url);
    await audioPlayer.resume();
  }

  void changeLoopingState() {
    if (isLooping) {
      isLooping = false;
      audioPlayer.setReleaseMode(ReleaseMode.release);
    } else {
      isLooping = true;
      audioPlayer.setReleaseMode(ReleaseMode.loop);
    }
  }

  void changeIndex(int index) {
    currentTrackIndex = index;
  }

  void updateIndex(int index) {
    clickToUpdateTrack(index);
  }

  void get changeShuffleState => isShuffle = !isShuffle;
  void get nextIndex => currentTrackIndex++;
  void get previousIndex => currentTrackIndex--;

  Future<void> pause() async => await audioPlayer.pause();

  Future<void> resume() async => await audioPlayer.resume();

  Future<void> seek(Duration position) async =>
      await audioPlayer.seek(position);

  void reset() {
    audioPlayer.dispose();
    audioPlayer = AudioPlayer();
  }
}
