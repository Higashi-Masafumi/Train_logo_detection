import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:logging/logging.dart';

// UseCase: DetectionResultsから指定されたStationが含まれるDetectionResultをフィルターする
class SearchStationUseCase {
  SearchStationUseCase({
    required TrainRouteRepository trainRouteRepository,
  }) : _trainRouteRepository = trainRouteRepository;

  final TrainRouteRepository _trainRouteRepository;
  List<TrainRouteInfoWithDetectionResult> _trainRouteInfos = [];

  static final _logger = Logger('SearchStationUseCase');

  // DetectionResultsから指定されたStationが含まれるDetectionResultをフィルターする
  Future<List<TrainRouteInfoWithDetectionResult>> searchStation(
    List<DetectionResult> detectionResults,
    Station station,
  ) async {
    final trainRouteInfos = <TrainRouteInfoWithDetectionResult>[];
    for (final detectionResult in detectionResults) {
      // 検出ラベルに対応するラベルを取得
      final detectedLine = TrainLineLabel.fromString(detectionResult.label);
      // 検出ラベルに対応する路線情報を取得
      final trainLogoDetctionResult = TrainLogoDetectionResult(
        detectionResult: detectionResult,
        detectedLine: detectedLine,
      );
      final trainRouteInfo = await _trainRouteRepository.getTrainRouteInfo(
        trainLogoDetctionResult,
      );
      _logger.fine('trainRouteInfo: $trainRouteInfo');
      // 検出ラベルに対応する路線情報に指定されたStationが含まれるかを判定
      if (trainRouteInfo.stations.contains(station)) {
        trainRouteInfos.add(
          TrainRouteInfoWithDetectionResult(
            trainRouteInfo: trainRouteInfo,
            detectionResult: detectionResult,
          ),
        );
      }
    }
    _logger.fine('trainRouteInfos: $trainRouteInfos');
    _trainRouteInfos = trainRouteInfos;
    return trainRouteInfos;
  }
}