// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odpt_connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OdptLineConnectionImpl _$$OdptLineConnectionImplFromJson(
        Map<String, dynamic> json) =>
    _$OdptLineConnectionImpl(
      stationId: json['stationId'] as String,
      stationOwlSameAs: json['stationOwlSameAs'] as String,
      lineId: json['lineId'] as String,
      lineOwlSameAs: json['lineOwlSameAs'] as String,
    );

Map<String, dynamic> _$$OdptLineConnectionImplToJson(
        _$OdptLineConnectionImpl instance) =>
    <String, dynamic>{
      'stationId': instance.stationId,
      'stationOwlSameAs': instance.stationOwlSameAs,
      'lineId': instance.lineId,
      'lineOwlSameAs': instance.lineOwlSameAs,
    };

_$OdptStationConnectionImpl _$$OdptStationConnectionImplFromJson(
        Map<String, dynamic> json) =>
    _$OdptStationConnectionImpl(
      stationId: json['stationId'] as String,
      stationOwlSameAs: json['stationOwlSameAs'] as String,
      connectingStationId: json['connectingStationId'] as String,
      connectingStationOwlSameAs: json['connectingStationOwlSameAs'] as String,
    );

Map<String, dynamic> _$$OdptStationConnectionImplToJson(
        _$OdptStationConnectionImpl instance) =>
    <String, dynamic>{
      'stationId': instance.stationId,
      'stationOwlSameAs': instance.stationOwlSameAs,
      'connectingStationId': instance.connectingStationId,
      'connectingStationOwlSameAs': instance.connectingStationOwlSameAs,
    };
