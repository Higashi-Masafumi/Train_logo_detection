import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:train_logo_detection_app/data/services/yolo_camera.dart';
import 'package:train_logo_detection_app/data/services/yolo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:train_logo_detection_app/data/repositories/image_crop_image.dart';
import 'package:train_logo_detection_app/data/repositories/google_ocr_image.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/usecase/verify_detected_object.dart';

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

  // 画面で選択された検出オブジェクト
  DetectionResult? _selectedDetection;
  TrainLogoDetectionResult? _trainLogoDetectionResult;
  bool _isDetecting = false;

  Future<void> initialize() async {
    try {
      await _ultralyticsYoloModelService.initialize();
      await _ultralyticsYoloModelService.initializeObjectDetector();
      _yoloCameraService.initialize();
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

  @override
  void dispose() {
    _ultralyticsYoloModelService.dispose();
    _yoloCameraService.dispose();
    super.dispose();
  }
}
