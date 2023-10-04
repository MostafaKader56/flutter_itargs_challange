import 'package:dartz/dartz.dart';
import 'package:flutter_itargs_challange/core/utils/api_service.dart';

import 'package:flutter_itargs_challange/features/main/data/model/load_audio_response/load_audio_response.dart';

import 'load_audio_repo.dart';

class LoadAudioRepoImpl extends LoadAudioRepo {
  LoadAudioRepoImpl({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<void, LoadAudioResponse>> loadAudios() async {
    try {
      var data = await apiService.get(endPoint: 'chapter_recitations/1/1');
      return Right(LoadAudioResponse.fromJson(data));
    } catch (e) {
      return const Left(null);
    }
  }
}
