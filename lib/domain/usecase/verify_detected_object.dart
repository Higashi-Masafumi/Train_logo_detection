import 'package:logging/logging.dart';
import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/repositories/crop_image.dart';
import 'package:train_logo_detection_app/domain/repositories/ocr_image.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:flutter/foundation.dart';

// UseCase: 物体検出から、路線情報を取得する
class VerifyDetectedObjectUseCase {
  VerifyDetectedObjectUseCase({
    required CropImageofDetectedObject cropImageofDetectedObject,
    required OcrCroppedImage ocrCroppedImage,
  })  : _cropImageofDetectedObject = cropImageofDetectedObject,
        _ocrCroppedImage = ocrCroppedImage;

  final CropImageofDetectedObject _cropImageofDetectedObject;
  final OcrCroppedImage _ocrCroppedImage;

  static final _logger = Logger('VerifyDetectedObjectUseCase');

  // 物体検出から、路線情報を取得する
  Future<TrainLogoDetectionResult> verifyDetectedObject(
      Uint8List imageBinary, DetectionResult detectionResult) async {
    // 物体検出結果と画像をもとに、物体画像を切り取る
    final detectionResultWithImage = await _cropImageofDetectedObject.cropImage(
        detectionResult, imageBinary);
    // 物体画像をもとにOCRを行い、そこに検出ラベルに対応する文字列が含まれているかを判定する
    final detectionResultWithText =
        await _ocrCroppedImage.ocrCroppedImage(detectionResultWithImage);
    // 検出ラベルに対応する文字列が含まれている場合、検出ラベルを返す
    final detectedLine =
        TrainLineLabel.fromString(detectionResult.label); // 検出ラベル
    _logger.log(Level.INFO, 'detectedLine: $detectedLine');
    final detectedText = detectionResultWithText.detectedText; // OCR結果
    _logger.log(Level.INFO, 'detectedText: $detectedText');
    debugPrint('detectedLine: $detectedLine');
    debugPrint('detectedText: $detectedText');
    if (detectedText.contains(TrainLineLabelMapper.getLogoText(detectedLine))) {
      return TrainLogoDetectionResult(
        detectionResult: detectionResult,
        croppedimage: detectionResultWithImage.croppedimage,
        detectedLine: detectedLine,
      );
    } else {
      return TrainLogoDetectionResult(
        detectionResult: detectionResult,
        croppedimage: detectionResultWithImage.croppedimage,
        detectedLine: detectedLine
      );
    }
  }
}
