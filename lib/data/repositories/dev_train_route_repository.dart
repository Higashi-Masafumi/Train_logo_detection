import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import '../database/train_route_database.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';

class DevTrainRouteRepository implements TrainRouteRepository {

  final TrainRouteDatabaseHelper _trainRouteDatabaseHelper = TrainRouteDatabaseHelper.instance;

  @override
  Future<TrainRouteInfo> getTrainRouteInfo(
      TrainLogoDetectionResult trainLogoDetectionResult) async {
    final trainLineLabel = trainLogoDetectionResult.detectedLine;
    if (trainLineLabel == null) {
      throw ArgumentError('TrainLineLabel must not be null');
    }

    // ラベルIDから路線情報を取得
    final trainLineId = TrainLineLabelMapper.getLineId(trainLineLabel);
    final trainLine = await _trainRouteDatabaseHelper.getLine(trainLineId);
    if (trainLine == null) {
      throw StateError('No train line found for ID $trainLineId');
    }

    // 路線情報から駅情報を一括で取得
    final stations = await _trainRouteDatabaseHelper.getStations(trainLine.id!);
    if (stations.isEmpty) {
      throw StateError('No stations found for line ID ${trainLine.id}');
    }

    // 各駅情報に接続路線をマッピング
    final stationList = await Future.wait(stations.map((station) async {
      final connectedLines = await _trainRouteDatabaseHelper.getConnection(
          station.id!, trainLine.id!);

      return Station(
        id: station.id!,
        lineId: station.lineId,
        name: station.name,
        stationNumber: station.stationNumber,
        connectedLines: connectedLines
            .map((line) => TrainLine(
                  id: line.id!,
                  name: line.name,
                  label: TrainLineLabelMapper.fromLineId(line.id!),
                  color: line.color,
                ))
            .toList(),
        iconUrl: station.iconUrl,
      );
    }));

    // 路線情報を返す
    return TrainRouteInfo(
      line: TrainLine(
        id: trainLine.id!,
        name: trainLine.name,
        label: TrainLineLabelMapper.fromLineId(trainLine.id!),
        color: trainLine.color,
      ),
      stations: stationList,
      currentStation: null,
    );
  }
}
