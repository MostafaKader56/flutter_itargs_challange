import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class DownloadAndCasheMp3Repo {
  Future<Either<void, File>> downloadAndCasheMp3s(
      {required String mp3Filename, required String mp3Url});
}
