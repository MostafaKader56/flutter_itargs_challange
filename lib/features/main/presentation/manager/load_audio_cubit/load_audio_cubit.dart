import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itargs_challange/core/functions/functions.dart';
import 'package:flutter_itargs_challange/core/repo/shared_pref_helper.dart';
import 'package:flutter_itargs_challange/features/main/data/model/load_audio_response/audio_file.dart';
import 'package:flutter_itargs_challange/features/main/data/repos/load_audio_repo/load_audio_repo.dart';

import '../../../../../generated/l10n.dart';

part 'load_audio_state.dart';

class LoadAudioCubit extends Cubit<LoadAudioState> {
  LoadAudioCubit(this.loadAudioRepo) : super(LoadAudioInitial());

  final LoadAudioRepo loadAudioRepo;

  Future<void> loadAudio() async {
    emit(LoadAudioLoading());
    final result = await loadAudioRepo.loadAudios();
    result.fold(
      (l) {
        AudioFile? audioFile = SharedPrefsHelper.getAudioFileFromPrefs();
        if (audioFile == null) {
          emit(LoadAudioFailure());
        } else {
          Functions.showToast(S.current.data_is_from_local);
          emit(LoadAudioSuccess(audioFile: audioFile));
        }
      },
      (r) {
        SharedPrefsHelper.setAudioFile(r.audioFile ?? AudioFile());
        emit(LoadAudioSuccess(audioFile: r.audioFile ?? AudioFile()));
      },
    );
  }
}
