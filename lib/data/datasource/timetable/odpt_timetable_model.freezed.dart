// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odpt_timetable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StationTimetableDto _$StationTimetableDtoFromJson(Map<String, dynamic> json) {
  return _StationTimetableDto.fromJson(json);
}

/// @nodoc
mixin _$StationTimetableDto {
  /// 例: "urn:ucode:_00001C00000000000001000003100E90"
  String get id => throw _privateConstructorUsedError;

  /// 例: "odpt:StationTimetable"
  String get type => throw _privateConstructorUsedError;

  /// 例: "2025-01-06T13:00:00+09:00"
  DateTime get date => throw _privateConstructorUsedError;

  /// 例: "http://vocab.odpt.org/context_odpt_StationTimetable.jsonld"
  String get context => throw _privateConstructorUsedError;

  /// 例: "2024-03-16"
  String get issued => throw _privateConstructorUsedError;

  /// 例: "odpt.StationTimetable:TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday"
  String get sameAs => throw _privateConstructorUsedError;

  /// 例: "odpt.Railway:TokyoMetro.Chiyoda"
  String get railway => throw _privateConstructorUsedError;

  /// 例: "odpt.Station:TokyoMetro.Chiyoda.Akasaka"
  String get station => throw _privateConstructorUsedError;

  /// 例: "odpt.Calendar:SaturdayHoliday" (平日 or 土休日など)
  String get calendar => throw _privateConstructorUsedError;

  /// 例: "odpt.Operator:TokyoMetro"
  String get operatorId => throw _privateConstructorUsedError;

  /// 例: "odpt.RailDirection:TokyoMetro.KitaAyase"
  String get railDirection => throw _privateConstructorUsedError;

  /// 個々の列車情報一覧
  List<StationTimetableObjectDto> get stationTimetableObjects =>
      throw _privateConstructorUsedError;

  /// Serializes this StationTimetableDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationTimetableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationTimetableDtoCopyWith<StationTimetableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationTimetableDtoCopyWith<$Res> {
  factory $StationTimetableDtoCopyWith(
          StationTimetableDto value, $Res Function(StationTimetableDto) then) =
      _$StationTimetableDtoCopyWithImpl<$Res, StationTimetableDto>;
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime date,
      String context,
      String issued,
      String sameAs,
      String railway,
      String station,
      String calendar,
      String operatorId,
      String railDirection,
      List<StationTimetableObjectDto> stationTimetableObjects});
}

/// @nodoc
class _$StationTimetableDtoCopyWithImpl<$Res, $Val extends StationTimetableDto>
    implements $StationTimetableDtoCopyWith<$Res> {
  _$StationTimetableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationTimetableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? date = null,
    Object? context = null,
    Object? issued = null,
    Object? sameAs = null,
    Object? railway = null,
    Object? station = null,
    Object? calendar = null,
    Object? operatorId = null,
    Object? railDirection = null,
    Object? stationTimetableObjects = null,
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
      issued: null == issued
          ? _value.issued
          : issued // ignore: cast_nullable_to_non_nullable
              as String,
      sameAs: null == sameAs
          ? _value.sameAs
          : sameAs // ignore: cast_nullable_to_non_nullable
              as String,
      railway: null == railway
          ? _value.railway
          : railway // ignore: cast_nullable_to_non_nullable
              as String,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as String,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      railDirection: null == railDirection
          ? _value.railDirection
          : railDirection // ignore: cast_nullable_to_non_nullable
              as String,
      stationTimetableObjects: null == stationTimetableObjects
          ? _value.stationTimetableObjects
          : stationTimetableObjects // ignore: cast_nullable_to_non_nullable
              as List<StationTimetableObjectDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationTimetableDtoImplCopyWith<$Res>
    implements $StationTimetableDtoCopyWith<$Res> {
  factory _$$StationTimetableDtoImplCopyWith(_$StationTimetableDtoImpl value,
          $Res Function(_$StationTimetableDtoImpl) then) =
      __$$StationTimetableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime date,
      String context,
      String issued,
      String sameAs,
      String railway,
      String station,
      String calendar,
      String operatorId,
      String railDirection,
      List<StationTimetableObjectDto> stationTimetableObjects});
}

/// @nodoc
class __$$StationTimetableDtoImplCopyWithImpl<$Res>
    extends _$StationTimetableDtoCopyWithImpl<$Res, _$StationTimetableDtoImpl>
    implements _$$StationTimetableDtoImplCopyWith<$Res> {
  __$$StationTimetableDtoImplCopyWithImpl(_$StationTimetableDtoImpl _value,
      $Res Function(_$StationTimetableDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationTimetableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? date = null,
    Object? context = null,
    Object? issued = null,
    Object? sameAs = null,
    Object? railway = null,
    Object? station = null,
    Object? calendar = null,
    Object? operatorId = null,
    Object? railDirection = null,
    Object? stationTimetableObjects = null,
  }) {
    return _then(_$StationTimetableDtoImpl(
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
      issued: null == issued
          ? _value.issued
          : issued // ignore: cast_nullable_to_non_nullable
              as String,
      sameAs: null == sameAs
          ? _value.sameAs
          : sameAs // ignore: cast_nullable_to_non_nullable
              as String,
      railway: null == railway
          ? _value.railway
          : railway // ignore: cast_nullable_to_non_nullable
              as String,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as String,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      railDirection: null == railDirection
          ? _value.railDirection
          : railDirection // ignore: cast_nullable_to_non_nullable
              as String,
      stationTimetableObjects: null == stationTimetableObjects
          ? _value._stationTimetableObjects
          : stationTimetableObjects // ignore: cast_nullable_to_non_nullable
              as List<StationTimetableObjectDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationTimetableDtoImpl implements _StationTimetableDto {
  _$StationTimetableDtoImpl(
      {required this.id,
      required this.type,
      required this.date,
      required this.context,
      required this.issued,
      required this.sameAs,
      required this.railway,
      required this.station,
      required this.calendar,
      required this.operatorId,
      required this.railDirection,
      required final List<StationTimetableObjectDto> stationTimetableObjects})
      : _stationTimetableObjects = stationTimetableObjects;

  factory _$StationTimetableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationTimetableDtoImplFromJson(json);

  /// 例: "urn:ucode:_00001C00000000000001000003100E90"
  @override
  final String id;

  /// 例: "odpt:StationTimetable"
  @override
  final String type;

  /// 例: "2025-01-06T13:00:00+09:00"
  @override
  final DateTime date;

  /// 例: "http://vocab.odpt.org/context_odpt_StationTimetable.jsonld"
  @override
  final String context;

  /// 例: "2024-03-16"
  @override
  final String issued;

  /// 例: "odpt.StationTimetable:TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday"
  @override
  final String sameAs;

  /// 例: "odpt.Railway:TokyoMetro.Chiyoda"
  @override
  final String railway;

  /// 例: "odpt.Station:TokyoMetro.Chiyoda.Akasaka"
  @override
  final String station;

  /// 例: "odpt.Calendar:SaturdayHoliday" (平日 or 土休日など)
  @override
  final String calendar;

  /// 例: "odpt.Operator:TokyoMetro"
  @override
  final String operatorId;

  /// 例: "odpt.RailDirection:TokyoMetro.KitaAyase"
  @override
  final String railDirection;

  /// 個々の列車情報一覧
  final List<StationTimetableObjectDto> _stationTimetableObjects;

  /// 個々の列車情報一覧
  @override
  List<StationTimetableObjectDto> get stationTimetableObjects {
    if (_stationTimetableObjects is EqualUnmodifiableListView)
      return _stationTimetableObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stationTimetableObjects);
  }

  @override
  String toString() {
    return 'StationTimetableDto(id: $id, type: $type, date: $date, context: $context, issued: $issued, sameAs: $sameAs, railway: $railway, station: $station, calendar: $calendar, operatorId: $operatorId, railDirection: $railDirection, stationTimetableObjects: $stationTimetableObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationTimetableDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.issued, issued) || other.issued == issued) &&
            (identical(other.sameAs, sameAs) || other.sameAs == sameAs) &&
            (identical(other.railway, railway) || other.railway == railway) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.calendar, calendar) ||
                other.calendar == calendar) &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId) &&
            (identical(other.railDirection, railDirection) ||
                other.railDirection == railDirection) &&
            const DeepCollectionEquality().equals(
                other._stationTimetableObjects, _stationTimetableObjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      date,
      context,
      issued,
      sameAs,
      railway,
      station,
      calendar,
      operatorId,
      railDirection,
      const DeepCollectionEquality().hash(_stationTimetableObjects));

  /// Create a copy of StationTimetableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationTimetableDtoImplCopyWith<_$StationTimetableDtoImpl> get copyWith =>
      __$$StationTimetableDtoImplCopyWithImpl<_$StationTimetableDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationTimetableDtoImplToJson(
      this,
    );
  }
}

abstract class _StationTimetableDto implements StationTimetableDto {
  factory _StationTimetableDto(
      {required final String id,
      required final String type,
      required final DateTime date,
      required final String context,
      required final String issued,
      required final String sameAs,
      required final String railway,
      required final String station,
      required final String calendar,
      required final String operatorId,
      required final String railDirection,
      required final List<StationTimetableObjectDto>
          stationTimetableObjects}) = _$StationTimetableDtoImpl;

  factory _StationTimetableDto.fromJson(Map<String, dynamic> json) =
      _$StationTimetableDtoImpl.fromJson;

  /// 例: "urn:ucode:_00001C00000000000001000003100E90"
  @override
  String get id;

  /// 例: "odpt:StationTimetable"
  @override
  String get type;

  /// 例: "2025-01-06T13:00:00+09:00"
  @override
  DateTime get date;

  /// 例: "http://vocab.odpt.org/context_odpt_StationTimetable.jsonld"
  @override
  String get context;

  /// 例: "2024-03-16"
  @override
  String get issued;

  /// 例: "odpt.StationTimetable:TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday"
  @override
  String get sameAs;

  /// 例: "odpt.Railway:TokyoMetro.Chiyoda"
  @override
  String get railway;

  /// 例: "odpt.Station:TokyoMetro.Chiyoda.Akasaka"
  @override
  String get station;

  /// 例: "odpt.Calendar:SaturdayHoliday" (平日 or 土休日など)
  @override
  String get calendar;

  /// 例: "odpt.Operator:TokyoMetro"
  @override
  String get operatorId;

  /// 例: "odpt.RailDirection:TokyoMetro.KitaAyase"
  @override
  String get railDirection;

  /// 個々の列車情報一覧
  @override
  List<StationTimetableObjectDto> get stationTimetableObjects;

  /// Create a copy of StationTimetableDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationTimetableDtoImplCopyWith<_$StationTimetableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StationTimetableObjectDto _$StationTimetableObjectDtoFromJson(
    Map<String, dynamic> json) {
  return _StationTimetableObjectDto.fromJson(json);
}

/// @nodoc
mixin _$StationTimetableObjectDto {
  /// 例: "odpt.Train:TokyoMetro.Chiyoda.B529S"
  String get train => throw _privateConstructorUsedError;

  /// 例: "odpt.TrainType:TokyoMetro.Local"
  String get trainType => throw _privateConstructorUsedError;

  /// 例: "B529S"
  String get trainNumber => throw _privateConstructorUsedError;

  /// 例: "05:10" (発車時刻)
  String get departureTime => throw _privateConstructorUsedError;

  /// 例: ["odpt.Station:JR-East.JobanLocal.Abiko"]
  List<String> get destinationStation => throw _privateConstructorUsedError;

  /// 例: 土休日など終電近くで "odpt:isLast": true が入る場合
  bool? get isLast => throw _privateConstructorUsedError;

  /// 例: `"TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday": true`
  /// のような追加キーにも対応したい場合は、下記のようにフィールドを追加で定義可能。
  /// フィールド名が複雑なので、注意が必要。
  /// 今回は例として optional に示します（必須でなければ省略可能）。
  bool? get isSaturdayHoliday => throw _privateConstructorUsedError;

  /// Serializes this StationTimetableObjectDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationTimetableObjectDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationTimetableObjectDtoCopyWith<StationTimetableObjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationTimetableObjectDtoCopyWith<$Res> {
  factory $StationTimetableObjectDtoCopyWith(StationTimetableObjectDto value,
          $Res Function(StationTimetableObjectDto) then) =
      _$StationTimetableObjectDtoCopyWithImpl<$Res, StationTimetableObjectDto>;
  @useResult
  $Res call(
      {String train,
      String trainType,
      String trainNumber,
      String departureTime,
      List<String> destinationStation,
      bool? isLast,
      bool? isSaturdayHoliday});
}

/// @nodoc
class _$StationTimetableObjectDtoCopyWithImpl<$Res,
        $Val extends StationTimetableObjectDto>
    implements $StationTimetableObjectDtoCopyWith<$Res> {
  _$StationTimetableObjectDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationTimetableObjectDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? train = null,
    Object? trainType = null,
    Object? trainNumber = null,
    Object? departureTime = null,
    Object? destinationStation = null,
    Object? isLast = freezed,
    Object? isSaturdayHoliday = freezed,
  }) {
    return _then(_value.copyWith(
      train: null == train
          ? _value.train
          : train // ignore: cast_nullable_to_non_nullable
              as String,
      trainType: null == trainType
          ? _value.trainType
          : trainType // ignore: cast_nullable_to_non_nullable
              as String,
      trainNumber: null == trainNumber
          ? _value.trainNumber
          : trainNumber // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      destinationStation: null == destinationStation
          ? _value.destinationStation
          : destinationStation // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLast: freezed == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaturdayHoliday: freezed == isSaturdayHoliday
          ? _value.isSaturdayHoliday
          : isSaturdayHoliday // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationTimetableObjectDtoImplCopyWith<$Res>
    implements $StationTimetableObjectDtoCopyWith<$Res> {
  factory _$$StationTimetableObjectDtoImplCopyWith(
          _$StationTimetableObjectDtoImpl value,
          $Res Function(_$StationTimetableObjectDtoImpl) then) =
      __$$StationTimetableObjectDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String train,
      String trainType,
      String trainNumber,
      String departureTime,
      List<String> destinationStation,
      bool? isLast,
      bool? isSaturdayHoliday});
}

/// @nodoc
class __$$StationTimetableObjectDtoImplCopyWithImpl<$Res>
    extends _$StationTimetableObjectDtoCopyWithImpl<$Res,
        _$StationTimetableObjectDtoImpl>
    implements _$$StationTimetableObjectDtoImplCopyWith<$Res> {
  __$$StationTimetableObjectDtoImplCopyWithImpl(
      _$StationTimetableObjectDtoImpl _value,
      $Res Function(_$StationTimetableObjectDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationTimetableObjectDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? train = null,
    Object? trainType = null,
    Object? trainNumber = null,
    Object? departureTime = null,
    Object? destinationStation = null,
    Object? isLast = freezed,
    Object? isSaturdayHoliday = freezed,
  }) {
    return _then(_$StationTimetableObjectDtoImpl(
      train: null == train
          ? _value.train
          : train // ignore: cast_nullable_to_non_nullable
              as String,
      trainType: null == trainType
          ? _value.trainType
          : trainType // ignore: cast_nullable_to_non_nullable
              as String,
      trainNumber: null == trainNumber
          ? _value.trainNumber
          : trainNumber // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      destinationStation: null == destinationStation
          ? _value._destinationStation
          : destinationStation // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLast: freezed == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaturdayHoliday: freezed == isSaturdayHoliday
          ? _value.isSaturdayHoliday
          : isSaturdayHoliday // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationTimetableObjectDtoImpl implements _StationTimetableObjectDto {
  _$StationTimetableObjectDtoImpl(
      {required this.train,
      required this.trainType,
      required this.trainNumber,
      required this.departureTime,
      required final List<String> destinationStation,
      required this.isLast,
      required this.isSaturdayHoliday})
      : _destinationStation = destinationStation;

  factory _$StationTimetableObjectDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationTimetableObjectDtoImplFromJson(json);

  /// 例: "odpt.Train:TokyoMetro.Chiyoda.B529S"
  @override
  final String train;

  /// 例: "odpt.TrainType:TokyoMetro.Local"
  @override
  final String trainType;

  /// 例: "B529S"
  @override
  final String trainNumber;

  /// 例: "05:10" (発車時刻)
  @override
  final String departureTime;

  /// 例: ["odpt.Station:JR-East.JobanLocal.Abiko"]
  final List<String> _destinationStation;

  /// 例: ["odpt.Station:JR-East.JobanLocal.Abiko"]
  @override
  List<String> get destinationStation {
    if (_destinationStation is EqualUnmodifiableListView)
      return _destinationStation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinationStation);
  }

  /// 例: 土休日など終電近くで "odpt:isLast": true が入る場合
  @override
  final bool? isLast;

  /// 例: `"TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday": true`
  /// のような追加キーにも対応したい場合は、下記のようにフィールドを追加で定義可能。
  /// フィールド名が複雑なので、注意が必要。
  /// 今回は例として optional に示します（必須でなければ省略可能）。
  @override
  final bool? isSaturdayHoliday;

  @override
  String toString() {
    return 'StationTimetableObjectDto(train: $train, trainType: $trainType, trainNumber: $trainNumber, departureTime: $departureTime, destinationStation: $destinationStation, isLast: $isLast, isSaturdayHoliday: $isSaturdayHoliday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationTimetableObjectDtoImpl &&
            (identical(other.train, train) || other.train == train) &&
            (identical(other.trainType, trainType) ||
                other.trainType == trainType) &&
            (identical(other.trainNumber, trainNumber) ||
                other.trainNumber == trainNumber) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            const DeepCollectionEquality()
                .equals(other._destinationStation, _destinationStation) &&
            (identical(other.isLast, isLast) || other.isLast == isLast) &&
            (identical(other.isSaturdayHoliday, isSaturdayHoliday) ||
                other.isSaturdayHoliday == isSaturdayHoliday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      train,
      trainType,
      trainNumber,
      departureTime,
      const DeepCollectionEquality().hash(_destinationStation),
      isLast,
      isSaturdayHoliday);

  /// Create a copy of StationTimetableObjectDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationTimetableObjectDtoImplCopyWith<_$StationTimetableObjectDtoImpl>
      get copyWith => __$$StationTimetableObjectDtoImplCopyWithImpl<
          _$StationTimetableObjectDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationTimetableObjectDtoImplToJson(
      this,
    );
  }
}

abstract class _StationTimetableObjectDto implements StationTimetableObjectDto {
  factory _StationTimetableObjectDto(
          {required final String train,
          required final String trainType,
          required final String trainNumber,
          required final String departureTime,
          required final List<String> destinationStation,
          required final bool? isLast,
          required final bool? isSaturdayHoliday}) =
      _$StationTimetableObjectDtoImpl;

  factory _StationTimetableObjectDto.fromJson(Map<String, dynamic> json) =
      _$StationTimetableObjectDtoImpl.fromJson;

  /// 例: "odpt.Train:TokyoMetro.Chiyoda.B529S"
  @override
  String get train;

  /// 例: "odpt.TrainType:TokyoMetro.Local"
  @override
  String get trainType;

  /// 例: "B529S"
  @override
  String get trainNumber;

  /// 例: "05:10" (発車時刻)
  @override
  String get departureTime;

  /// 例: ["odpt.Station:JR-East.JobanLocal.Abiko"]
  @override
  List<String> get destinationStation;

  /// 例: 土休日など終電近くで "odpt:isLast": true が入る場合
  @override
  bool? get isLast;

  /// 例: `"TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday": true`
  /// のような追加キーにも対応したい場合は、下記のようにフィールドを追加で定義可能。
  /// フィールド名が複雑なので、注意が必要。
  /// 今回は例として optional に示します（必須でなければ省略可能）。
  @override
  bool? get isSaturdayHoliday;

  /// Create a copy of StationTimetableObjectDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationTimetableObjectDtoImplCopyWith<_$StationTimetableObjectDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
