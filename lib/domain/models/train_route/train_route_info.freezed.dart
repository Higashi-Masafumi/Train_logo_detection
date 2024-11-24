// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_route_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrainLine {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TrainLineLabel get label => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  /// Create a copy of TrainLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainLineCopyWith<TrainLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainLineCopyWith<$Res> {
  factory $TrainLineCopyWith(TrainLine value, $Res Function(TrainLine) then) =
      _$TrainLineCopyWithImpl<$Res, TrainLine>;
  @useResult
  $Res call({int id, String name, TrainLineLabel label, Color color});
}

/// @nodoc
class _$TrainLineCopyWithImpl<$Res, $Val extends TrainLine>
    implements $TrainLineCopyWith<$Res> {
  _$TrainLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as TrainLineLabel,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainLineImplCopyWith<$Res>
    implements $TrainLineCopyWith<$Res> {
  factory _$$TrainLineImplCopyWith(
          _$TrainLineImpl value, $Res Function(_$TrainLineImpl) then) =
      __$$TrainLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, TrainLineLabel label, Color color});
}

/// @nodoc
class __$$TrainLineImplCopyWithImpl<$Res>
    extends _$TrainLineCopyWithImpl<$Res, _$TrainLineImpl>
    implements _$$TrainLineImplCopyWith<$Res> {
  __$$TrainLineImplCopyWithImpl(
      _$TrainLineImpl _value, $Res Function(_$TrainLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? color = null,
  }) {
    return _then(_$TrainLineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as TrainLineLabel,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$TrainLineImpl implements _TrainLine {
  const _$TrainLineImpl(
      {required this.id,
      required this.name,
      required this.label,
      required this.color});

  @override
  final int id;
  @override
  final String name;
  @override
  final TrainLineLabel label;
  @override
  final Color color;

  @override
  String toString() {
    return 'TrainLine(id: $id, name: $name, label: $label, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, label, color);

  /// Create a copy of TrainLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainLineImplCopyWith<_$TrainLineImpl> get copyWith =>
      __$$TrainLineImplCopyWithImpl<_$TrainLineImpl>(this, _$identity);
}

abstract class _TrainLine implements TrainLine {
  const factory _TrainLine(
      {required final int id,
      required final String name,
      required final TrainLineLabel label,
      required final Color color}) = _$TrainLineImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  TrainLineLabel get label;
  @override
  Color get color;

  /// Create a copy of TrainLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainLineImplCopyWith<_$TrainLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Station {
  int get id => throw _privateConstructorUsedError;
  int get lineId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get stationNumber => throw _privateConstructorUsedError;
  List<TrainLine>? get connectedLines => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationCopyWith<Station> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationCopyWith<$Res> {
  factory $StationCopyWith(Station value, $Res Function(Station) then) =
      _$StationCopyWithImpl<$Res, Station>;
  @useResult
  $Res call(
      {int id,
      int lineId,
      String name,
      String stationNumber,
      List<TrainLine>? connectedLines,
      String? iconUrl});
}

/// @nodoc
class _$StationCopyWithImpl<$Res, $Val extends Station>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lineId = null,
    Object? name = null,
    Object? stationNumber = null,
    Object? connectedLines = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lineId: null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stationNumber: null == stationNumber
          ? _value.stationNumber
          : stationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      connectedLines: freezed == connectedLines
          ? _value.connectedLines
          : connectedLines // ignore: cast_nullable_to_non_nullable
              as List<TrainLine>?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationImplCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$$StationImplCopyWith(
          _$StationImpl value, $Res Function(_$StationImpl) then) =
      __$$StationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int lineId,
      String name,
      String stationNumber,
      List<TrainLine>? connectedLines,
      String? iconUrl});
}

/// @nodoc
class __$$StationImplCopyWithImpl<$Res>
    extends _$StationCopyWithImpl<$Res, _$StationImpl>
    implements _$$StationImplCopyWith<$Res> {
  __$$StationImplCopyWithImpl(
      _$StationImpl _value, $Res Function(_$StationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lineId = null,
    Object? name = null,
    Object? stationNumber = null,
    Object? connectedLines = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$StationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lineId: null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stationNumber: null == stationNumber
          ? _value.stationNumber
          : stationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      connectedLines: freezed == connectedLines
          ? _value._connectedLines
          : connectedLines // ignore: cast_nullable_to_non_nullable
              as List<TrainLine>?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StationImpl implements _Station {
  const _$StationImpl(
      {required this.id,
      required this.lineId,
      required this.name,
      required this.stationNumber,
      required final List<TrainLine>? connectedLines,
      this.iconUrl})
      : _connectedLines = connectedLines;

  @override
  final int id;
  @override
  final int lineId;
  @override
  final String name;
  @override
  final String stationNumber;
  final List<TrainLine>? _connectedLines;
  @override
  List<TrainLine>? get connectedLines {
    final value = _connectedLines;
    if (value == null) return null;
    if (_connectedLines is EqualUnmodifiableListView) return _connectedLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'Station(id: $id, lineId: $lineId, name: $name, stationNumber: $stationNumber, connectedLines: $connectedLines, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stationNumber, stationNumber) ||
                other.stationNumber == stationNumber) &&
            const DeepCollectionEquality()
                .equals(other._connectedLines, _connectedLines) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, lineId, name, stationNumber,
      const DeepCollectionEquality().hash(_connectedLines), iconUrl);

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationImplCopyWith<_$StationImpl> get copyWith =>
      __$$StationImplCopyWithImpl<_$StationImpl>(this, _$identity);
}

abstract class _Station implements Station {
  const factory _Station(
      {required final int id,
      required final int lineId,
      required final String name,
      required final String stationNumber,
      required final List<TrainLine>? connectedLines,
      final String? iconUrl}) = _$StationImpl;

  @override
  int get id;
  @override
  int get lineId;
  @override
  String get name;
  @override
  String get stationNumber;
  @override
  List<TrainLine>? get connectedLines;
  @override
  String? get iconUrl;

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationImplCopyWith<_$StationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrainRouteInfo {
  TrainLine get line => throw _privateConstructorUsedError;
  List<Station> get stations => throw _privateConstructorUsedError;
  Station? get currentStation => throw _privateConstructorUsedError;

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainRouteInfoCopyWith<TrainRouteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainRouteInfoCopyWith<$Res> {
  factory $TrainRouteInfoCopyWith(
          TrainRouteInfo value, $Res Function(TrainRouteInfo) then) =
      _$TrainRouteInfoCopyWithImpl<$Res, TrainRouteInfo>;
  @useResult
  $Res call({TrainLine line, List<Station> stations, Station? currentStation});

  $TrainLineCopyWith<$Res> get line;
  $StationCopyWith<$Res>? get currentStation;
}

/// @nodoc
class _$TrainRouteInfoCopyWithImpl<$Res, $Val extends TrainRouteInfo>
    implements $TrainRouteInfoCopyWith<$Res> {
  _$TrainRouteInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? stations = null,
    Object? currentStation = freezed,
  }) {
    return _then(_value.copyWith(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as TrainLine,
      stations: null == stations
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      currentStation: freezed == currentStation
          ? _value.currentStation
          : currentStation // ignore: cast_nullable_to_non_nullable
              as Station?,
    ) as $Val);
  }

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainLineCopyWith<$Res> get line {
    return $TrainLineCopyWith<$Res>(_value.line, (value) {
      return _then(_value.copyWith(line: value) as $Val);
    });
  }

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StationCopyWith<$Res>? get currentStation {
    if (_value.currentStation == null) {
      return null;
    }

    return $StationCopyWith<$Res>(_value.currentStation!, (value) {
      return _then(_value.copyWith(currentStation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainRouteInfoImplCopyWith<$Res>
    implements $TrainRouteInfoCopyWith<$Res> {
  factory _$$TrainRouteInfoImplCopyWith(_$TrainRouteInfoImpl value,
          $Res Function(_$TrainRouteInfoImpl) then) =
      __$$TrainRouteInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrainLine line, List<Station> stations, Station? currentStation});

  @override
  $TrainLineCopyWith<$Res> get line;
  @override
  $StationCopyWith<$Res>? get currentStation;
}

/// @nodoc
class __$$TrainRouteInfoImplCopyWithImpl<$Res>
    extends _$TrainRouteInfoCopyWithImpl<$Res, _$TrainRouteInfoImpl>
    implements _$$TrainRouteInfoImplCopyWith<$Res> {
  __$$TrainRouteInfoImplCopyWithImpl(
      _$TrainRouteInfoImpl _value, $Res Function(_$TrainRouteInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? stations = null,
    Object? currentStation = freezed,
  }) {
    return _then(_$TrainRouteInfoImpl(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as TrainLine,
      stations: null == stations
          ? _value._stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      currentStation: freezed == currentStation
          ? _value.currentStation
          : currentStation // ignore: cast_nullable_to_non_nullable
              as Station?,
    ));
  }
}

/// @nodoc

class _$TrainRouteInfoImpl implements _TrainRouteInfo {
  const _$TrainRouteInfoImpl(
      {required this.line,
      required final List<Station> stations,
      this.currentStation})
      : _stations = stations;

  @override
  final TrainLine line;
  final List<Station> _stations;
  @override
  List<Station> get stations {
    if (_stations is EqualUnmodifiableListView) return _stations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stations);
  }

  @override
  final Station? currentStation;

  @override
  String toString() {
    return 'TrainRouteInfo(line: $line, stations: $stations, currentStation: $currentStation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainRouteInfoImpl &&
            (identical(other.line, line) || other.line == line) &&
            const DeepCollectionEquality().equals(other._stations, _stations) &&
            (identical(other.currentStation, currentStation) ||
                other.currentStation == currentStation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, line,
      const DeepCollectionEquality().hash(_stations), currentStation);

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainRouteInfoImplCopyWith<_$TrainRouteInfoImpl> get copyWith =>
      __$$TrainRouteInfoImplCopyWithImpl<_$TrainRouteInfoImpl>(
          this, _$identity);
}

abstract class _TrainRouteInfo implements TrainRouteInfo {
  const factory _TrainRouteInfo(
      {required final TrainLine line,
      required final List<Station> stations,
      final Station? currentStation}) = _$TrainRouteInfoImpl;

  @override
  TrainLine get line;
  @override
  List<Station> get stations;
  @override
  Station? get currentStation;

  /// Create a copy of TrainRouteInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainRouteInfoImplCopyWith<_$TrainRouteInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
