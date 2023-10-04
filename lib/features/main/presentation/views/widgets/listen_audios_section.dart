import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itargs_challange/core/dialog/play_this_dialog.dart';
import 'package:flutter_itargs_challange/core/functions/functions.dart';
import 'package:flutter_itargs_challange/core/widget/error_widget.dart';
import 'package:flutter_itargs_challange/features/main/presentation/manager/download_and_cashe_mp3_cubit/download_and_cashe_mp3_cubit.dart';
import 'package:flutter_itargs_challange/features/main/presentation/manager/load_audio_cubit/load_audio_cubit.dart';
import 'package:flutter_itargs_challange/features/main/presentation/views/widgets/audio_listen_item_widget.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../generated/l10n.dart';

class ListenAudiosSection extends StatelessWidget {
  const ListenAudiosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadAndCasheMp3Cubit, DownloadAndCasheMp3State>(
      listener: (context, state) async {
        if (state is DownloadAndCasheMp3Loading) {
          Functions.showExtemistLoadingDialog(context, S.current.loading_mp3);
        } else if (state is DownloadAndCasheMp3Failure) {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }

          Functions.showAlerDialog(
            title: S.current.error,
            message: S.current.error_with_loading_mp3,
            buttonOneText: S.current.ok,
          );
        } else if (state is DownloadAndCasheMp3Success) {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
          showDialog(
            context: AppRouter.navigatorKey.currentContext!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return PlayThisDialog(audioFile: state.mp3File);
            },
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.current.listen_audios,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<LoadAudioCubit, LoadAudioState>(
            builder: (context, state) {
              if (state is LoadAudioLoading) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is LoadAudioFailure) {
                return ErrorWidgetSample(
                    text: S.current.error,
                    onPressed: () {
                      BlocProvider.of<LoadAudioCubit>(context).loadAudio();
                    });
              }
              if (state is LoadAudioSuccess) {
                return AudioListenItemWidget(audioFile: state.audioFile);
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
