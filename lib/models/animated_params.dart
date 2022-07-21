import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animated_params.freezed.dart';
part 'animated_params.g.dart';

@freezed
class AnimatedParams with _$AnimatedParams {
  const factory AnimatedParams({
    @Default(50) double width,
    @Default(50) double height,
    @Default([0,0,0]) List<int> colorInfo,
    @Default(8.0) double borderRadius,
  }) = _AnimatedParams;

  factory AnimatedParams.fromJson(Map<String, dynamic> json) =>
      _$AnimatedParamsFromJson(json);
}