import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayThisDialog extends StatefulWidget {
  const PlayThisDialog({super.key, required this.audioFile});

  final File audioFile;

  @override
  State<PlayThisDialog> createState() => _PlayThisDialogState();
}

class _PlayThisDialogState extends State<PlayThisDialog> {
  late final AudioPlayer audioPlayer;
  late bool isPlaying;
  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioPlayer.play(DeviceFileSource(widget.audioFile.path));
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    });
    isPlaying = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: contentBox(context),
        ),
      ),
    );
  }

  Widget contentBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (isPlaying) {
                audioPlayer.pause();
              } else {
                audioPlayer.resume();
              }
              isPlaying = !isPlaying;
              setState(() {});
            },
            icon: Icon(
              isPlaying
                  ? Icons.pause_circle_outline_rounded
                  : Icons.play_circle_outline,
              size: 50,
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () {
              audioPlayer.release();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.stop_circle_outlined,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
