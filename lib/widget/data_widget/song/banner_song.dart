import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/widget/ui_widget/stack/vertical_text_in_stack.dart';
import 'package:video_player/video_player.dart';

class BannerSong extends StatefulWidget {
  const BannerSong({super.key, required this.mvUrl});
  final String mvUrl;

  @override
  State<StatefulWidget> createState() {
    return _StateBannerSong();
  }
}

class _StateBannerSong extends State<BannerSong> {
  bool _isIconVisible = false;
  late VideoPlayerController _videoPlayerController;
  late Future<void> _file;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.mvUrl);
    _file = _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onClickSong() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    } else if (!_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    setState(() {
      _isIconVisible = true;
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isIconVisible = !_isIconVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget hasContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Text(
            'MV of the weeks',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              InkWell(
                onTap: _onClickSong,
                child: Card(
                  //key: _cardKey,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                ),
              ),
              const VerticalTextInStack(
                  top: 15, left: 20, mainText: 'Mv Name', subText: 'Artist'),
              Positioned.fill(
                child: Visibility(
                  visible: _isIconVisible,
                  child: Icon(
                    _videoPlayerController.value.isPlaying
                        ? Icons.not_started_outlined
                        : Icons.pause_circle_outline_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
    return FutureBuilder(
        future: _file,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return hasContent;
          } else {
            return const Center(
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator()),
            );
          }
        });
  }
}
