import 'package:flutter/material.dart';

class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget({
    Key? key,
    required this.transition,
    required this.isFetching,
    required this.isDownloading,
    required this.isDownloaded,
  }) : super(key: key);
  final Duration transition;
  final bool isFetching;
  final bool isDownloading;
  final bool isDownloaded;

  bool get _transformProcess => isDownloading || isFetching;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final buttonTextStyle = textTheme.button?.copyWith(
      fontWeight: FontWeight.bold,
      color: isDownloaded ? Colors.white70 : Colors.blueAccent,
    );

    final stadiumShape = ShapeDecoration(
      color: isDownloaded ? Colors.blueAccent : Colors.black12,
      shape: const StadiumBorder(),
    );
    const circleShape = ShapeDecoration(
      color: null,
      shape: CircleBorder(),
    );


    return AnimatedContainer(
        duration: transition,
        curve: Curves.ease,
        width: double.infinity,
        decoration: _transformProcess ? circleShape : stadiumShape,
        padding: const EdgeInsets.all(6.0),
        child: AnimatedOpacity(
          opacity: _transformProcess ? 0.0 : 1.0 ,
          duration: transition,
          curve: Curves.ease,
          child: Text(
            isDownloaded ? "OPEN" : "GET",
            textAlign: TextAlign.center,
            style: buttonTextStyle,),
        ),
    );
  }
}
