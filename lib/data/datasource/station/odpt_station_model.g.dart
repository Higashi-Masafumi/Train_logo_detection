// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odpt_station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OdptStationImpl _$$OdptStationImplFromJson(Map<String, dynamic> json) =>
    _$OdptStationImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      owlSameAs: json['owlSameAs'] as String,
      line: json['line'] as String,
      operator: json['operator'] as String,
      stationCode: json['stationCode'] as String,
      stationTitle: Map<String, String>.from(json['stationTitle'] as Map),
      passengerSurvey: (json['passengerSurvey'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stationTimetable: (json['stationTimetable'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      connectingLines: (json['connectingLines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      connectingStations: (json['connectingStations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$OdptStationImplToJson(_$OdptStationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'title': instance.title,
      'owlSameAs': instance.owlSameAs,
      'line': instance.line,
      'operator': instance.operator,
      'stationCode': instance.stationCode,
      'stationTitle': instance.stationTitle,
      'passengerSurvey': instance.passengerSurvey,
      'stationTimetable': instance.stationTimetable,
      'connectingLines': instance.connectingLines,
      'connectingStations': instance.connectingStations,
    };
