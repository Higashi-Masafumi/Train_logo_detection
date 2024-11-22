import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/repositories/ocr_image.dart';
import '../services/google_ml_text_recognition.dart';

class GoogleOcrImage implements OcrCroppedImage {

  GoogleOcrImage({
    required GoogleMlTextRecognition googleMlTextRecognition,
  }) : _googleMlTextRecognition = googleMlTextRecognition;

  final GoogleMlTextRecognition _googleMlTextRecognition;

  @override
  Future<DetectionResultWithText> ocrCroppedImage(DetectionResultWithImage detectionResultWithImage) async {
    final recognizedText = await _googleMlTextRecognition.recognizeTextfrombytes(
      image: detectionResultWithImage.croppedimage,
      width: detectionResultWithImage.detectionResult.boundingBox.width,
      height: detectionResultWithImage.detectionResult.boundingBox.height,
    );

    return DetectionResultWithText(
      detectionResultWithImage: detectionResultWithImage,
      detectedText: recognizedText,
    );
  }
}