import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'dart:typed_data';

abstract class CropImageofDetectedObject {

  // 物体検出結果から画像を切り取る
  Future<DetectionResultWithImage> cropImage(DetectionResult detectionResult, Uint8List imageBinary);
}