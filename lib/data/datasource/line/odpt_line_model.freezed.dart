// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odpt_line_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StationOrder _$StationOrderFromJson(Map<String, dynamic> json) {
  return _StationOrder.fromJson(json);
}

/// @nodoc
mixin _$StationOrder {
  int get index => throw _privateConstructorUsedError;
  String get station => throw _privateConstructorUsedError;
  Map<String, String> get title => throw _privateConstructorUsedError;

  /// Serializes this StationOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StationOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationOrderCopyWith<StationOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationOrderCopyWith<$Res> {
  factory $StationOrderCopyWith(
          StationOrder value, $Res Function(StationOrder) then) =
      _$StationOrderCopyWithImpl<$Res, StationOrder>;
  @useResult
  $Res call({int index, String station, Map<String, String> title});
}

/// @nodoc
class _$StationOrderCopyWithImpl<$Res, $Val extends StationOrder>
    implements $StationOrderCopyWith<$Res> {
  _$StationOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? station = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationOrderImplCopyWith<$Res>
    implements $StationOrderCopyWith<$Res> {
  factory _$$StationOrderImplCopyWith(
          _$StationOrderImpl value, $Res Function(_$StationOrderImpl) then) =
      __$$StationOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String station, Map<String, String> title});
}

/// @nodoc
class __$$StationOrderImplCopyWithImpl<$Res>
    extends _$StationOrderCopyWithImpl<$Res, _$StationOrderImpl>
    implements _$$StationOrderImplCopyWith<$Res> {
  __$$StationOrderImplCopyWithImpl(
      _$StationOrderImpl _value, $Res Function(_$StationOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? station = null,
    Object? title = null,
  }) {
    return _then(_$StationOrderImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value._title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationOrderImpl implements _StationOrder {
  const _$StationOrderImpl(
      {required this.index,
      required this.station,
      required final Map<String, String> title})
      : _title = title;

  factory _$StationOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationOrderImplFromJson(json);

  @override
  final int index;
  @override
  final String station;
  final Map<String, String> _title;
  @override
  Map<String, String> get title {
    if (_title is EqualUnmodifiableMapView) return _title;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_title);
  }

  @override
  String toString() {
    return 'StationOrder(index: $index, station: $station, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationOrderImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.station, station) || other.station == station) &&
            const DeepCollectionEquality().equals(other._title, _title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, index, station, const DeepCollectionEquality().hash(_title));

  /// Create a copy of StationOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationOrderImplCopyWith<_$StationOrderImpl> get copyWith =>
      __$$StationOrderImplCopyWithImpl<_$StationOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationOrderImplToJson(
      this,
    );
  }
}

abstract class _StationOrder implements StationOrder {
  const factory _StationOrder(
      {required final int index,
      required final String station,
      required final Map<String, String> title}) = _$StationOrderImpl;

  factory _StationOrder.fromJson(Map<String, dynamic> json) =
      _$StationOrderImpl.fromJson;

  @override
  int get index;
  @override
  String get station;
  @override
  Map<String, String> get title;

  /// Create a copy of StationOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationOrderImplCopyWith<_$StationOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OdptLine _$OdptLineFromJson(Map<String, dynamic> json) {
  return _OdptLine.fromJson(json);
}

/// @nodoc
mixin _$OdptLine {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get owlSameAs => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get lineCode => throw _privateConstructorUsedError;
  String get operator => throw _privateConstructorUsedError;
  Map<String, String> get lineTitle => throw _privateConstructorUsedError;
  List<StationOrder> get stationOrder => throw _privateConstructorUsedError;
  String get ascendingDirection => throw _privateConstructorUsedError;
  String get descendingDirection => throw _privateConstructorUsedError;

  /// Serializes this OdptLine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdptLineCopyWith<OdptLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdptLineCopyWith<$Res> {
  factory $OdptLineCopyWith(OdptLine value, $Res Function(OdptLine) then) =
      _$OdptLineCopyWithImpl<$Res, OdptLine>;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String owlSameAs,
      String color,
      String lineCode,
      String operator,
      Map<String, String> lineTitle,
      List<StationOrder> stationOrder,
      String ascendingDirection,
      String descendingDirection});
}

/// @nodoc
class _$OdptLineCopyWithImpl<$Res, $Val extends OdptLine>
    implements $OdptLineCopyWith<$Res> {
  _$OdptLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdptLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? owlSameAs = null,
    Object? color = null,
    Object? lineCode = null,
    Object? operator = null,
    Object? lineTitle = null,
    Object? stationOrder = null,
    Object? ascendingDirection = null,
    Object? descendingDirection = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owlSameAs: null == owlSameAs
          ? _value.owlSameAs
          : owlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      lineCode: null == lineCode
          ? _value.lineCode
          : lineCode // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      lineTitle: null == lineTitle
          ? _value.lineTitle
          : lineTitle // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      stationOrder: null == stationOrder
          ? _value.stationOrder
          : stationOrder // ignore: cast_nullable_to_non_nullable
              as List<StationOrder>,
      ascendingDirection: null == ascendingDirection
          ? _value.ascendingDirection
          : ascendingDirection // ignore: cast_nullable_to_non_nullable
              as String,
      descendingDirection: null == descendingDirection
          ? _value.descendingDirection
          : descendingDirection // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OdptLineImplCopyWith<$Res>
    implements $OdptLineCopyWith<$Res> {
  factory _$$OdptLineImplCopyWith(
          _$OdptLineImpl value, $Res Function(_$OdptLineImpl) then) =
      __$$OdptLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String owlSameAs,
      String color,
      String lineCode,
      String operator,
      Map<String, String> lineTitle,
      List<StationOrder> stationOrder,
      String ascendingDirection,
      String descendingDirection});
}

/// @nodoc
class __$$OdptLineImplCopyWithImpl<$Res>
    extends _$OdptLineCopyWithImpl<$Res, _$OdptLineImpl>
    implements _$$OdptLineImplCopyWith<$Res> {
  __$$OdptLineImplCopyWithImpl(
      _$OdptLineImpl _value, $Res Function(_$OdptLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of OdptLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? owlSameAs = null,
    Object? color = null,
    Object? lineCode = null,
    Object? operator = null,
    Object? lineTitle = null,
    Object? stationOrder = null,
    Object? ascendingDirection = null,
    Object? descendingDirection = null,
  }) {
    return _then(_$OdptLineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owlSameAs: null == owlSameAs
          ? _value.owlSameAs
          : owlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      lineCode: null == lineCode
          ? _value.lineCode
          : lineCode // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      lineTitle: null == lineTitle
          ? _value._lineTitle
          : lineTitle // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      stationOrder: null == stationOrder
          ? _value._stationOrder
          : stationOrder // ignore: cast_nullable_to_non_nullable
              as List<StationOrder>,
      ascendingDirection: null == ascendingDirection
          ? _value.ascendingDirection
          : ascendingDirection // ignore: cast_nullable_to_non_nullable
              as String,
      descendingDirection: null == descendingDirection
          ? _value.descendingDirection
          : descendingDirection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OdptLineImpl implements _OdptLine {
  const _$OdptLineImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.owlSameAs,
      required this.color,
      required this.lineCode,
      required this.operator,
      required final Map<String, String> lineTitle,
      required final List<StationOrder> stationOrder,
      required this.ascendingDirection,
      required this.descendingDirection})
      : _lineTitle = lineTitle,
        _stationOrder = stationOrder;

  factory _$OdptLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdptLineImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String owlSameAs;
  @override
  final String color;
  @override
  final String lineCode;
  @override
  final String operator;
  final Map<String, String> _lineTitle;
  @override
  Map<String, String> get lineTitle {
    if (_lineTitle is EqualUnmodifiableMapView) return _lineTitle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lineTitle);
  }

  final List<StationOrder> _stationOrder;
  @override
  List<StationOrder> get stationOrder {
    if (_stationOrder is EqualUnmodifiableListView) return _stationOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stationOrder);
  }

  @override
  final String ascendingDirection;
  @override
  final String descendingDirection;

  @override
  String toString() {
    return 'OdptLine(id: $id, type: $type, title: $title, owlSameAs: $owlSameAs, color: $color, lineCode: $lineCode, operator: $operator, lineTitle: $lineTitle, stationOrder: $stationOrder, ascendingDirection: $ascendingDirection, descendingDirection: $descendingDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdptLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.owlSameAs, owlSameAs) ||
                other.owlSameAs == owlSameAs) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.lineCode, lineCode) ||
                other.lineCode == lineCode) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            const DeepCollectionEquality()
                .equals(other._lineTitle, _lineTitle) &&
            const DeepCollectionEquality()
                .equals(other._stationOrder, _stationOrder) &&
            (identical(other.ascendingDirection, ascendingDirection) ||
                other.ascendingDirection == ascendingDirection) &&
            (identical(other.descendingDirection, descendingDirection) ||
                other.descendingDirection == descendingDirection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      owlSameAs,
      color,
      lineCode,
      operator,
      const DeepCollectionEquality().hash(_lineTitle),
      const DeepCollectionEquality().hash(_stationOrder),
      ascendingDirection,
      descendingDirection);

  /// Create a copy of OdptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdptLineImplCopyWith<_$OdptLineImpl> get copyWith =>
      __$$OdptLineImplCopyWithImpl<_$OdptLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OdptLineImplToJson(
      this,
    );
  }
}

abstract class _OdptLine implements OdptLine {
  const factory _OdptLine(
      {required final String id,
      required final String type,
      required final String title,
      required final String owlSameAs,
      required final String color,
      required final String lineCode,
      required final String operator,
      required final Map<String, String> lineTitle,
      required final List<StationOrder> stationOrder,
      required final String ascendingDirection,
      required final String descendingDirection}) = _$OdptLineImpl;

  factory _OdptLine.fromJson(Map<String, dynamic> json) =
      _$OdptLineImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get owlSameAs;
  @override
  String get color;
  @override
  String get lineCode;
  @override
  String get operator;
  @override
  Map<String, String> get lineTitle;
  @override
  List<StationOrder> get stationOrder;
  @override
  String get ascendingDirection;
  @override
  String get descendingDirection;

  /// Create a copy of OdptLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdptLineImplCopyWith<_$OdptLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
