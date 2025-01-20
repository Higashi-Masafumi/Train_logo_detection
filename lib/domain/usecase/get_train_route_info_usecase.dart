import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/location_repository.dart';

class GetTrainRouteInfoUseCase {
  final TrainRouteRepository _trainRouteRepository;
  final LocationRepository _locationRepository;

  // 最寄駅と判定する最大距離（メートル）
  static const double _maxDistanceMeters = 500.0;

  GetTrainRouteInfoUseCase(
      this._trainRouteRepository, this._locationRepository);

  Future<TrainRouteInfo> execute(TrainLogoDetectionResult result) async {
    /// 検出結果をもとに路線情報を取得するユースケース
    // 1.検出結果から路線情報を取得
    final trainLine = await _trainRouteRepository.getTrainRouteInfo(result);
    // 2.路線情報から駅情報を取得
    final stations =
        await _trainRouteRepository.getStations(trainLine.stationOrder);

    // 3. 全ての駅との距離を計算し、ソートしてから最寄駅を決定
    final currentLocation = await _locationRepository.getCurrentLocation();
    Station? nearestStation;

    if (currentLocation != null) {
      // 全ての駅との距離を計算
      final stationsWithDistance = await Future.wait(
        stations.map((station) async {
          final distance = await _locationRepository.getDistanceToStation(
            station.latitude,
            station.longitude,
          );
          return (station, distance ?? double.infinity);
        }),
      );

      // 距離でソートして、最も近い駅を取得
      stationsWithDistance.sort((a, b) => a.$2.compareTo(b.$2));

      // 最大距離以内で最も近い駅を選択
      if (stationsWithDistance.isNotEmpty &&
          stationsWithDistance.first.$2 <= _maxDistanceMeters) {
        nearestStation = stationsWithDistance.first.$1;
      }
    }

    return TrainRouteInfo(
      line: trainLine,
      stations: stations,
      currentStation: nearestStation,
    );
  }
}
