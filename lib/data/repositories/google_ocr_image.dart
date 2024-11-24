import 'package:train_logo_detection_app/domain/models/detection_result/detection_result.dart';
import 'package:train_logo_detection_app/domain/repositories/ocr_image.dart';
import '../services/google_ml_text_recognition.dart';
import 'package:logging/logging.dart';

class GoogleOcrImage implements OcrCroppedImage {

  final GoogleMlTextRecognition _googleMlTextRecognition = GoogleMlTextRecognition();

  static final _logger = Logger('GoogleOcrImage');

  @override
  Future<DetectionResultWithText> ocrCroppedImage(DetectionResultWithImage detectionResultWithImage) async {
    final recognizedText = await _googleMlTextRecognition.recognizeTextfrombytes(
      image: detectionResultWithImage.croppedimage,
      width: detectionResultWithImage.detectionResult.boundingBox.width,
      height: detectionResultWithImage.detectionResult.boundingBox.height,
    );

    _logger.fine('recognizedText: $recognizedText');

    return DetectionResultWithText(
      detectionResultWithImage: detectionResultWithImage,
      detectedText: recognizedText,
    );
  }
}