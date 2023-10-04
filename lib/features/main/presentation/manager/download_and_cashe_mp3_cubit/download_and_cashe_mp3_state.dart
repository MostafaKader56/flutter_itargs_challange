part of 'download_and_cashe_mp3_cubit.dart';

@immutable
sealed class DownloadAndCasheMp3State {}

final class DownloadAndCasheMp3Initial extends DownloadAndCasheMp3State {}

final class DownloadAndCasheMp3Loading extends DownloadAndCasheMp3State {}

final class DownloadAndCasheMp3Success extends DownloadAndCasheMp3State {
  final File mp3File;

  DownloadAndCasheMp3Success({required this.mp3File});
}

final class DownloadAndCasheMp3Failure extends DownloadAndCasheMp3State {}
