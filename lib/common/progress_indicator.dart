import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    Key? key,
    required this.progress,
    required this.isDownloading,
    required this.isFetching
  }) : super(key: key);

  final double progress;
  final bool isDownloading;
  final bool isFetching;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          tween: Tween(begin: 0, end: progress),
          builder: (context, progress, child) {
            return CircularProgressIndicator(
              backgroundColor: isDownloading ? Colors.black12 : null,
              valueColor: AlwaysStoppedAnimation(isFetching ? Colors.black12 : Colors.blueAccent),
              strokeWidth: 3,
              value: isFetching ? null : progress,
            );
          }
      ),
    );
  }
}

