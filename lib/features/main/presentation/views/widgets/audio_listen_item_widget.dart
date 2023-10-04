import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itargs_challange/features/main/data/model/load_audio_response/audio_file.dart';
import 'package:flutter_itargs_challange/features/main/presentation/manager/download_and_cashe_mp3_cubit/download_and_cashe_mp3_cubit.dart';

import '../../../../../generated/l10n.dart';

class AudioListenItemWidget extends StatelessWidget {
  const AudioListenItemWidget({super.key, required this.audioFile});

  final AudioFile audioFile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<DownloadAndCasheMp3Cubit>(context)
                .downloadAndCasheMp3(
              filename: '${audioFile.id}.${audioFile.format}',
              mp3Url: audioFile.audioUrl ?? 'xyz',
            );
          },
          icon: const Icon(Icons.play_circle_outline_rounded),
        ),
        const SizedBox(width: 4),
        Text(S.current.play_this),
      ],
    );
  }
}
