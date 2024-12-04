import 'package:camera/camera.dart';

class CameraService {
  // singleton instance
  static final CameraService _instance = CameraService._internal();

  factory CameraService() {
    return _instance;
  }

  // private constructor
  CameraService._internal();

  // private fields
  late CameraController _cameraController;

  bool _isInitialized = false;

  // initialize the camera controller
  Future<void> initialize() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await _cameraController.initialize();
    _isInitialized = true;
  }

  // stop the camera controller
  Future<void> stopCamera() async {
    if (!_isInitialized) {
      throw Exception("CameraService not initialized.");
    }
    await _cameraController.dispose();
  }

  // getters
  CameraController get cameraController {
    if (!_isInitialized) {
      throw Exception("CameraService not initialized.");
    }
    return _cameraController;
  }

  // dispose the camera controller
  void dispose() {
    _cameraController.dispose();
  }
}