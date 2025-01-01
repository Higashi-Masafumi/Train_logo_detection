import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:train_logo_detection_app/data/services/yolo_camera.dart';
import 'package:train_logo_detection_app/data/services/yolo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:train_logo_detection_app/data/repositories/image_crop_image.dart';
import 'package:train_logo_detection_app/data/repositories/google_ocr_image.dart';
import 'package:train_logo_detection_app/data/repositories/dev_train_route_repository.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/usecase/verify_detected_object.dart';
import 'package:train_logo_detection_app/domain/usecase/search_station.dart';

final realtimeDetectionViewmodelProvider =
    ChangeNotifierProvider((ref) => RealtimeDetectionViewmodel());

@riverpod
class RealtimeDetectionViewmodel extends ChangeNotifier {
  final UltralyticsYoloModelService _ultralyticsYoloModelService =
      UltralyticsYoloModelService();

  final YoloCameraService _yoloCameraService = YoloCameraService();

  final VerifyDetectedObjectUseCase _verifyDetectedObjectUseCase =
      VerifyDetectedObjectUseCase(
          cropImageofDetectedObject: ImageCropImage(),
          ocrCroppedImage: GoogleOcrImage());
  final SearchStationUseCase _searchStationUseCase =
      SearchStationUseCase(trainRouteRepository: DevTrainRouteRepository());

  // 現在の画面上での検出オブジェクト
  List<DetectedObject?>? _detections;
  // 画面で選択された検出オブジェクト
  DetectionResult? _selectedDetection;
  // 検出されたロゴの検証結果
  TrainLogoDetectionResult? _trainLogoDetectionResult;
  // 検出中かどうか
  bool _isDetecting = false;
  // 検索候補の駅リスト
  List<Station> _searchStationList = [];
  // 検索対象の駅
  Station? _searchStation;
  // 検索中かどうか
  bool _isSearching = false;

  Future<void> initialize() async {
    try {
      await _ultralyticsYoloModelService.initialize();
      await _ultralyticsYoloModelService.initializeObjectDetector();
      _yoloCameraService.initialize();
      _searchStationList = await DevTrainRouteRepository().getAllStations();
    } catch (e) {
      throw Exception('Failed to initialize: $e');
    }
  }

  // get the current camera controller
  UltralyticsYoloCameraController get ultralyticsYoloCameraController {
    return _yoloCameraService.ultralyticsYoloCameraController;
  }

  // get the current predictor
  Predictor? get predictor => _ultralyticsYoloModelService.objectDetector;

  // get the object detector
  ObjectDetector? get objectDetector =>
      _ultralyticsYoloModelService.objectDetector;

  Stream<List<DetectedObject?>?> get detectedObjectStream {
    // add listener to the detection result stream
    _ultralyticsYoloModelService.detectionResultStream.listen((detections) {
      _detections = detections;
      notifyListeners();
    });
    // get the detection result stream
    return _ultralyticsYoloModelService.detectionResultStream;
  }

  // get detections
  List<DetectedObject>? get detections =>
      _detections?.whereType<DetectedObject>().toList();

  // get the search station list
  List<Station> get searchStationList => _searchStationList;

  // get is searching
  bool get isSearching => _isSearching;

  // filter station list by search word
  List<Station> filterStationList(String searchWord) {
    _searchStationList = _searchStationList
        .where((station) => station.name.contains(searchWord))
        .toList();
    notifyListeners();
    return _searchStationList;
  }

  // set the search station
  void setSearchStation(Station station) {
    _searchStation = station;
    notifyListeners();
  }

  void setSearching(bool isSearching) {
    _isSearching = isSearching;
    notifyListeners();
  }

  // search the train route info by search station
  Future<void> searchTrainRouteInfo() async {
    try {
      _isSearching = true;
      notifyListeners();
      final trainRouteInfoWithDetectionResult =
          await _searchStationUseCase.searchStation(
        _detections?.map((detection) {
              return DetectionResult(
                label: detection!.label,
                confidence: detection.confidence,
                boundingBox: detection.boundingBox,
              );
            }).toList() ??
            [],
        _searchStation!,
      );
      // set filterd detection result to detections
      _detections = trainRouteInfoWithDetectionResult
          .map((e) => DetectedObject(
                label: e.detectionResult.label,
                confidence: e.detectionResult.confidence,
                boundingBox: e.detectionResult.boundingBox,
                index: 0,
              ))
          .toList();
      notifyListeners();
      debugPrint(
          'trainRouteInfoWithDetectionResult: $trainRouteInfoWithDetectionResult');
    } catch (e) {
      throw Exception('Failed to get train route info: $e');
    }
  }

  // clear the search station
  Future<void> clearSearchStation() async {
    _searchStation = null;
    _searchStationList = await DevTrainRouteRepository().getAllStations();
    notifyListeners();
  }

  // start the camera
  Future<void> startCamera() async {
    try {
      await _yoloCameraService.ultralyticsYoloCameraController.startCamera();
    } catch (e) {
      throw Exception('Failed to start camera: $e');
    }
  }

  // stop the camera
  Future<void> stopCamera() async {
    try {
      await _yoloCameraService.ultralyticsYoloCameraController.closeCamera();
    } catch (e) {
      throw Exception('Failed to stop camera: $e');
    }
  }

  // pause prediction
  Future<void> pausePrediction() async {
    try {
      await _yoloCameraService.ultralyticsYoloCameraController
          .pauseLivePrediction();
    } catch (e) {
      throw Exception('Failed to pause prediction: $e');
    }
  }

  // search the detected object

  // set the selected detection
  void _setSelectedDetection(DetectedObject detectedObject) {
    _selectedDetection = DetectionResult(
      label: detectedObject.label,
      confidence: detectedObject.confidence,
      boundingBox: detectedObject.boundingBox,
    );
    notifyListeners();
  }

  // get the selected detection
  DetectionResult? get selectedDetection => _selectedDetection;

  // verify the detected object
  Future<void> verifyDetectedObject(DetectedObject detectedObject) async {
    _setSelectedDetection(detectedObject);
    _isDetecting = true;
    notifyListeners();
    final currentImage = await _yoloCameraService
        .ultralyticsYoloCameraController
        .getCameraImage();

    if (currentImage == null) {
      throw Exception('Failed to get camera image.');
    }

    try {
      final result = await _verifyDetectedObjectUseCase.verifyDetectedObject(
          currentImage, _selectedDetection!);
      _trainLogoDetectionResult = result;
    } catch (e) {
      throw Exception('Failed to verify detected object: $e');
    }
    _isDetecting = false;
    notifyListeners();
  }

  // clear the train logo detection result
  void clearTrainLogoDetectionResult() {
    _trainLogoDetectionResult = null;
    notifyListeners();
  }

  // get the train logo detection result
  TrainLogoDetectionResult? get trainLogoDetectionResult =>
      _trainLogoDetectionResult;

  // get the detecting status
  bool get isDetecting => _isDetecting;

  // dispose
  @override
  void dispose() {
    _ultralyticsYoloModelService.dispose();
    _yoloCameraService.dispose();
    super.dispose();
  }
}
