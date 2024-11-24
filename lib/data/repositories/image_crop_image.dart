import 'dart:typed_data';
import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/repositories/crop_image.dart';
import '../services/image_service.dart';

class ImageCropImage implements CropImageofDetectedObject {
  final ImageService _imageService = ImageService();

  @override
  Future<DetectionResultWithImage> cropImage(
      DetectionResult detectionResult, Uint8List imageBinary) async {
    final croppedImage = _imageService.cropImage(
      imageBinary,
      detectionResult.boundingBox,
    );

    return DetectionResultWithImage(
      detectionResult: detectionResult,
      croppedimage: croppedImage,
    );
  }
}
