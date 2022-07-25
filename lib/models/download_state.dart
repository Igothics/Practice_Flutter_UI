import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_flutter_ui/models/download_status.dart';

part 'download_state.freezed.dart';


@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    @Default(DownloadStatus.standby) DownloadStatus downloadStatus,
    @Default(0.0) double progress,
    @Default(false) bool isDownloading,
  }) = _DownloadState;
}