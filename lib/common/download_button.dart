import 'package:flutter/material.dart';
import 'package:practice_flutter_ui/common/button_shape.dart';
import 'package:practice_flutter_ui/common/progress_indicator.dart';
import 'package:practice_flutter_ui/models/download_status.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
    required this.status,
    required this.progress,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transition = const Duration(milliseconds: 500),
  }) : super(key: key);

  final DownloadStatus status;
  final double progress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transition;

  bool get _isDownloading => status == DownloadStatus.downloading;
  bool get _isFetching => status == DownloadStatus.fetching;
  bool get _isDownloaded => status == DownloadStatus.downloaded;
  bool get _shouldInvisible => _isFetching || _isDownloading;

  void _onPress(){
    switch(status){
      case DownloadStatus.standby:
        debugPrint("download now");
        onDownload();
        break;
      case DownloadStatus.fetching:
        debugPrint("fetching now");
        break;
      case DownloadStatus.downloading:
        debugPrint("cancel now");
        onCancel();
        break;
      case DownloadStatus.downloaded:
        debugPrint("open now");
        onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPress,
      child: Stack(children: [
        ButtonShapeWidget(
          transition: transition,
          isFetching: _isFetching,
          isDownloading: _isDownloading,
          isDownloaded: _isDownloaded,
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            duration: transition,
            opacity: _shouldInvisible ? 1.0 : 0.0,
            curve: Curves.ease,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ProgressIndicatorWidget(
                    progress: progress,
                    isDownloading: _isDownloading,
                    isFetching: _isFetching
                ),
                const Icon(
                  Icons.stop,
                  size: 20,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}