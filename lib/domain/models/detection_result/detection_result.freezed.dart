// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetectionResult {
  String get label => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  Rect get boundingBox => throw _privateConstructorUsedError;

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionResultCopyWith<DetectionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionResultCopyWith<$Res> {
  factory $DetectionResultCopyWith(
          DetectionResult value, $Res Function(DetectionResult) then) =
      _$DetectionResultCopyWithImpl<$Res, DetectionResult>;
  @useResult
  $Res call({String label, double confidence, Rect boundingBox});
}

/// @nodoc
class _$DetectionResultCopyWithImpl<$Res, $Val extends DetectionResult>
    implements $DetectionResultCopyWith<$Res> {
  _$DetectionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? confidence = null,
    Object? boundingBox = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as Rect,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectionResultImplCopyWith<$Res>
    implements $DetectionResultCopyWith<$Res> {
  factory _$$DetectionResultImplCopyWith(_$DetectionResultImpl value,
          $Res Function(_$DetectionResultImpl) then) =
      __$$DetectionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double confidence, Rect boundingBox});
}

/// @nodoc
class __$$DetectionResultImplCopyWithImpl<$Res>
    extends _$DetectionResultCopyWithImpl<$Res, _$DetectionResultImpl>
    implements _$$DetectionResultImplCopyWith<$Res> {
  __$$DetectionResultImplCopyWithImpl(
      _$DetectionResultImpl _value, $Res Function(_$DetectionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? confidence = null,
    Object? boundingBox = null,
  }) {
    return _then(_$DetectionResultImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$DetectionResultImpl implements _DetectionResult {
  const _$DetectionResultImpl(
      {required this.label,
      required this.confidence,
      required this.boundingBox});

  @override
  final String label;
  @override
  final double confidence;
  @override
  final Rect boundingBox;

  @override
  String toString() {
    return 'DetectionResult(label: $label, confidence: $confidence, boundingBox: $boundingBox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionResultImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.boundingBox, boundingBox) ||
                other.boundingBox == boundingBox));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, confidence, boundingBox);

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionResultImplCopyWith<_$DetectionResultImpl> get copyWith =>
      __$$DetectionResultImplCopyWithImpl<_$DetectionResultImpl>(
          this, _$identity);
}

abstract class _DetectionResult implements DetectionResult {
  const factory _DetectionResult(
      {required final String label,
      required final double confidence,
      required final Rect boundingBox}) = _$DetectionResultImpl;

  @override
  String get label;
  @override
  double get confidence;
  @override
  Rect get boundingBox;

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionResultImplCopyWith<_$DetectionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetectionResultWithImage {
  DetectionResult get detectionResult => throw _privateConstructorUsedError;
  Uint8List get croppedimage => throw _privateConstructorUsedError;

  /// Create a copy of DetectionResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionResultWithImageCopyWith<DetectionResultWithImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionResultWithImageCopyWith<$Res> {
  factory $DetectionResultWithImageCopyWith(DetectionResultWithImage value,
          $Res Function(DetectionResultWithImage) then) =
      _$DetectionResultWithImageCopyWithImpl<$Res, DetectionResultWithImage>;
  @useResult
  $Res call({DetectionResult detectionResult, Uint8List croppedimage});

  $DetectionResultCopyWith<$Res> get detectionResult;
}

/// @nodoc
class _$DetectionResultWithImageCopyWithImpl<$Res,
        $Val extends DetectionResultWithImage>
    implements $DetectionResultWithImageCopyWith<$Res> {
  _$DetectionResultWithImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectionResult = null,
    Object? croppedimage = null,
  }) {
    return _then(_value.copyWith(
      detectionResult: null == detectionResult
          ? _value.detectionResult
          : detectionResult // ignore: cast_nullable_to_non_nullable
              as DetectionResult,
      croppedimage: null == croppedimage
          ? _value.croppedimage
          : croppedimage // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }

  /// Create a copy of DetectionResultWithImage
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
abstract class _$$DetectionResultWithImageImplCopyWith<$Res>
    implements $DetectionResultWithImageCopyWith<$Res> {
  factory _$$DetectionResultWithImageImplCopyWith(
          _$DetectionResultWithImageImpl value,
          $Res Function(_$DetectionResultWithImageImpl) then) =
      __$$DetectionResultWithImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetectionResult detectionResult, Uint8List croppedimage});

  @override
  $DetectionResultCopyWith<$Res> get detectionResult;
}

/// @nodoc
class __$$DetectionResultWithImageImplCopyWithImpl<$Res>
    extends _$DetectionResultWithImageCopyWithImpl<$Res,
        _$DetectionResultWithImageImpl>
    implements _$$DetectionResultWithImageImplCopyWith<$Res> {
  __$$DetectionResultWithImageImplCopyWithImpl(
      _$DetectionResultWithImageImpl _value,
      $Res Function(_$DetectionResultWithImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectionResult = null,
    Object? croppedimage = null,
  }) {
    return _then(_$DetectionResultWithImageImpl(
      detectionResult: null == detectionResult
          ? _value.detectionResult
          : detectionResult // ignore: cast_nullable_to_non_nullable
              as DetectionResult,
      croppedimage: null == croppedimage
          ? _value.croppedimage
          : croppedimage // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$DetectionResultWithImageImpl implements _DetectionResultWithImage {
  const _$DetectionResultWithImageImpl(
      {required this.detectionResult, required this.croppedimage});

  @override
  final DetectionResult detectionResult;
  @override
  final Uint8List croppedimage;

  @override
  String toString() {
    return 'DetectionResultWithImage(detectionResult: $detectionResult, croppedimage: $croppedimage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionResultWithImageImpl &&
            (identical(other.detectionResult, detectionResult) ||
                other.detectionResult == detectionResult) &&
            const DeepCollectionEquality()
                .equals(other.croppedimage, croppedimage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detectionResult,
      const DeepCollectionEquality().hash(croppedimage));

  /// Create a copy of DetectionResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionResultWithImageImplCopyWith<_$DetectionResultWithImageImpl>
      get copyWith => __$$DetectionResultWithImageImplCopyWithImpl<
          _$DetectionResultWithImageImpl>(this, _$identity);
}

abstract class _DetectionResultWithImage implements DetectionResultWithImage {
  const factory _DetectionResultWithImage(
      {required final DetectionResult detectionResult,
      required final Uint8List croppedimage}) = _$DetectionResultWithImageImpl;

  @override
  DetectionResult get detectionResult;
  @override
  Uint8List get croppedimage;

  /// Create a copy of DetectionResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionResultWithImageImplCopyWith<_$DetectionResultWithImageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetectionResultWithText {
  DetectionResultWithImage get detectionResultWithImage =>
      throw _privateConstructorUsedError;
  String get detectedText => throw _privateConstructorUsedError;

  /// Create a copy of DetectionResultWithText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionResultWithTextCopyWith<DetectionResultWithText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionResultWithTextCopyWith<$Res> {
  factory $DetectionResultWithTextCopyWith(DetectionResultWithText value,
          $Res Function(DetectionResultWithText) then) =
      _$DetectionResultWithTextCopyWithImpl<$Res, DetectionResultWithText>;
  @useResult
  $Res call(
      {DetectionResultWithImage detectionResultWithImage, String detectedText});

  $DetectionResultWithImageCopyWith<$Res> get detectionResultWithImage;
}

/// @nodoc
class _$DetectionResultWithTextCopyWithImpl<$Res,
        $Val extends DetectionResultWithText>
    implements $DetectionResultWithTextCopyWith<$Res> {
  _$DetectionResultWithTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionResultWithText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectionResultWithImage = null,
    Object? detectedText = null,
  }) {
    return _then(_value.copyWith(
      detectionResultWithImage: null == detectionResultWithImage
          ? _value.detectionResultWithImage
          : detectionResultWithImage // ignore: cast_nullable_to_non_nullable
              as DetectionResultWithImage,
      detectedText: null == detectedText
          ? _value.detectedText
          : detectedText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of DetectionResultWithText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetectionResultWithImageCopyWith<$Res> get detectionResultWithImage {
    return $DetectionResultWithImageCopyWith<$Res>(
        _value.detectionResultWithImage, (value) {
      return _then(_value.copyWith(detectionResultWithImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetectionResultWithTextImplCopyWith<$Res>
    implements $DetectionResultWithTextCopyWith<$Res> {
  factory _$$DetectionResultWithTextImplCopyWith(
          _$DetectionResultWithTextImpl value,
          $Res Function(_$DetectionResultWithTextImpl) then) =
      __$$DetectionResultWithTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetectionResultWithImage detectionResultWithImage, String detectedText});

  @override
  $DetectionResultWithImageCopyWith<$Res> get detectionResultWithImage;
}

/// @nodoc
class __$$DetectionResultWithTextImplCopyWithImpl<$Res>
    extends _$DetectionResultWithTextCopyWithImpl<$Res,
        _$DetectionResultWithTextImpl>
    implements _$$DetectionResultWithTextImplCopyWith<$Res> {
  __$$DetectionResultWithTextImplCopyWithImpl(
      _$DetectionResultWithTextImpl _value,
      $Res Function(_$DetectionResultWithTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionResultWithText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectionResultWithImage = null,
    Object? detectedText = null,
  }) {
    return _then(_$DetectionResultWithTextImpl(
      detectionResultWithImage: null == detectionResultWithImage
          ? _value.detectionResultWithImage
          : detectionResultWithImage // ignore: cast_nullable_to_non_nullable
              as DetectionResultWithImage,
      detectedText: null == detectedText
          ? _value.detectedText
          : detectedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetectionResultWithTextImpl implements _DetectionResultWithText {
  const _$DetectionResultWithTextImpl(
      {required this.detectionResultWithImage, required this.detectedText});

  @override
  final DetectionResultWithImage detectionResultWithImage;
  @override
  final String detectedText;

  @override
  String toString() {
    return 'DetectionResultWithText(detectionResultWithImage: $detectionResultWithImage, detectedText: $detectedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionResultWithTextImpl &&
            (identical(
                    other.detectionResultWithImage, detectionResultWithImage) ||
                other.detectionResultWithImage == detectionResultWithImage) &&
            (identical(other.detectedText, detectedText) ||
                other.detectedText == detectedText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, detectionResultWithImage, detectedText);

  /// Create a copy of DetectionResultWithText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionResultWithTextImplCopyWith<_$DetectionResultWithTextImpl>
      get copyWith => __$$DetectionResultWithTextImplCopyWithImpl<
          _$DetectionResultWithTextImpl>(this, _$identity);
}

abstract class _DetectionResultWithText implements DetectionResultWithText {
  const factory _DetectionResultWithText(
      {required final DetectionResultWithImage detectionResultWithImage,
      required final String detectedText}) = _$DetectionResultWithTextImpl;

  @override
  DetectionResultWithImage get detectionResultWithImage;
  @override
  String get detectedText;

  /// Create a copy of DetectionResultWithText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionResultWithTextImplCopyWith<_$DetectionResultWithTextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
