import 'dart:ui';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {Key? key, required this.videoUrl, required this.thumbnail})
      : super(key: key);
  final String videoUrl, thumbnail;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String? videoUrl;

  @override
  void initState() {
    super.initState();
    videoUrl = widget.videoUrl;

    videoPlayerController = VideoPlayerController.network(videoUrl!)
      ..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        exitFullscreenOnEnd: true,
        playOnlyOnce: false,
        playButton: const Icon(
          Icons.play_arrow,
          size: 20,
          color: brandYellowColor,
        ),
        pauseButton: const Icon(
          Icons.pause,
          size: 20,
          color: brandYellowColor,
        ),
        settingsButton: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(6)),
          child: const Icon(
            Icons.settings,
            color: whiteColor,
            size: 20,
          ),
        ),
        controlBarPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        controlBarDecoration: BoxDecoration(
          color: primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.thumbnail), fit: BoxFit.cover),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: whiteColor.withOpacity(0.5)),
            child: Stack(
              children: [
                SizedBox(
                  height: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                    colors: [
                      Colors.deepPurple.shade200,
                      brandYellowColor,
                      coolGreen,
                      color100,
                      Colors.blue.shade300
                    ],
                  ),
                ),
                CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
