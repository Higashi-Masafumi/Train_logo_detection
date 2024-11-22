import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'dart:typed_data';

abstract class DetectObject {

  // 画像パスから物体検出を行う
  Future<List<DetectionResult>> detectObject(String imagePath);

  // 画像バイナリから物体検出を行う
  Future<List<DetectionResult>> detectObjectFromBinary(Uint8List imageBinary);
}