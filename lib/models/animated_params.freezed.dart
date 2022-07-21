// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'animated_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimatedParams _$AnimatedParamsFromJson(Map<String, dynamic> json) {
  return _AnimatedParams.fromJson(json);
}

/// @nodoc
mixin _$AnimatedParams {
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  List<int> get colorInfo => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimatedParamsCopyWith<AnimatedParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimatedParamsCopyWith<$Res> {
  factory $AnimatedParamsCopyWith(
          AnimatedParams value, $Res Function(AnimatedParams) then) =
      _$AnimatedParamsCopyWithImpl<$Res>;
  $Res call(
      {double width, double height, List<int> colorInfo, double borderRadius});
}

/// @nodoc
class _$AnimatedParamsCopyWithImpl<$Res>
    implements $AnimatedParamsCopyWith<$Res> {
  _$AnimatedParamsCopyWithImpl(this._value, this._then);

  final AnimatedParams _value;
  // ignore: unused_field
  final $Res Function(AnimatedParams) _then;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? colorInfo = freezed,
    Object? borderRadius = freezed,
  }) {
    return _then(_value.copyWith(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      colorInfo: colorInfo == freezed
          ? _value.colorInfo
          : colorInfo // ignore: cast_nullable_to_non_nullable
              as List<int>,
      borderRadius: borderRadius == freezed
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_AnimatedParamsCopyWith<$Res>
    implements $AnimatedParamsCopyWith<$Res> {
  factory _$$_AnimatedParamsCopyWith(
          _$_AnimatedParams value, $Res Function(_$_AnimatedParams) then) =
      __$$_AnimatedParamsCopyWithImpl<$Res>;
  @override
  $Res call(
      {double width, double height, List<int> colorInfo, double borderRadius});
}

/// @nodoc
class __$$_AnimatedParamsCopyWithImpl<$Res>
    extends _$AnimatedParamsCopyWithImpl<$Res>
    implements _$$_AnimatedParamsCopyWith<$Res> {
  __$$_AnimatedParamsCopyWithImpl(
      _$_AnimatedParams _value, $Res Function(_$_AnimatedParams) _then)
      : super(_value, (v) => _then(v as _$_AnimatedParams));

  @override
  _$_AnimatedParams get _value => super._value as _$_AnimatedParams;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? colorInfo = freezed,
    Object? borderRadius = freezed,
  }) {
    return _then(_$_AnimatedParams(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      colorInfo: colorInfo == freezed
          ? _value._colorInfo
          : colorInfo // ignore: cast_nullable_to_non_nullable
              as List<int>,
      borderRadius: borderRadius == freezed
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnimatedParams
    with DiagnosticableTreeMixin
    implements _AnimatedParams {
  const _$_AnimatedParams(
      {this.width = 50,
      this.height = 50,
      final List<int> colorInfo = const [0, 0, 0],
      this.borderRadius = 8.0})
      : _colorInfo = colorInfo;

  factory _$_AnimatedParams.fromJson(Map<String, dynamic> json) =>
      _$$_AnimatedParamsFromJson(json);

  @override
  @JsonKey()
  final double width;
  @override
  @JsonKey()
  final double height;
  final List<int> _colorInfo;
  @override
  @JsonKey()
  List<int> get colorInfo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorInfo);
  }

  @override
  @JsonKey()
  final double borderRadius;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnimatedParams(width: $width, height: $height, colorInfo: $colorInfo, borderRadius: $borderRadius)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnimatedParams'))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('colorInfo', colorInfo))
      ..add(DiagnosticsProperty('borderRadius', borderRadius));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimatedParams &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other._colorInfo, _colorInfo) &&
            const DeepCollectionEquality()
                .equals(other.borderRadius, borderRadius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(_colorInfo),
      const DeepCollectionEquality().hash(borderRadius));

  @JsonKey(ignore: true)
  @override
  _$$_AnimatedParamsCopyWith<_$_AnimatedParams> get copyWith =>
      __$$_AnimatedParamsCopyWithImpl<_$_AnimatedParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimatedParamsToJson(
      this,
    );
  }
}

abstract class _AnimatedParams implements AnimatedParams {
  const factory _AnimatedParams(
      {final double width,
      final double height,
      final List<int> colorInfo,
      final double borderRadius}) = _$_AnimatedParams;

  factory _AnimatedParams.fromJson(Map<String, dynamic> json) =
      _$_AnimatedParams.fromJson;

  @override
  double get width;
  @override
  double get height;
  @override
  List<int> get colorInfo;
  @override
  double get borderRadius;
  @override
  @JsonKey(ignore: true)
  _$$_AnimatedParamsCopyWith<_$_AnimatedParams> get copyWith =>
      throw _privateConstructorUsedError;
}
