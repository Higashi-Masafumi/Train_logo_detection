// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odpt_connection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OdptLineConnection _$OdptLineConnectionFromJson(Map<String, dynamic> json) {
  return _OdptLineConnection.fromJson(json);
}

/// @nodoc
mixin _$OdptLineConnection {
  String get stationId => throw _privateConstructorUsedError;
  String get stationOwlSameAs => throw _privateConstructorUsedError;
  String get lineId => throw _privateConstructorUsedError;
  String get lineOwlSameAs => throw _privateConstructorUsedError;

  /// Serializes this OdptLineConnection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdptLineConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdptLineConnectionCopyWith<OdptLineConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdptLineConnectionCopyWith<$Res> {
  factory $OdptLineConnectionCopyWith(
          OdptLineConnection value, $Res Function(OdptLineConnection) then) =
      _$OdptLineConnectionCopyWithImpl<$Res, OdptLineConnection>;
  @useResult
  $Res call(
      {String stationId,
      String stationOwlSameAs,
      String lineId,
      String lineOwlSameAs});
}

/// @nodoc
class _$OdptLineConnectionCopyWithImpl<$Res, $Val extends OdptLineConnection>
    implements $OdptLineConnectionCopyWith<$Res> {
  _$OdptLineConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdptLineConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = null,
    Object? stationOwlSameAs = null,
    Object? lineId = null,
    Object? lineOwlSameAs = null,
  }) {
    return _then(_value.copyWith(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationOwlSameAs: null == stationOwlSameAs
          ? _value.stationOwlSameAs
          : stationOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      lineId: null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as String,
      lineOwlSameAs: null == lineOwlSameAs
          ? _value.lineOwlSameAs
          : lineOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OdptLineConnectionImplCopyWith<$Res>
    implements $OdptLineConnectionCopyWith<$Res> {
  factory _$$OdptLineConnectionImplCopyWith(_$OdptLineConnectionImpl value,
          $Res Function(_$OdptLineConnectionImpl) then) =
      __$$OdptLineConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stationId,
      String stationOwlSameAs,
      String lineId,
      String lineOwlSameAs});
}

/// @nodoc
class __$$OdptLineConnectionImplCopyWithImpl<$Res>
    extends _$OdptLineConnectionCopyWithImpl<$Res, _$OdptLineConnectionImpl>
    implements _$$OdptLineConnectionImplCopyWith<$Res> {
  __$$OdptLineConnectionImplCopyWithImpl(_$OdptLineConnectionImpl _value,
      $Res Function(_$OdptLineConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OdptLineConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = null,
    Object? stationOwlSameAs = null,
    Object? lineId = null,
    Object? lineOwlSameAs = null,
  }) {
    return _then(_$OdptLineConnectionImpl(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationOwlSameAs: null == stationOwlSameAs
          ? _value.stationOwlSameAs
          : stationOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      lineId: null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as String,
      lineOwlSameAs: null == lineOwlSameAs
          ? _value.lineOwlSameAs
          : lineOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OdptLineConnectionImpl implements _OdptLineConnection {
  const _$OdptLineConnectionImpl(
      {required this.stationId,
      required this.stationOwlSameAs,
      required this.lineId,
      required this.lineOwlSameAs});

  factory _$OdptLineConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdptLineConnectionImplFromJson(json);

  @override
  final String stationId;
  @override
  final String stationOwlSameAs;
  @override
  final String lineId;
  @override
  final String lineOwlSameAs;

  @override
  String toString() {
    return 'OdptLineConnection(stationId: $stationId, stationOwlSameAs: $stationOwlSameAs, lineId: $lineId, lineOwlSameAs: $lineOwlSameAs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdptLineConnectionImpl &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.stationOwlSameAs, stationOwlSameAs) ||
                other.stationOwlSameAs == stationOwlSameAs) &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.lineOwlSameAs, lineOwlSameAs) ||
                other.lineOwlSameAs == lineOwlSameAs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, stationId, stationOwlSameAs, lineId, lineOwlSameAs);

  /// Create a copy of OdptLineConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdptLineConnectionImplCopyWith<_$OdptLineConnectionImpl> get copyWith =>
      __$$OdptLineConnectionImplCopyWithImpl<_$OdptLineConnectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OdptLineConnectionImplToJson(
      this,
    );
  }
}

abstract class _OdptLineConnection implements OdptLineConnection {
  const factory _OdptLineConnection(
      {required final String stationId,
      required final String stationOwlSameAs,
      required final String lineId,
      required final String lineOwlSameAs}) = _$OdptLineConnectionImpl;

  factory _OdptLineConnection.fromJson(Map<String, dynamic> json) =
      _$OdptLineConnectionImpl.fromJson;

  @override
  String get stationId;
  @override
  String get stationOwlSameAs;
  @override
  String get lineId;
  @override
  String get lineOwlSameAs;

  /// Create a copy of OdptLineConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdptLineConnectionImplCopyWith<_$OdptLineConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OdptStationConnection _$OdptStationConnectionFromJson(
    Map<String, dynamic> json) {
  return _OdptStationConnection.fromJson(json);
}

/// @nodoc
mixin _$OdptStationConnection {
  String get stationId => throw _privateConstructorUsedError;
  String get stationOwlSameAs => throw _privateConstructorUsedError;
  String get connectingStationId => throw _privateConstructorUsedError;
  String get connectingStationOwlSameAs => throw _privateConstructorUsedError;

  /// Serializes this OdptStationConnection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdptStationConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdptStationConnectionCopyWith<OdptStationConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdptStationConnectionCopyWith<$Res> {
  factory $OdptStationConnectionCopyWith(OdptStationConnection value,
          $Res Function(OdptStationConnection) then) =
      _$OdptStationConnectionCopyWithImpl<$Res, OdptStationConnection>;
  @useResult
  $Res call(
      {String stationId,
      String stationOwlSameAs,
      String connectingStationId,
      String connectingStationOwlSameAs});
}

/// @nodoc
class _$OdptStationConnectionCopyWithImpl<$Res,
        $Val extends OdptStationConnection>
    implements $OdptStationConnectionCopyWith<$Res> {
  _$OdptStationConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdptStationConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = null,
    Object? stationOwlSameAs = null,
    Object? connectingStationId = null,
    Object? connectingStationOwlSameAs = null,
  }) {
    return _then(_value.copyWith(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationOwlSameAs: null == stationOwlSameAs
          ? _value.stationOwlSameAs
          : stationOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      connectingStationId: null == connectingStationId
          ? _value.connectingStationId
          : connectingStationId // ignore: cast_nullable_to_non_nullable
              as String,
      connectingStationOwlSameAs: null == connectingStationOwlSameAs
          ? _value.connectingStationOwlSameAs
          : connectingStationOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OdptStationConnectionImplCopyWith<$Res>
    implements $OdptStationConnectionCopyWith<$Res> {
  factory _$$OdptStationConnectionImplCopyWith(
          _$OdptStationConnectionImpl value,
          $Res Function(_$OdptStationConnectionImpl) then) =
      __$$OdptStationConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stationId,
      String stationOwlSameAs,
      String connectingStationId,
      String connectingStationOwlSameAs});
}

/// @nodoc
class __$$OdptStationConnectionImplCopyWithImpl<$Res>
    extends _$OdptStationConnectionCopyWithImpl<$Res,
        _$OdptStationConnectionImpl>
    implements _$$OdptStationConnectionImplCopyWith<$Res> {
  __$$OdptStationConnectionImplCopyWithImpl(_$OdptStationConnectionImpl _value,
      $Res Function(_$OdptStationConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OdptStationConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = null,
    Object? stationOwlSameAs = null,
    Object? connectingStationId = null,
    Object? connectingStationOwlSameAs = null,
  }) {
    return _then(_$OdptStationConnectionImpl(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      stationOwlSameAs: null == stationOwlSameAs
          ? _value.stationOwlSameAs
          : stationOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
      connectingStationId: null == connectingStationId
          ? _value.connectingStationId
          : connectingStationId // ignore: cast_nullable_to_non_nullable
              as String,
      connectingStationOwlSameAs: null == connectingStationOwlSameAs
          ? _value.connectingStationOwlSameAs
          : connectingStationOwlSameAs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OdptStationConnectionImpl implements _OdptStationConnection {
  const _$OdptStationConnectionImpl(
      {required this.stationId,
      required this.stationOwlSameAs,
      required this.connectingStationId,
      required this.connectingStationOwlSameAs});

  factory _$OdptStationConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdptStationConnectionImplFromJson(json);

  @override
  final String stationId;
  @override
  final String stationOwlSameAs;
  @override
  final String connectingStationId;
  @override
  final String connectingStationOwlSameAs;

  @override
  String toString() {
    return 'OdptStationConnection(stationId: $stationId, stationOwlSameAs: $stationOwlSameAs, connectingStationId: $connectingStationId, connectingStationOwlSameAs: $connectingStationOwlSameAs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdptStationConnectionImpl &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.stationOwlSameAs, stationOwlSameAs) ||
                other.stationOwlSameAs == stationOwlSameAs) &&
            (identical(other.connectingStationId, connectingStationId) ||
                other.connectingStationId == connectingStationId) &&
            (identical(other.connectingStationOwlSameAs,
                    connectingStationOwlSameAs) ||
                other.connectingStationOwlSameAs ==
                    connectingStationOwlSameAs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stationId, stationOwlSameAs,
      connectingStationId, connectingStationOwlSameAs);

  /// Create a copy of OdptStationConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdptStationConnectionImplCopyWith<_$OdptStationConnectionImpl>
      get copyWith => __$$OdptStationConnectionImplCopyWithImpl<
          _$OdptStationConnectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OdptStationConnectionImplToJson(
      this,
    );
  }
}

abstract class _OdptStationConnection implements OdptStationConnection {
  const factory _OdptStationConnection(
          {required final String stationId,
          required final String stationOwlSameAs,
          required final String connectingStationId,
          required final String connectingStationOwlSameAs}) =
      _$OdptStationConnectionImpl;

  factory _OdptStationConnection.fromJson(Map<String, dynamic> json) =
      _$OdptStationConnectionImpl.fromJson;

  @override
  String get stationId;
  @override
  String get stationOwlSameAs;
  @override
  String get connectingStationId;
  @override
  String get connectingStationOwlSameAs;

  /// Create a copy of OdptStationConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdptStationConnectionImplCopyWith<_$OdptStationConnectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
