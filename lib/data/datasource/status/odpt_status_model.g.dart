// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odpt_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainInformationDtoImpl _$$TrainInformationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainInformationDtoImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      context: json['context'] as String,
      valid: DateTime.parse(json['valid'] as String),
      sameAs: json['sameAs'] as String,
      railway: json['railway'] as String,
      operator: json['operator'] as String,
      timeOfOrigin: DateTime.parse(json['timeOfOrigin'] as String),
      trainInformationText:
          Map<String, String>.from(json['trainInformationText'] as Map),
    );

Map<String, dynamic> _$$TrainInformationDtoImplToJson(
        _$TrainInformationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'context': instance.context,
      'valid': instance.valid.toIso8601String(),
      'sameAs': instance.sameAs,
      'railway': instance.railway,
      'operator': instance.operator,
      'timeOfOrigin': instance.timeOfOrigin.toIso8601String(),
      'trainInformationText': instance.trainInformationText,
    };
