import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:ultralytics_yolo/yolo_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:train_logo_detection_app/utils/copy_file.dart';
import 'package:train_logo_detection_app/config/assets.dart';

class UltralyticsYoloModelService {

  // singleton
  static final UltralyticsYoloModelService _instance = UltralyticsYoloModelService._internal();

  factory UltralyticsYoloModelService() {
    return _instance;
  }

  // private constructor
  UltralyticsYoloModelService._internal();

  // private fields
  late LocalYoloModel _localYoloModel;
  late ObjectDetector _objectDetector;
  late Stream<List<DetectedObject?>?> _detectionResultStream;

  bool _isInitialized = false;
  bool _isObjectDetectorInitialized = false;

  // initialize the model
  Future<void> initialize({String? assetPath = Assets.yoloModel}) async {
    if (_isInitialized) {
      debugPrint("ObjectDetector already initialized.");
      return;
    }
    try {
      final appSupportDir = await getApplicationSupportDirectory();
      debugPrint("Application Support Directory: ${appSupportDir.path}");
      final modelPath = await copy(assetPath!);
      debugPrint("Model Path: $modelPath");
      _localYoloModel = LocalYoloModel(
        id: '',
        task: Task.detect,
        format: Format.coreml,
        modelPath: modelPath,
      );
      _isInitialized = true;
      debugPrint("ObjectDetector successfully initialized.");
    }  catch (e) {
      debugPrint("Error initializing ObjectDetector: $e");
      rethrow;
    }
  }

  // initialize object detector
  Future<void> initializeObjectDetector({bool? useGpu = true}) async {
    if (!_isInitialized) {
      throw Exception("Model not initialized.");
    }
    if (_isObjectDetectorInitialized) {
      debugPrint("ObjectDetector already initialized.");
      return;
    }
    _objectDetector = ObjectDetector(model: _localYoloModel);
    _objectDetector.loadModel(useGpu: useGpu!);
    _isObjectDetectorInitialized = true;
  }

  // getters
  LocalYoloModel get localYoloModel {
    if (!_isInitialized) {
      throw Exception("ObjectDetector not initialized.");
    }
    return _localYoloModel;
  }

  ObjectDetector get objectDetector {
    if (!_isObjectDetectorInitialized) {
      throw Exception("ObjectDetector not initialized.");
    }
    return _objectDetector;
  }

  Stream<List<DetectedObject?>?> get detectionResultStream {
    if (!_isObjectDetectorInitialized) {
      throw Exception("ObjectDetector not initialized.");
    }
    _detectionResultStream = _objectDetector.detectionResultStream;
    return _objectDetector.detectionResultStream;
  }

  // dispose
  void dispose() {
    _isInitialized = false;
    _isObjectDetectorInitialized = false;
  }
}