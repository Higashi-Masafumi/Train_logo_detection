import 'package:train_logo_detection_app/data/datasource/database/railway_database_service.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:flutter/foundation.dart';

class OdptTrainRouteRepository implements TrainRouteRepository {
  final RailwayDatabaseService _databaseService;

  OdptTrainRouteRepository(this._databaseService);
  @override
  Future<TrainLine> getTrainRouteInfo(TrainLogoDetectionResult result) async {
    final lineLabel = result.detectedLine!;
    final lineTitle = TrainLineLabelMapper.getLineNameJapanese(lineLabel);

    try {
      final odptLine = await _databaseService.getLinebyTitle(lineTitle);
      if (odptLine == null) {
        throw Exception('Line not found: $lineLabel');
      }

      // OdptLineをTrainLineに変換
      return TrainLine(
        id: odptLine.id,
        type: odptLine.type,
        title: odptLine.title,
        owlSameAs: odptLine.owlSameAs,
        color: odptLine.color,
        lineCode: odptLine.lineCode,
        operatorId: odptLine.operator,
        lineTitle: odptLine.lineTitle,
        stationOrder: odptLine.stationOrder.map((s) => s.station).toList(),
        ascendingDirection: odptLine.ascendingDirection,
        descendingDirection: odptLine.descendingDirection,
      );
    } catch (e) {
      throw Exception('Failed to fetch train route info: $e');
    }
  }

  @override
  Future<Station> getStaion(String owlSameAs) async {
    final odptStation = await _databaseService.getStationByOwlSameAs(owlSameAs);
    if (odptStation == null) {
      throw Exception('Station not found: $owlSameAs');
    }
    return Station(
      id: odptStation.id,
      type: odptStation.type,
      latitude: odptStation.latitude,
      longitude: odptStation.longitude,
      title: odptStation.title,
      owlSameAs: odptStation.owlSameAs,
      line: odptStation.line,
      operatorId: odptStation.operator,
      stationCode: odptStation.stationCode,
      stationTitle: odptStation.stationTitle,
      passengerSurvey: odptStation.passengerSurvey,
      stationTimetable: odptStation.stationTimetable,
      connectingLines: [], // 必要に応じて後で設定
      connectingStations: [], // 必要に応じて後で設定
    );
  }

  @override
  Future<List<Station>> getStations(List<String> stationOrder) async {
    try {
      final stations = await Future.wait(
        stationOrder.map((station) async {
          final odptStation =
              await _databaseService.getStationByOwlSameAs(station);
          if (odptStation == null) {
            throw Exception('Station not found: $station');
          }

          // 接続路線の取得
          final connectingLines = await Future.wait(
            (odptStation.connectingLines ?? []).map((lineOwlSameAs) async {
              final line =
                  await _databaseService.getLineByOwlSameAs(lineOwlSameAs);
              if (line == null) {
                debugPrint('Warning: Connected line not found: $lineOwlSameAs');
                return null;
              }
              return TrainLine(
                id: line.id,
                type: line.type,
                title: line.title,
                owlSameAs: line.owlSameAs,
                color: line.color,
                lineCode: line.lineCode,
                operatorId: line.operator,
                lineTitle: line.lineTitle,
                stationOrder: line.stationOrder.map((s) => s.station).toList(),
                ascendingDirection: line.ascendingDirection,
                descendingDirection: line.descendingDirection,
              );
            }),
          );

          // 接続駅の取得
          final connectingStations = await Future.wait(
            (odptStation.connectingStations ?? [])
                .map((stationOwlSameAs) async {
              final station = await _databaseService
                  .getStationByOwlSameAs(stationOwlSameAs);
              if (station == null) {
                debugPrint(
                    'Warning: Connected station not found: $stationOwlSameAs');
                return null;
              }
              return Station(
                id: station.id,
                type: station.type,
                latitude: station.latitude,
                longitude: station.longitude,
                title: station.title,
                owlSameAs: station.owlSameAs,
                line: station.line,
                operatorId: station.operator,
                stationCode: station.stationCode,
                stationTitle: station.stationTitle,
                passengerSurvey: station.passengerSurvey,
                stationTimetable: station.stationTimetable,
                connectingLines: [], // 再帰を避けるため空のリストを設定
                connectingStations: [], // 再帰を避けるため空のリストを設定
              );
            }),
          );

          return Station(
            id: odptStation.id,
            type: odptStation.type,
            latitude: odptStation.latitude,
            longitude: odptStation.longitude,
            title: odptStation.title,
            owlSameAs: odptStation.owlSameAs,
            line: odptStation.line,
            operatorId: odptStation.operator,
            stationCode: odptStation.stationCode,
            stationTitle: odptStation.stationTitle,
            passengerSurvey: odptStation.passengerSurvey,
            stationTimetable: odptStation.stationTimetable,
            connectingLines: connectingLines.whereType<TrainLine>().toList(),
            connectingStations:
                connectingStations.whereType<Station>().toList(),
          );
        }),
      );
      return stations;
    } catch (e) {
      throw Exception('Failed to fetch stations: $e');
    }
  }

  @override
  Future<List<Station>> getConnectingStations(Station station) async {
    try {
      final connections =
          await _databaseService.getStationConnections(station.id);
      return Future.wait(
        connections.map((conn) async {
          final odptStation =
              await _databaseService.getStationById(conn.connectingStationId);
          if (odptStation == null) {
            throw Exception('Station not found: ${conn.connectingStationId}');
          }

          return Station(
            id: odptStation.id,
            type: odptStation.type,
            latitude: odptStation.latitude,
            longitude: odptStation.longitude,
            title: odptStation.title,
            owlSameAs: odptStation.owlSameAs,
            line: odptStation.line,
            operatorId: odptStation.operator,
            stationCode: odptStation.stationCode,
            stationTitle: odptStation.stationTitle,
            passengerSurvey: odptStation.passengerSurvey,
            stationTimetable: odptStation.stationTimetable,
            connectingLines: [], // 必要に応じて後で取得
            connectingStations: [], // 必要に応じて後で取得
          );
        }),
      );
    } catch (e) {
      throw Exception('Failed to fetch connecting stations: $e');
    }
  }
}
