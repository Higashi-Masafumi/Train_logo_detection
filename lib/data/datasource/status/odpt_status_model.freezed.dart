// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odpt_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainInformationDto _$TrainInformationDtoFromJson(Map<String, dynamic> json) {
  return _TrainInformationDto.fromJson(json);
}

/// @nodoc
mixin _$TrainInformationDto {
  /// 例: "urn:uuid:6f1b7cf1-eaa5-4063-af68-7007dd6586e2"
  String get id => throw _privateConstructorUsedError;

  /// 例: "odpt:TrainInformation"
  String get type => throw _privateConstructorUsedError;

  /// 例: "2025-02-09T00:16:00+09:00"
  DateTime get date => throw _privateConstructorUsedError;

  /// 例: "http://vocab.odpt.org/context_odpt_TrainInformation.jsonld"
  String get context => throw _privateConstructorUsedError;

  /// 例: "2025-02-09T00:21:00+09:00"
  DateTime get valid => throw _privateConstructorUsedError;

  /// 例: "odpt.TrainInformation:TokyoMetro.Ginza"
  String get sameAs => throw _privateConstructorUsedError;

  /// 例: "odpt.Railway:TokyoMetro.Ginza"
  String get railway => throw _privateConstructorUsedError;

  /// 例: "odpt.Operator:TokyoMetro"
  String get operator => throw _privateConstructorUsedError;

  /// 例: "2025-01-20T10:50:00+09:00"
  DateTime get timeOfOrigin => throw _privateConstructorUsedError;

  /// 例: {"ja": "現在、平常どおり運転しています。"}
  Map<String, String> get trainInformationText =>
      throw _privateConstructorUsedError;

  /// Serializes this TrainInformationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainInformationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainInformationDtoCopyWith<TrainInformationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainInformationDtoCopyWith<$Res> {
  factory $TrainInformationDtoCopyWith(
          TrainInformationDto value, $Res Function(TrainInformationDto) then) =
      _$TrainInformationDtoCopyWithImpl<$Res, TrainInformationDto>;
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime date,
      String context,
      DateTime valid,
      String sameAs,
      String railway,
      String operator,
      DateTime timeOfOrigin,
      Map<String, String> trainInformationText});
}

/// @nodoc
class _$TrainInformationDtoCopyWithImpl<$Res, $Val extends TrainInformationDto>
    implements $TrainInformationDtoCopyWith<$Res> {
  _$TrainInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainInformationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? date = null,
    Object? context = null,
    Object? valid = null,
    Object? sameAs = null,
    Object? railway = null,
    Object? operator = null,
    Object? timeOfOrigin = null,
    Object? trainInformationText = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sameAs: null == sameAs
          ? _value.sameAs
          : sameAs // ignore: cast_nullable_to_non_nullable
              as String,
      railway: null == railway
          ? _value.railway
          : railway // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      timeOfOrigin: null == timeOfOrigin
          ? _value.timeOfOrigin
          : timeOfOrigin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trainInformationText: null == trainInformationText
          ? _value.trainInformationText
          : trainInformationText // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainInformationDtoImplCopyWith<$Res>
    implements $TrainInformationDtoCopyWith<$Res> {
  factory _$$TrainInformationDtoImplCopyWith(_$TrainInformationDtoImpl value,
          $Res Function(_$TrainInformationDtoImpl) then) =
      __$$TrainInformationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime date,
      String context,
      DateTime valid,
      String sameAs,
      String railway,
      String operator,
      DateTime timeOfOrigin,
      Map<String, String> trainInformationText});
}

/// @nodoc
class __$$TrainInformationDtoImplCopyWithImpl<$Res>
    extends _$TrainInformationDtoCopyWithImpl<$Res, _$TrainInformationDtoImpl>
    implements _$$TrainInformationDtoImplCopyWith<$Res> {
  __$$TrainInformationDtoImplCopyWithImpl(_$TrainInformationDtoImpl _value,
      $Res Function(_$TrainInformationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainInformationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? date = null,
    Object? context = null,
    Object? valid = null,
    Object? sameAs = null,
    Object? railway = null,
    Object? operator = null,
    Object? timeOfOrigin = null,
    Object? trainInformationText = null,
  }) {
    return _then(_$TrainInformationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sameAs: null == sameAs
          ? _value.sameAs
          : sameAs // ignore: cast_nullable_to_non_nullable
              as String,
      railway: null == railway
          ? _value.railway
          : railway // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      timeOfOrigin: null == timeOfOrigin
          ? _value.timeOfOrigin
          : timeOfOrigin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trainInformationText: null == trainInformationText
          ? _value._trainInformationText
          : trainInformationText // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainInformationDtoImpl implements _TrainInformationDto {
  _$TrainInformationDtoImpl(
      {required this.id,
      required this.type,
      required this.date,
      required this.context,
      required this.valid,
      required this.sameAs,
      required this.railway,
      required this.operator,
      required this.timeOfOrigin,
      required final Map<String, String> trainInformationText})
      : _trainInformationText = trainInformationText;

  factory _$TrainInformationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainInformationDtoImplFromJson(json);

  /// 例: "urn:uuid:6f1b7cf1-eaa5-4063-af68-7007dd6586e2"
  @override
  final String id;

  /// 例: "odpt:TrainInformation"
  @override
  final String type;

  /// 例: "2025-02-09T00:16:00+09:00"
  @override
  final DateTime date;

  /// 例: "http://vocab.odpt.org/context_odpt_TrainInformation.jsonld"
  @override
  final String context;

  /// 例: "2025-02-09T00:21:00+09:00"
  @override
  final DateTime valid;

  /// 例: "odpt.TrainInformation:TokyoMetro.Ginza"
  @override
  final String sameAs;

  /// 例: "odpt.Railway:TokyoMetro.Ginza"
  @override
  final String railway;

  /// 例: "odpt.Operator:TokyoMetro"
  @override
  final String operator;

  /// 例: "2025-01-20T10:50:00+09:00"
  @override
  final DateTime timeOfOrigin;

  /// 例: {"ja": "現在、平常どおり運転しています。"}
  final Map<String, String> _trainInformationText;

  /// 例: {"ja": "現在、平常どおり運転しています。"}
  @override
  Map<String, String> get trainInformationText {
    if (_trainInformationText is EqualUnmodifiableMapView)
      return _trainInformationText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trainInformationText);
  }

  @override
  String toString() {
    return 'TrainInformationDto(id: $id, type: $type, date: $date, context: $context, valid: $valid, sameAs: $sameAs, railway: $railway, operator: $operator, timeOfOrigin: $timeOfOrigin, trainInformationText: $trainInformationText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainInformationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.sameAs, sameAs) || other.sameAs == sameAs) &&
            (identical(other.railway, railway) || other.railway == railway) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.timeOfOrigin, timeOfOrigin) ||
                other.timeOfOrigin == timeOfOrigin) &&
            const DeepCollectionEquality()
                .equals(other._trainInformationText, _trainInformationText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      date,
      context,
      valid,
      sameAs,
      railway,
      operator,
      timeOfOrigin,
      const DeepCollectionEquality().hash(_trainInformationText));

  /// Create a copy of TrainInformationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainInformationDtoImplCopyWith<_$TrainInformationDtoImpl> get copyWith =>
      __$$TrainInformationDtoImplCopyWithImpl<_$TrainInformationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainInformationDtoImplToJson(
      this,
    );
  }
}

abstract class _TrainInformationDto implements TrainInformationDto {
  factory _TrainInformationDto(
          {required final String id,
          required final String type,
          required final DateTime date,
          required final String context,
          required final DateTime valid,
          required final String sameAs,
          required final String railway,
          required final String operator,
          required final DateTime timeOfOrigin,
          required final Map<String, String> trainInformationText}) =
      _$TrainInformationDtoImpl;

  factory _TrainInformationDto.fromJson(Map<String, dynamic> json) =
      _$TrainInformationDtoImpl.fromJson;

  /// 例: "urn:uuid:6f1b7cf1-eaa5-4063-af68-7007dd6586e2"
  @override
  String get id;

  /// 例: "odpt:TrainInformation"
  @override
  String get type;

  /// 例: "2025-02-09T00:16:00+09:00"
  @override
  DateTime get date;

  /// 例: "http://vocab.odpt.org/context_odpt_TrainInformation.jsonld"
  @override
  String get context;

  /// 例: "2025-02-09T00:21:00+09:00"
  @override
  DateTime get valid;

  /// 例: "odpt.TrainInformation:TokyoMetro.Ginza"
  @override
  String get sameAs;

  /// 例: "odpt.Railway:TokyoMetro.Ginza"
  @override
  String get railway;

  /// 例: "odpt.Operator:TokyoMetro"
  @override
  String get operator;

  /// 例: "2025-01-20T10:50:00+09:00"
  @override
  DateTime get timeOfOrigin;

  /// 例: {"ja": "現在、平常どおり運転しています。"}
  @override
  Map<String, String> get trainInformationText;

  /// Create a copy of TrainInformationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainInformationDtoImplCopyWith<_$TrainInformationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
