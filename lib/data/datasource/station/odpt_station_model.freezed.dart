// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odpt_station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OdptStation _$OdptStationFromJson(Map<String, dynamic> json) {
  return _OdptStation.fromJson(json);
}

/// @nodoc
mixin _$OdptStation {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get owlSameAs => throw _privateConstructorUsedError;
  String get line => throw _privateConstructorUsedError;
  String get operator => throw _privateConstructorUsedError;
  String get stationCode => throw _privateConstructorUsedError;
  Map<String, String> get stationTitle => throw _privateConstructorUsedError;
  List<String>? get passengerSurvey => throw _privateConstructorUsedError;
  List<String>? get stationTimetable => throw _privateConstructorUsedError;
  List<String>? get connectingLines => throw _privateConstructorUsedError;
  List<String>? get connectingStations => throw _privateConstructorUsedError;

  /// Serializes this OdptStation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdptStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdptStationCopyWith<OdptStation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdptStationCopyWith<$Res> {
  factory $OdptStationCopyWith(
          OdptStation value, $Res Function(OdptStation) then) =
      _$OdptStationCopyWithImpl<$Res, OdptStation>;
  @useResult
  $Res call(
      {String id,
      String type,
      double latitude,
      double longitude,
      String title,
      String owlSameAs,
      String line,
      String operator,
      String stationCode,
      Map<String, String> stationTitle,
      List<String>? passengerSurvey,
      List<String>? stationTimetable,
      List<String>? connectingLines,
      List<String>? connectingStations});
}

/// @nodoc
class _$OdptStationCopyWithImpl<$Res, $Val extends OdptStation>
    implements $OdptStationCopyWith<$Res> {
  _$OdptStationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdptStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? title = null,
    Object? owlSameAs = null,
    Object? line = null,
    Object? operator = null,
    Object? stationCode = null,
    Object? stationTitle = null,
    Object? passengerSurvey = freezed,
    Object? stationTimetable = freezed,
    Object? connectingLines = freezed,
    Object? connectingStations = freezed,
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
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owlSameAs: null == owlSameAs
          ? _value.owlSameAs
          : owlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      stationCode: null == stationCode
          ? _value.stationCode
          : stationCode // ignore: cast_nullable_to_non_nullable
              as String,
      stationTitle: null == stationTitle
          ? _value.stationTitle
          : stationTitle // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      passengerSurvey: freezed == passengerSurvey
          ? _value.passengerSurvey
          : passengerSurvey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stationTimetable: freezed == stationTimetable
          ? _value.stationTimetable
          : stationTimetable // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      connectingLines: freezed == connectingLines
          ? _value.connectingLines
          : connectingLines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      connectingStations: freezed == connectingStations
          ? _value.connectingStations
          : connectingStations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OdptStationImplCopyWith<$Res>
    implements $OdptStationCopyWith<$Res> {
  factory _$$OdptStationImplCopyWith(
          _$OdptStationImpl value, $Res Function(_$OdptStationImpl) then) =
      __$$OdptStationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      double latitude,
      double longitude,
      String title,
      String owlSameAs,
      String line,
      String operator,
      String stationCode,
      Map<String, String> stationTitle,
      List<String>? passengerSurvey,
      List<String>? stationTimetable,
      List<String>? connectingLines,
      List<String>? connectingStations});
}

/// @nodoc
class __$$OdptStationImplCopyWithImpl<$Res>
    extends _$OdptStationCopyWithImpl<$Res, _$OdptStationImpl>
    implements _$$OdptStationImplCopyWith<$Res> {
  __$$OdptStationImplCopyWithImpl(
      _$OdptStationImpl _value, $Res Function(_$OdptStationImpl) _then)
      : super(_value, _then);

  /// Create a copy of OdptStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? title = null,
    Object? owlSameAs = null,
    Object? line = null,
    Object? operator = null,
    Object? stationCode = null,
    Object? stationTitle = null,
    Object? passengerSurvey = freezed,
    Object? stationTimetable = freezed,
    Object? connectingLines = freezed,
    Object? connectingStations = freezed,
  }) {
    return _then(_$OdptStationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owlSameAs: null == owlSameAs
          ? _value.owlSameAs
          : owlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      stationCode: null == stationCode
          ? _value.stationCode
          : stationCode // ignore: cast_nullable_to_non_nullable
              as String,
      stationTitle: null == stationTitle
          ? _value._stationTitle
          : stationTitle // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      passengerSurvey: freezed == passengerSurvey
          ? _value._passengerSurvey
          : passengerSurvey // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stationTimetable: freezed == stationTimetable
          ? _value._stationTimetable
          : stationTimetable // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      connectingLines: freezed == connectingLines
          ? _value._connectingLines
          : connectingLines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      connectingStations: freezed == connectingStations
          ? _value._connectingStations
          : connectingStations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OdptStationImpl implements _OdptStation {
  const _$OdptStationImpl(
      {required this.id,
      required this.type,
      required this.latitude,
      required this.longitude,
      required this.title,
      required this.owlSameAs,
      required this.line,
      required this.operator,
      required this.stationCode,
      required final Map<String, String> stationTitle,
      final List<String>? passengerSurvey,
      final List<String>? stationTimetable,
      final List<String>? connectingLines,
      final List<String>? connectingStations})
      : _stationTitle = stationTitle,
        _passengerSurvey = passengerSurvey,
        _stationTimetable = stationTimetable,
        _connectingLines = connectingLines,
        _connectingStations = connectingStations;

  factory _$OdptStationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdptStationImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String title;
  @override
  final String owlSameAs;
  @override
  final String line;
  @override
  final String operator;
  @override
  final String stationCode;
  final Map<String, String> _stationTitle;
  @override
  Map<String, String> get stationTitle {
    if (_stationTitle is EqualUnmodifiableMapView) return _stationTitle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stationTitle);
  }

  final List<String>? _passengerSurvey;
  @override
  List<String>? get passengerSurvey {
    final value = _passengerSurvey;
    if (value == null) return null;
    if (_passengerSurvey is EqualUnmodifiableListView) return _passengerSurvey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _stationTimetable;
  @override
  List<String>? get stationTimetable {
    final value = _stationTimetable;
    if (value == null) return null;
    if (_stationTimetable is EqualUnmodifiableListView)
      return _stationTimetable;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _connectingLines;
  @override
  List<String>? get connectingLines {
    final value = _connectingLines;
    if (value == null) return null;
    if (_connectingLines is EqualUnmodifiableListView) return _connectingLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _connectingStations;
  @override
  List<String>? get connectingStations {
    final value = _connectingStations;
    if (value == null) return null;
    if (_connectingStations is EqualUnmodifiableListView)
      return _connectingStations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OdptStation(id: $id, type: $type, latitude: $latitude, longitude: $longitude, title: $title, owlSameAs: $owlSameAs, line: $line, operator: $operator, stationCode: $stationCode, stationTitle: $stationTitle, passengerSurvey: $passengerSurvey, stationTimetable: $stationTimetable, connectingLines: $connectingLines, connectingStations: $connectingStations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdptStationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.owlSameAs, owlSameAs) ||
                other.owlSameAs == owlSameAs) &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.stationCode, stationCode) ||
                other.stationCode == stationCode) &&
            const DeepCollectionEquality()
                .equals(other._stationTitle, _stationTitle) &&
            const DeepCollectionEquality()
                .equals(other._passengerSurvey, _passengerSurvey) &&
            const DeepCollectionEquality()
                .equals(other._stationTimetable, _stationTimetable) &&
            const DeepCollectionEquality()
                .equals(other._connectingLines, _connectingLines) &&
            const DeepCollectionEquality()
                .equals(other._connectingStations, _connectingStations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      latitude,
      longitude,
      title,
      owlSameAs,
      line,
      operator,
      stationCode,
      const DeepCollectionEquality().hash(_stationTitle),
      const DeepCollectionEquality().hash(_passengerSurvey),
      const DeepCollectionEquality().hash(_stationTimetable),
      const DeepCollectionEquality().hash(_connectingLines),
      const DeepCollectionEquality().hash(_connectingStations));

  /// Create a copy of OdptStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdptStationImplCopyWith<_$OdptStationImpl> get copyWith =>
      __$$OdptStationImplCopyWithImpl<_$OdptStationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OdptStationImplToJson(
      this,
    );
  }
}

abstract class _OdptStation implements OdptStation {
  const factory _OdptStation(
      {required final String id,
      required final String type,
      required final double latitude,
      required final double longitude,
      required final String title,
      required final String owlSameAs,
      required final String line,
      required final String operator,
      required final String stationCode,
      required final Map<String, String> stationTitle,
      final List<String>? passengerSurvey,
      final List<String>? stationTimetable,
      final List<String>? connectingLines,
      final List<String>? connectingStations}) = _$OdptStationImpl;

  factory _OdptStation.fromJson(Map<String, dynamic> json) =
      _$OdptStationImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get title;
  @override
  String get owlSameAs;
  @override
  String get line;
  @override
  String get operator;
  @override
  String get stationCode;
  @override
  Map<String, String> get stationTitle;
  @override
  List<String>? get passengerSurvey;
  @override
  List<String>? get stationTimetable;
  @override
  List<String>? get connectingLines;
  @override
  List<String>? get connectingStations;

  /// Create a copy of OdptStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdptStationImplCopyWith<_$OdptStationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
