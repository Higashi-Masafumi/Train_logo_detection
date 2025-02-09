import 'package:freezed_annotation/freezed_annotation.dart';

part 'train_route_info.freezed.dart';

@freezed
class TrainLine with _$TrainLine {
  const factory TrainLine({
    required String id,
    required String type,
    required String title,
    required String owlSameAs,
    required String color,
    required String lineCode,
    required String operatorId,
    required Map<String, String> lineTitle,
    required List<String> stationOrder, // 駅名のリスト
    required String ascendingDirection,
    required String descendingDirection,
  }) = _TrainLine;
}

@freezed
class Station with _$Station {
  const factory Station({
    required String id,
    required String type,
    required double latitude,
    required double longitude,
    required String title,
    required String owlSameAs,
    required String line,
    required String operatorId,
    required String stationCode,
    required Map<String, String> stationTitle,
    List<String>? passengerSurvey,
    List<String>? stationTimetable,
    List<TrainLine>? connectingLines, 
    List<Station>? connectingStations,
  }) = _Station;
}

@freezed
class TrainStatus with _$TrainStatus {
  const factory TrainStatus({
    required String id,
    required String type,
    required DateTime valid,
    required String owlSameAs,
    required String railway,
    required String operator,
    required DateTime timeOfOrigin,
    required Map<String, String> trainStatusText,
  }) = _TrainStatus;
}

@freezed
class TrainRouteInfo with _$TrainRouteInfo {
  const factory TrainRouteInfo({
    required TrainLine line,
    required List<Station> stations,
    required TrainStatus currentStatus,
    Station? currentStation,
  }) = _TrainRouteInfo;
}
