import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/audio_book_model.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/funcs.dart';

class AudioBookTile extends StatefulWidget {
  const AudioBookTile({Key? key, required this.book}) : super(key: key);
  final AudioBook book;

  @override
  State<AudioBookTile> createState() => _AudioBookTileState();
}

class _AudioBookTileState extends State<AudioBookTile> {
  final audioPlayer = AudioPlayer();
  bool isAudioPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isAudioPlaying = state == PlayerState.playing;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200.withOpacity(0.7),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.book.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "By ",
                  style: TextStyle(color: blackColor),
                ),
                TextSpan(
                  text: widget.book.author,
                  style: const TextStyle(color: primaryColor),
                ),
                TextSpan(
                  text:
                      " |${months[widget.book.createdAt.month - 1]} ${widget.book.createdAt.year}",
                  style: const TextStyle(color: blackColor),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      if (isAudioPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play(UrlSource(widget.book.audioUrl));
                      }
                    },
                    child: Icon(
                      isAudioPlaying ? Icons.pause_circle : Icons.play_circle,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final _position = Duration(seconds: value.toInt());
                        await audioPlayer.seek(_position);

                        await audioPlayer.resume();
                      },
                      activeColor: primaryColor,
                      inactiveColor: whiteColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(formatTime(position)),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  SizedBox(height: 10),
                  Icon(
                    Icons.volume_up,
                    color: primaryColor,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
