import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:train_logo_detection_app/data/services/yolo_camera.dart';
import 'package:train_logo_detection_app/data/services/yolo_model.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/data/repositories/dev_train_route_repository.dart';
import 'package:train_logo_detection_app/domain/usecase/detect_object_from_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final detectionSearchViewmodelProvider =
    ChangeNotifierProvider((ref) => DetectionSearchViewmodel(ref));

@riverpod
class DetectionSearchViewmodel extends ChangeNotifier {
  DetectionSearchViewmodel(this.ref);
  final Ref ref;
  final YoloCameraService _yoloCameraService = YoloCameraService();
  final UltralyticsYoloModelService _ultralyticsYoloModelService =
      UltralyticsYoloModelService();
  final SearchTrainRouteInfoUseCase _searchTrainRouteInfoUseCase =
      SearchTrainRouteInfoUseCase(
          trainRouteRepository: DevTrainRouteRepository());

  bool _isDetecting = false;
  List<DetectedObject?>? _detectedObject = [];
  List<DetectionResult> _detectionResults = [];
  List<TrainRouteInfoWithDetectionResult> _trainRouteInfoWithDetectionResult =
      [];
  List<String> searchResults = [];
  String? selectedStation;


  Future<void> initialize() async {
    try {
      await _ultralyticsYoloModelService.initialize();
      await _ultralyticsYoloModelService.initializeObjectDetector();
      _yoloCameraService.initialize();
    } catch (e) {
      throw Exception('Failed to initialize: $e');
    }
  }

  UltralyticsYoloCameraController get ultralyticsYoloCameraController {
    return _yoloCameraService.ultralyticsYoloCameraController;
  }

  Predictor? get predictor => _ultralyticsYoloModelService.objectDetector;

  ObjectDetector? get objectDetector =>
      _ultralyticsYoloModelService.objectDetector;

  Stream<List<DetectedObject?>?> get detectedObjectStream {
    return _ultralyticsYoloModelService.detectionResultStream;
  }

  Future<void> getTrainRouteInfo() async {
    try {
      final trainRouteInfoWithDetectionResult =
          await _searchTrainRouteInfoUseCase
              .getTrainRouteInfo(_detectionResults);
      _trainRouteInfoWithDetectionResult = trainRouteInfoWithDetectionResult;
      debugPrint(
          'trainRouteInfoWithDetectionResult: $trainRouteInfoWithDetectionResult');
    } catch (e) {
      throw Exception('Failed to get train route info: $e');
    }
  }

  // 検索ワードに一致する駅名リストを返す
  List<String> searchTrainRouteInfo(String searchWord) {
    final stations = <String>[];
    for (final trainRouteInfoWithDetectionResult
        in _trainRouteInfoWithDetectionResult) {
      final trainRouteInfo = trainRouteInfoWithDetectionResult.trainRouteInfo;
      for (final station in trainRouteInfo.stations) {
        if (station.name.contains(searchWord)) {
          stations.add(station.name);
        }
      }
    }
    searchResults = stations;
    return stations;
  }

  void setSelectedStation(String station) {
    selectedStation = station;
    notifyListeners();
  }

  Future<void> startCamera() async {
    try {
      await _yoloCameraService.ultralyticsYoloCameraController.startCamera();
      _isDetecting = true;
    } catch (e) {
      throw Exception('Failed to start camera: $e');
    }
  }

  Future<void> stopCamera() async {
    try {
      await _yoloCameraService.ultralyticsYoloCameraController.closeCamera();
      _isDetecting = false;
    } catch (e) {
      throw Exception('Failed to stop camera: $e');
    }
  }

  Future<void> pausePrediction() async {
    try {
      await _yoloCameraService.ultralyticsYoloCameraController
          .pauseLivePrediction();
      _isDetecting = false;
    } catch (e) {
      throw Exception('Failed to pause prediction: $e');
    }
  }
}
