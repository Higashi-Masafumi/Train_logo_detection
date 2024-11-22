import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

part 'detection_result.freezed.dart';

@freezed
class DetectionResult with _$DetectionResult {
  const factory DetectionResult({
    required String label,
    required double confidence,
    required Rect boundingBox,
  }) = _DetectionResult;
}

@freezed
class DetectionResultWithImage with _$DetectionResultWithImage {
  const factory DetectionResultWithImage({
    required DetectionResult detectionResult,
    required Uint8List croppedimage,
  }) = _DetectionResultWithImage;
}

@freezed 
class DetectionResultWithText with _$DetectionResultWithText {
  const factory DetectionResultWithText({
    required DetectionResultWithImage detectionResultWithImage,
    required String detectedText,
  }) = _DetectionResultWithText;
}