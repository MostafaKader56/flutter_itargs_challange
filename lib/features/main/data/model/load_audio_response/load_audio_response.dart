import 'audio_file.dart';

class LoadAudioResponse {
  AudioFile? audioFile;

  LoadAudioResponse({this.audioFile});

  factory LoadAudioResponse.fromJson(Map<String, dynamic> json) {
    return LoadAudioResponse(
      audioFile: json['audio_file'] == null
          ? null
          : AudioFile.fromJson(json['audio_file'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'audio_file': audioFile?.toJson(),
      };
}
