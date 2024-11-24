import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'dart:typed_data';
import 'package:train_logo_detection_app/config/train_logo.dart';

part 'train_logo_detection.freezed.dart';

@freezed
class TrainLogoDetectionResult with _$TrainLogoDetectionResult {
  const factory TrainLogoDetectionResult({
    required DetectionResult detectionResult,
    Uint8List? croppedimage,
    TrainLineLabel? detectedLine,
  }) = _TrainLogoDetectionResult;
}
