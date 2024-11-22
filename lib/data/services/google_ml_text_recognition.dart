import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/services.dart';

class GoogleMlTextRecognition {
  // singleton instance
  static final GoogleMlTextRecognition _instance =
      GoogleMlTextRecognition._internal();

  factory GoogleMlTextRecognition() {
    return _instance;
  }

  // private constructor
  GoogleMlTextRecognition._internal();

  // private fields
  late TextRecognizer _textRecognizer;

  bool _isInitialized = false;

  // initialize the text recognizer
  void initialize(
      {TextRecognitionScript script = TextRecognitionScript.latin}) {
    _textRecognizer = TextRecognizer(script: script);
    _isInitialized = true;
  }

  Future<String> recognizeTextfrombytes(
      {required Uint8List image,
      required double width,
      required double height}) async {
    if (!_isInitialized) {
      throw Exception("GoogleMlTextRecognition not initialized.");
    }
    final InputImage inputImage = InputImage.fromBytes(
        bytes: image,
        metadata: InputImageMetadata(
            size: Size(width, height),
            rotation: InputImageRotation.rotation0deg,
            format: InputImageFormat.nv21,
            bytesPerRow: width.toInt()));
    final recognizedText = await _textRecognizer.processImage(inputImage);
    return recognizedText.text;
  }

  Future<String> recognizeTextfromPath(String imagePath) async {
    if (!_isInitialized) {
      throw Exception("GoogleMlTextRecognition not initialized.");
    }
    final InputImage inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await _textRecognizer.processImage(inputImage);
    return recognizedText.text;
  }

  // dispose the text recognizer
  void dispose() {
    _textRecognizer.close();
  }
}
