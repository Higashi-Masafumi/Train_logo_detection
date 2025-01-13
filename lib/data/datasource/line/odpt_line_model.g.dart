// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odpt_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationOrderImpl _$$StationOrderImplFromJson(Map<String, dynamic> json) =>
    _$StationOrderImpl(
      index: (json['index'] as num).toInt(),
      station: json['station'] as String,
      title: Map<String, String>.from(json['title'] as Map),
    );

Map<String, dynamic> _$$StationOrderImplToJson(_$StationOrderImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'station': instance.station,
      'title': instance.title,
    };

_$OdptLineImpl _$$OdptLineImplFromJson(Map<String, dynamic> json) =>
    _$OdptLineImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      owlSameAs: json['owlSameAs'] as String,
      color: json['color'] as String,
      lineCode: json['lineCode'] as String,
      operator: json['operator'] as String,
      lineTitle: Map<String, String>.from(json['lineTitle'] as Map),
      stationOrder: (json['stationOrder'] as List<dynamic>)
          .map((e) => StationOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      ascendingDirection: json['ascendingDirection'] as String,
      descendingDirection: json['descendingDirection'] as String,
    );

Map<String, dynamic> _$$OdptLineImplToJson(_$OdptLineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'owlSameAs': instance.owlSameAs,
      'color': instance.color,
      'lineCode': instance.lineCode,
      'operator': instance.operator,
      'lineTitle': instance.lineTitle,
      'stationOrder': instance.stationOrder,
      'ascendingDirection': instance.ascendingDirection,
      'descendingDirection': instance.descendingDirection,
    };
