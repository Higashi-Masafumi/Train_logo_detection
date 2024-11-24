import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../services/yolo_model.dart';
import 'package:train_logo_detection_app/domain/repositories/detect_object.dart';
import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'dart:typed_data';

class YoloDetectObject implements DetectObject {
  final UltralyticsYoloModelService _ultralyticsYoloModelService =
      UltralyticsYoloModelService();

  @override
  Future<List<DetectionResult>> detectObject(String imagePath) async {
    final detections = await _ultralyticsYoloModelService.objectDetector
        .detect(imagePath: imagePath)
        .catchError((e) {
      throw Exception("Error detecting object: $e");
    });
    if (detections == null || detections.isEmpty) {
      return [];
    }
    return detections.map((detection) {
      return DetectionResult(
        label: detection?.label ?? '',
        confidence: detection?.confidence ?? 0.0,
        boundingBox: detection?.boundingBox ?? Rect.zero,
      );
    }).toList();
  }

  @override
  Future<List<DetectionResult>> detectObjectFromBinary(
      Uint8List imageBinary) async {
    final appSupportDir = await getApplicationSupportDirectory();
    final imagePath = '${appSupportDir.path}/image.jpg';
    final imageFile = File(imagePath);
    await imageFile.writeAsBytes(imageBinary);
    return detectObject(imagePath);
  }
}
