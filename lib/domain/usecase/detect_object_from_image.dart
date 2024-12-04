import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:logging/logging.dart';

// UseCase: 物体検出から、路線情報を取得する
class SearchTrainRouteInfoUseCase {
  SearchTrainRouteInfoUseCase({
    required TrainRouteRepository trainRouteRepository,
  }) : _trainRouteRepository = trainRouteRepository;

  final TrainRouteRepository _trainRouteRepository;
  List<TrainRouteInfoWithDetectionResult> _trainRouteInfos = [];

  static final _logger = Logger('SearchTrainRouteInfoUseCase');

  // 物体検出から、路線情報を取得する
  Future<List<TrainRouteInfoWithDetectionResult>> getTrainRouteInfo(
    List<DetectionResult> detectionResults,
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
      trainRouteInfos.add(
        TrainRouteInfoWithDetectionResult(
          trainRouteInfo: trainRouteInfo,
          detectionResult: detectionResult,
        ),
      );
    }
    _logger.fine('trainRouteInfos: $trainRouteInfos');
    _trainRouteInfos = trainRouteInfos;
    return trainRouteInfos;
  }
}
