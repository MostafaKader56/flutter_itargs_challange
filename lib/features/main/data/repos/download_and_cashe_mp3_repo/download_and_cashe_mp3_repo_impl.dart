import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../core/utils/api_service.dart';
import 'download_and_cashe_mp3_repo.dart';

class DownloadAndCasheMp3RepoImpl extends DownloadAndCasheMp3Repo {
  DownloadAndCasheMp3RepoImpl({required this.apiService});
  final ApiService apiService;

  /*
  Note: can i use flutter_cache_manager package for cashing and downloading, but
    i prefere to do it manually.
  */
  @override
  Future<Either<void, File>> downloadAndCasheMp3s(
      {required String mp3Filename, required String mp3Url}) async {
    try {
      String filePath = await _getLocalFilePath(mp3Filename);

      if (await File(filePath).exists()) {
        return Right(File(filePath));
      } else {
        var data = await apiService.getMp3ByUrl(mp3Url: mp3Url);
        File file = File(filePath);
        await file.writeAsBytes(data);

        return Right(File(filePath));
      }
    } catch (e) {
      return const Left(null);
    }
  }

  Future<String> _getLocalFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName';
  }
}
