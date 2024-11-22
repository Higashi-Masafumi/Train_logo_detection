import 'package:ultralytics_yolo/ultralytics_yolo.dart';

class YoloCameraService {
  // singleton instance
  static final YoloCameraService _instance = YoloCameraService._internal();

  factory YoloCameraService() {
    return _instance;
  }

  // private constructor
  YoloCameraService._internal();

  // private fields
  late UltralyticsYoloCameraController _ultralyticsYoloCameraController;

  bool _isInitialized = false;

  // initialize the camera controller
  void initialize() {
    _ultralyticsYoloCameraController = UltralyticsYoloCameraController();
    _isInitialized = true;
  }

  // getters
  UltralyticsYoloCameraController get ultralyticsYoloCameraController {
    if (!_isInitialized) {
      throw Exception("YoloCameraService not initialized.");
    }
    return _ultralyticsYoloCameraController;
  }

  // dispose the camera controller
  void dispose() {
    _ultralyticsYoloCameraController.dispose();
  }
}
