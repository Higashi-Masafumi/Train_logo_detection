import 'dart:async';
import 'package:camera/camera.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';

class ExtendedYoloCameraController extends UltralyticsYoloCameraController {
  final _frameStreamController = StreamController<CameraImage>.broadcast();

  Stream<CameraImage> get frameStream => _frameStreamController.stream;

  ExtendedYoloCameraController() : super();


}

