part of 'load_audio_cubit.dart';

@immutable
sealed class LoadAudioState {}

final class LoadAudioInitial extends LoadAudioState {}

final class LoadAudioLoading extends LoadAudioState {}

final class LoadAudioFailure extends LoadAudioState {}

final class LoadAudioSuccess extends LoadAudioState {
  final AudioFile audioFile;

  LoadAudioSuccess({required this.audioFile});
}
