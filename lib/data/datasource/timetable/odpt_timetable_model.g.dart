// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odpt_timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationTimetableDtoImpl _$$StationTimetableDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$StationTimetableDtoImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      context: json['context'] as String,
      issued: json['issued'] as String,
      sameAs: json['sameAs'] as String,
      railway: json['railway'] as String,
      station: json['station'] as String,
      calendar: json['calendar'] as String,
      operatorId: json['operatorId'] as String,
      railDirection: json['railDirection'] as String,
      stationTimetableObjects:
          (json['stationTimetableObjects'] as List<dynamic>)
              .map((e) =>
                  StationTimetableObjectDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$StationTimetableDtoImplToJson(
        _$StationTimetableDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'context': instance.context,
      'issued': instance.issued,
      'sameAs': instance.sameAs,
      'railway': instance.railway,
      'station': instance.station,
      'calendar': instance.calendar,
      'operatorId': instance.operatorId,
      'railDirection': instance.railDirection,
      'stationTimetableObjects': instance.stationTimetableObjects,
    };

_$StationTimetableObjectDtoImpl _$$StationTimetableObjectDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$StationTimetableObjectDtoImpl(
      train: json['train'] as String,
      trainType: json['trainType'] as String,
      trainNumber: json['trainNumber'] as String,
      departureTime: json['departureTime'] as String,
      destinationStation: (json['destinationStation'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isLast: json['isLast'] as bool?,
      isSaturdayHoliday: json['isSaturdayHoliday'] as bool?,
    );

Map<String, dynamic> _$$StationTimetableObjectDtoImplToJson(
        _$StationTimetableObjectDtoImpl instance) =>
    <String, dynamic>{
      'train': instance.train,
      'trainType': instance.trainType,
      'trainNumber': instance.trainNumber,
      'departureTime': instance.departureTime,
      'destinationStation': instance.destinationStation,
      'isLast': instance.isLast,
      'isSaturdayHoliday': instance.isSaturdayHoliday,
    };
