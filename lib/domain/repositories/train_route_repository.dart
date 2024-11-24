import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart'; 

abstract class TrainRouteRepository {

  // detectionResultから路線情報を取得する
  Future<TrainRouteInfo> getTrainRouteInfo(TrainLogoDetectionResult trainLogoDetectionResult);
}