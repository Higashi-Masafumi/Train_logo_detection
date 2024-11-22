import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';

abstract class OcrCroppedImage {

  // 画像からOCRを行う
  Future<DetectionResultWithText> ocrCroppedImage(DetectionResultWithImage detectionResultWithImage);
}