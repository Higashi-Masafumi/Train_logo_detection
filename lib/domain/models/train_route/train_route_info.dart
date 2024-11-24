import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:flutter/material.dart';

part 'train_route_info.freezed.dart';

@freezed
class TrainLine with _$TrainLine {
  const factory TrainLine({
    required int id,
    required String name,
    required TrainLineLabel label,
    required Color color,
  }) = _TrainLine;
}

@freezed
class Station with _$Station {
  const factory Station({
    required int id,
    required int lineId,
    required String name,
    required String stationNumber,
    required List<TrainLine>? connectedLines,
    String? iconUrl,
  }) = _Station;
}

@freezed
class TrainRouteInfo with _$TrainRouteInfo {
  const factory TrainRouteInfo({
    required TrainLine line,
    required List<Station> stations,
    Station? currentStation,
  }) = _TrainRouteInfo;
}
