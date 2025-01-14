import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/location_repository.dart';

class GetTrainRouteInfoUseCase {
  final TrainRouteRepository _trainRouteRepository;
  final LocationRepository _locationRepository;

  // 最寄駅と判定する最大距離（メートル）
  static const double _maxDistanceMeters = 1000.0;

  GetTrainRouteInfoUseCase(
      this._trainRouteRepository, this._locationRepository);

  Future<TrainRouteInfo> execute(TrainLogoDetectionResult result) async {
    /// 検出結果をもとに路線情報を取得するユースケース
    // 1.検出結果から路線情報を取得
    final trainLine = await _trainRouteRepository.getTrainRouteInfo(result);
    // 2.路線情報から駅情報を取得
    final stations =
        await _trainRouteRepository.getStations(trainLine.stationOrder);
    // 3. 駅情報から最も近くある程度の距離にある駅を取得する
    final currentLocation = await _locationRepository.getCurrentLocation();
    Station? nearestStation;
    double minDistance = double.infinity;
    if (currentLocation != null) {
      for (final station in stations) {
        final distance = await _locationRepository.getDistanceToStation(
          station.latitude,
          station.longitude,
        );
        if (distance != null &&
            distance < minDistance &&
            distance <= _maxDistanceMeters) {
          minDistance = distance;
          nearestStation = station;
        }
      }
    }
    return TrainRouteInfo(
      line: trainLine,
      stations: stations,
      currentStation: nearestStation,
    );
  }
}
