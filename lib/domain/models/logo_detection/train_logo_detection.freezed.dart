// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_logo_detection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrainLogoDetectionResult {
  DetectionResult get detectionResult => throw _privateConstructorUsedError;
  Uint8List? get croppedimage => throw _privateConstructorUsedError;
  TrainLineLabel? get detectedLine => throw _privateConstructorUsedError;

  /// Create a copy of TrainLogoDetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainLogoDetectionResultCopyWith<TrainLogoDetectionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainLogoDetectionResultCopyWith<$Res> {
  factory $TrainLogoDetectionResultCopyWith(TrainLogoDetectionResult value,
          $Res Function(TrainLogoDetectionResult) then) =
      _$TrainLogoDetectionResultCopyWithImpl<$Res, TrainLogoDetectionResult>;
  @useResult
  $Res call(
      {DetectionResult detectionResult,
      Uint8List? croppedimage,
      TrainLineLabel? detectedLine});

  $DetectionResultCopyWith<$Res> get detectionResult;
}

/// @nodoc
class _$TrainLogoDetectionResultCopyWithImpl<$Res,
        $Val extends TrainLogoDetectionResult>
    implements $TrainLogoDetectionResultCopyWith<$Res> {
  _$TrainLogoDetectionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainLogoDetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectionResult = null,
    Object? croppedimage = freezed,
    Object? detectedLine = freezed,
  }) {
    return _then(_value.copyWith(
      detectionResult: null == detectionResult
          ? _value.detectionResult
          : detectionResult // ignore: cast_nullable_to_non_nullable
              as DetectionResult,
      croppedimage: freezed == croppedimage
          ? _value.croppedimage
          : croppedimage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      detectedLine: freezed == detectedLine
          ? _value.detectedLine
          : detectedLine // ignore: cast_nullable_to_non_nullable
              as TrainLineLabel?,
    ) as $Val);
  }

  /// Create a copy of TrainLogoDetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetectionResultCopyWith<$Res> get detectionResult {
    return $DetectionResultCopyWith<$Res>(_value.detectionResult, (value) {
      return _then(_value.copyWith(detectionResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainLogoDetectionResultImplCopyWith<$Res>
    implements $TrainLogoDetectionResultCopyWith<$Res> {
  factory _$$TrainLogoDetectionResultImplCopyWith(
          _$TrainLogoDetectionResultImpl value,
          $Res Function(_$TrainLogoDetectionResultImpl) then) =
      __$$TrainLogoDetectionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetectionResult detectionResult,
      Uint8List? croppedimage,
      TrainLineLabel? detectedLine});

  @override
  $DetectionResultCopyWith<$Res> get detectionResult;
}

/// @nodoc
class __$$TrainLogoDetectionResultImplCopyWithImpl<$Res>
    extends _$TrainLogoDetectionResultCopyWithImpl<$Res,
        _$TrainLogoDetectionResultImpl>
    implements _$$TrainLogoDetectionResultImplCopyWith<$Res> {
  __$$TrainLogoDetectionResultImplCopyWithImpl(
      _$TrainLogoDetectionResultImpl _value,
      $Res Function(_$TrainLogoDetectionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainLogoDetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectionResult = null,
    Object? croppedimage = freezed,
    Object? detectedLine = freezed,
  }) {
    return _then(_$TrainLogoDetectionResultImpl(
      detectionResult: null == detectionResult
          ? _value.detectionResult
          : detectionResult // ignore: cast_nullable_to_non_nullable
              as DetectionResult,
      croppedimage: freezed == croppedimage
          ? _value.croppedimage
          : croppedimage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      detectedLine: freezed == detectedLine
          ? _value.detectedLine
          : detectedLine // ignore: cast_nullable_to_non_nullable
              as TrainLineLabel?,
    ));
  }
}

/// @nodoc

class _$TrainLogoDetectionResultImpl implements _TrainLogoDetectionResult {
  const _$TrainLogoDetectionResultImpl(
      {required this.detectionResult, this.croppedimage, this.detectedLine});

  @override
  final DetectionResult detectionResult;
  @override
  final Uint8List? croppedimage;
  @override
  final TrainLineLabel? detectedLine;

  @override
  String toString() {
    return 'TrainLogoDetectionResult(detectionResult: $detectionResult, croppedimage: $croppedimage, detectedLine: $detectedLine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainLogoDetectionResultImpl &&
            (identical(other.detectionResult, detectionResult) ||
                other.detectionResult == detectionResult) &&
            const DeepCollectionEquality()
                .equals(other.croppedimage, croppedimage) &&
            (identical(other.detectedLine, detectedLine) ||
                other.detectedLine == detectedLine));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detectionResult,
      const DeepCollectionEquality().hash(croppedimage), detectedLine);

  /// Create a copy of TrainLogoDetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainLogoDetectionResultImplCopyWith<_$TrainLogoDetectionResultImpl>
      get copyWith => __$$TrainLogoDetectionResultImplCopyWithImpl<
          _$TrainLogoDetectionResultImpl>(this, _$identity);
}

abstract class _TrainLogoDetectionResult implements TrainLogoDetectionResult {
  const factory _TrainLogoDetectionResult(
      {required final DetectionResult detectionResult,
      final Uint8List? croppedimage,
      final TrainLineLabel? detectedLine}) = _$TrainLogoDetectionResultImpl;

  @override
  DetectionResult get detectionResult;
  @override
  Uint8List? get croppedimage;
  @override
  TrainLineLabel? get detectedLine;

  /// Create a copy of TrainLogoDetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainLogoDetectionResultImplCopyWith<_$TrainLogoDetectionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
