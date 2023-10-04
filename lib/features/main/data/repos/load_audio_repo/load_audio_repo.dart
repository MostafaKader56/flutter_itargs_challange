import 'package:dartz/dartz.dart';
import 'package:flutter_itargs_challange/features/main/data/model/load_audio_response/load_audio_response.dart';

abstract class LoadAudioRepo {
  Future<Either<void, LoadAudioResponse>> loadAudios();
}
