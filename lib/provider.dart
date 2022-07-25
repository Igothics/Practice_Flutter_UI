import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/models/download_state.dart';
import 'package:practice_flutter_ui/models/download_status.dart';

class DownloadStateNotifier extends StateNotifier<DownloadState> {
  DownloadStateNotifier({required this.index}) : super(const DownloadState());
  final int index;

  void download() {
    if (state.downloadStatus == DownloadStatus.standby) {
      _fakeDownloadProgress();
    }
  }

  void cancel() {
    if (state.isDownloading) {
      state = state.copyWith(
        downloadStatus: DownloadStatus.standby,
        progress: 0.0,
        isDownloading: false,
      );
    }
  }

  void openFile(BuildContext context) {
    if (state.downloadStatus == DownloadStatus.downloaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Open App #$index",),
        ),
      );
    }
  }

  List<double> _generateStopsList() {
    final limit = Random().nextInt(5) + 2;
    final List<double> generatedList = List.generate(
        limit, (_) => Random().nextDouble())
        .map((e) => double.parse(e.toStringAsFixed(2)))
        .toList()
        ..sort();
    return [0.0, ...generatedList, 1.0];
  }

  Future<void> _fakeDownloadProgress() async {
    debugPrint("Download request");
    state = state.copyWith(isDownloading: true, downloadStatus: DownloadStatus.fetching);
    await Future.delayed(const Duration(seconds: 1));
    if(!state.isDownloading) {
      return;
    }
    debugPrint("Fetching done");

    state = state.copyWith(downloadStatus: DownloadStatus.downloading);
    final downloadProgressStop = _generateStopsList();
    for (final stop in downloadProgressStop){
      await Future.delayed(const Duration(seconds: 1));
      if(!state.isDownloading) {
        return;
      }
      state = state.copyWith(progress: stop);
      debugPrint("Processing... $stop");
    }
    debugPrint("Progressing done");

    await Future.delayed(const Duration(seconds: 1));
    if(!state.isDownloading) {
      return;
    }
    state = state.copyWith(isDownloading: false, downloadStatus: DownloadStatus.downloaded);
    debugPrint("Downloading done");
  }
}

final downloadStateProvider = StateNotifierProvider.family<DownloadStateNotifier, DownloadState, int>((ref, index) => DownloadStateNotifier(index: index));
