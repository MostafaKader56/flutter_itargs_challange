class AudioFile {
  int? id;
  int? chapterId;
  double? fileSize;
  String? format;
  String? audioUrl;

  AudioFile({
    this.id,
    this.chapterId,
    this.fileSize,
    this.format,
    this.audioUrl,
  });

  factory AudioFile.fromJson(Map<String, dynamic> json) => AudioFile(
        id: json['id'] as int?,
        chapterId: json['chapter_id'] as int?,
        fileSize: json['file_size'] as double?,
        format: json['format'] as String?,
        audioUrl: json['audio_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chapter_id': chapterId,
        'file_size': fileSize,
        'format': format,
        'audio_url': audioUrl,
      };
}
