import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/models/animated_params.dart';

class AnimatedParamsNotifier extends StateNotifier<AnimatedParams>{
  AnimatedParamsNotifier() : super(const AnimatedParams());

  void randomChange() {
    final random = Random();

    state = state.copyWith(
      width: random.nextInt(300).toDouble(),
      height: random.nextInt(300).toDouble(),
      colorInfo: List.generate(3, (index) => random.nextInt(255)),
      borderRadius: random.nextInt(100).toDouble(),
    );
  }
  Color getColor(){
    final colorInfo = state.colorInfo;
    return Color.fromRGBO(colorInfo[0], colorInfo[1], colorInfo[2], 1);
  }
}