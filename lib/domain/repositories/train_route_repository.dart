import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';

abstract class TrainRouteRepository {
  // detectionResultから路線情報を取得する
  Future<TrainLine> getTrainRouteInfo(TrainLogoDetectionResult result);

  // owlをもとに駅を取得する
  Future<Station> getStaion(String owlSameAs);

  // station_orderから駅のリストを取得する
  Future<List<Station>> getStations(List<String> stationOrder);

  // 駅IDから駅を取得する
  Future<List<Station>> getConnectingStations(
      Station station); // String stationId -> Station station
}
