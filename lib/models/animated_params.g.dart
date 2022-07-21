// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animated_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimatedParams _$$_AnimatedParamsFromJson(Map<String, dynamic> json) =>
    _$_AnimatedParams(
      width: (json['width'] as num?)?.toDouble() ?? 50,
      height: (json['height'] as num?)?.toDouble() ?? 50,
      colorInfo: (json['colorInfo'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [0, 0, 0],
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 8.0,
    );

Map<String, dynamic> _$$_AnimatedParamsToJson(_$_AnimatedParams instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'colorInfo': instance.colorInfo,
      'borderRadius': instance.borderRadius,
    };
