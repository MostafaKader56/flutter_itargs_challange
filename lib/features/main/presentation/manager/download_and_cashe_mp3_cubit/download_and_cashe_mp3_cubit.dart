import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itargs_challange/features/main/data/repos/download_and_cashe_mp3_repo/download_and_cashe_mp3_repo.dart';

part 'download_and_cashe_mp3_state.dart';

class DownloadAndCasheMp3Cubit extends Cubit<DownloadAndCasheMp3State> {
  DownloadAndCasheMp3Cubit(this.downloadAndCasheMp3Repo)
      : super(DownloadAndCasheMp3Initial());

  final DownloadAndCasheMp3Repo downloadAndCasheMp3Repo;

  Future<void> downloadAndCasheMp3(
      {required String filename, required String mp3Url}) async {
    emit(DownloadAndCasheMp3Loading());
    final result = await downloadAndCasheMp3Repo.downloadAndCasheMp3s(
      mp3Filename: filename,
      mp3Url: mp3Url,
    );
    result.fold(
      (l) {
        emit(DownloadAndCasheMp3Failure());
      },
      (r) {
        emit(DownloadAndCasheMp3Success(mp3File: r));
      },
    );
  }
}
