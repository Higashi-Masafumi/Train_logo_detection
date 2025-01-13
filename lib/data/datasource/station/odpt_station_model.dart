import 'package:freezed_annotation/freezed_annotation.dart';

part 'odpt_station_model.freezed.dart';
part 'odpt_station_model.g.dart';

@freezed
class OdptStation with _$OdptStation {
  const factory OdptStation({
    required String id,
    required String type,
    required double latitude,
    required double longitude,
    required String title,
    required String owlSameAs,
    required String line,
    required String operator,
    required String stationCode,
    required Map<String, String> stationTitle,
    List<String>? passengerSurvey,
    List<String>? stationTimetable,
    List<String>? connectingLines,
    List<String>? connectingStations,
  }) = _OdptStation;

  factory OdptStation.fromJson(Map<String, dynamic> json) =>
      _$OdptStationFromJson(json);
}
