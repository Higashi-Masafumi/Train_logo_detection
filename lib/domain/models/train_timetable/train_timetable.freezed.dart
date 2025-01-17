// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StationTimetable {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get railway => throw _privateConstructorUsedError;
  String get station => throw _privateConstructorUsedError;
  String get railDirection => throw _privateConstructorUsedError;
  String get operatorId => throw _privateConstructorUsedError;
  String get calendar => throw _privateConstructorUsedError;
  List<StationTimetableObject> get timetableObjects =>
      throw _privateConstructorUsedError;

  /// Create a copy of StationTimetable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationTimetableCopyWith<StationTimetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationTimetableCopyWith<$Res> {
  factory $StationTimetableCopyWith(
          StationTimetable value, $Res Function(StationTimetable) then) =
      _$StationTimetableCopyWithImpl<$Res, StationTimetable>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String railway,
      String station,
      String railDirection,
      String operatorId,
      String calendar,
      List<StationTimetableObject> timetableObjects});
}

/// @nodoc
class _$StationTimetableCopyWithImpl<$Res, $Val extends StationTimetable>
    implements $StationTimetableCopyWith<$Res> {
  _$StationTimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationTimetable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? railway = null,
    Object? station = null,
    Object? railDirection = null,
    Object? operatorId = null,
    Object? calendar = null,
    Object? timetableObjects = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      railway: null == railway
          ? _value.railway
          : railway // ignore: cast_nullable_to_non_nullable
              as String,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      railDirection: null == railDirection
          ? _value.railDirection
          : railDirection // ignore: cast_nullable_to_non_nullable
              as String,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as String,
      timetableObjects: null == timetableObjects
          ? _value.timetableObjects
          : timetableObjects // ignore: cast_nullable_to_non_nullable
              as List<StationTimetableObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationTimetableImplCopyWith<$Res>
    implements $StationTimetableCopyWith<$Res> {
  factory _$$StationTimetableImplCopyWith(_$StationTimetableImpl value,
          $Res Function(_$StationTimetableImpl) then) =
      __$$StationTimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String railway,
      String station,
      String railDirection,
      String operatorId,
      String calendar,
      List<StationTimetableObject> timetableObjects});
}

/// @nodoc
class __$$StationTimetableImplCopyWithImpl<$Res>
    extends _$StationTimetableCopyWithImpl<$Res, _$StationTimetableImpl>
    implements _$$StationTimetableImplCopyWith<$Res> {
  __$$StationTimetableImplCopyWithImpl(_$StationTimetableImpl _value,
      $Res Function(_$StationTimetableImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationTimetable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? railway = null,
    Object? station = null,
    Object? railDirection = null,
    Object? operatorId = null,
    Object? calendar = null,
    Object? timetableObjects = null,
  }) {
    return _then(_$StationTimetableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      railway: null == railway
          ? _value.railway
          : railway // ignore: cast_nullable_to_non_nullable
              as String,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      railDirection: null == railDirection
          ? _value.railDirection
          : railDirection // ignore: cast_nullable_to_non_nullable
              as String,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as String,
      timetableObjects: null == timetableObjects
          ? _value._timetableObjects
          : timetableObjects // ignore: cast_nullable_to_non_nullable
              as List<StationTimetableObject>,
    ));
  }
}

/// @nodoc

class _$StationTimetableImpl implements _StationTimetable {
  const _$StationTimetableImpl(
      {required this.id,
      required this.date,
      required this.railway,
      required this.station,
      required this.railDirection,
      required this.operatorId,
      required this.calendar,
      required final List<StationTimetableObject> timetableObjects})
      : _timetableObjects = timetableObjects;

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String railway;
  @override
  final String station;
  @override
  final String railDirection;
  @override
  final String operatorId;
  @override
  final String calendar;
  final List<StationTimetableObject> _timetableObjects;
  @override
  List<StationTimetableObject> get timetableObjects {
    if (_timetableObjects is EqualUnmodifiableListView)
      return _timetableObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timetableObjects);
  }

  @override
  String toString() {
    return 'StationTimetable(id: $id, date: $date, railway: $railway, station: $station, railDirection: $railDirection, operatorId: $operatorId, calendar: $calendar, timetableObjects: $timetableObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationTimetableImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.railway, railway) || other.railway == railway) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.railDirection, railDirection) ||
                other.railDirection == railDirection) &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId) &&
            (identical(other.calendar, calendar) ||
                other.calendar == calendar) &&
            const DeepCollectionEquality()
                .equals(other._timetableObjects, _timetableObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      railway,
      station,
      railDirection,
      operatorId,
      calendar,
      const DeepCollectionEquality().hash(_timetableObjects));

  /// Create a copy of StationTimetable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationTimetableImplCopyWith<_$StationTimetableImpl> get copyWith =>
      __$$StationTimetableImplCopyWithImpl<_$StationTimetableImpl>(
          this, _$identity);
}

abstract class _StationTimetable implements StationTimetable {
  const factory _StationTimetable(
          {required final String id,
          required final DateTime date,
          required final String railway,
          required final String station,
          required final String railDirection,
          required final String operatorId,
          required final String calendar,
          required final List<StationTimetableObject> timetableObjects}) =
      _$StationTimetableImpl;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get railway;
  @override
  String get station;
  @override
  String get railDirection;
  @override
  String get operatorId;
  @override
  String get calendar;
  @override
  List<StationTimetableObject> get timetableObjects;

  /// Create a copy of StationTimetable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationTimetableImplCopyWith<_$StationTimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StationTimetableObject {
  String get train => throw _privateConstructorUsedError;
  String get trainType => throw _privateConstructorUsedError;
  String get trainNumber => throw _privateConstructorUsedError;
  String get departureTime => throw _privateConstructorUsedError;
  List<String> get destinationStation => throw _privateConstructorUsedError;

  /// Create a copy of StationTimetableObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationTimetableObjectCopyWith<StationTimetableObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationTimetableObjectCopyWith<$Res> {
  factory $StationTimetableObjectCopyWith(StationTimetableObject value,
          $Res Function(StationTimetableObject) then) =
      _$StationTimetableObjectCopyWithImpl<$Res, StationTimetableObject>;
  @useResult
  $Res call(
      {String train,
      String trainType,
      String trainNumber,
      String departureTime,
      List<String> destinationStation});
}

/// @nodoc
class _$StationTimetableObjectCopyWithImpl<$Res,
        $Val extends StationTimetableObject>
    implements $StationTimetableObjectCopyWith<$Res> {
  _$StationTimetableObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationTimetableObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? train = null,
    Object? trainType = null,
    Object? trainNumber = null,
    Object? departureTime = null,
    Object? destinationStation = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationTimetableObjectImplCopyWith<$Res>
    implements $StationTimetableObjectCopyWith<$Res> {
  factory _$$StationTimetableObjectImplCopyWith(
          _$StationTimetableObjectImpl value,
          $Res Function(_$StationTimetableObjectImpl) then) =
      __$$StationTimetableObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String train,
      String trainType,
      String trainNumber,
      String departureTime,
      List<String> destinationStation});
}

/// @nodoc
class __$$StationTimetableObjectImplCopyWithImpl<$Res>
    extends _$StationTimetableObjectCopyWithImpl<$Res,
        _$StationTimetableObjectImpl>
    implements _$$StationTimetableObjectImplCopyWith<$Res> {
  __$$StationTimetableObjectImplCopyWithImpl(
      _$StationTimetableObjectImpl _value,
      $Res Function(_$StationTimetableObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationTimetableObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? train = null,
    Object? trainType = null,
    Object? trainNumber = null,
    Object? departureTime = null,
    Object? destinationStation = null,
  }) {
    return _then(_$StationTimetableObjectImpl(
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
    ));
  }
}

/// @nodoc

class _$StationTimetableObjectImpl implements _StationTimetableObject {
  const _$StationTimetableObjectImpl(
      {required this.train,
      required this.trainType,
      required this.trainNumber,
      required this.departureTime,
      required final List<String> destinationStation})
      : _destinationStation = destinationStation;

  @override
  final String train;
  @override
  final String trainType;
  @override
  final String trainNumber;
  @override
  final String departureTime;
  final List<String> _destinationStation;
  @override
  List<String> get destinationStation {
    if (_destinationStation is EqualUnmodifiableListView)
      return _destinationStation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinationStation);
  }

  @override
  String toString() {
    return 'StationTimetableObject(train: $train, trainType: $trainType, trainNumber: $trainNumber, departureTime: $departureTime, destinationStation: $destinationStation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationTimetableObjectImpl &&
            (identical(other.train, train) || other.train == train) &&
            (identical(other.trainType, trainType) ||
                other.trainType == trainType) &&
            (identical(other.trainNumber, trainNumber) ||
                other.trainNumber == trainNumber) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            const DeepCollectionEquality()
                .equals(other._destinationStation, _destinationStation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, train, trainType, trainNumber,
      departureTime, const DeepCollectionEquality().hash(_destinationStation));

  /// Create a copy of StationTimetableObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationTimetableObjectImplCopyWith<_$StationTimetableObjectImpl>
      get copyWith => __$$StationTimetableObjectImplCopyWithImpl<
          _$StationTimetableObjectImpl>(this, _$identity);
}

abstract class _StationTimetableObject implements StationTimetableObject {
  const factory _StationTimetableObject(
          {required final String train,
          required final String trainType,
          required final String trainNumber,
          required final String departureTime,
          required final List<String> destinationStation}) =
      _$StationTimetableObjectImpl;

  @override
  String get train;
  @override
  String get trainType;
  @override
  String get trainNumber;
  @override
  String get departureTime;
  @override
  List<String> get destinationStation;

  /// Create a copy of StationTimetableObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationTimetableObjectImplCopyWith<_$StationTimetableObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
