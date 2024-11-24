import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';

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

  Future<String> recognizeTextfrombytes({
    required Uint8List image,
    required double width,
    required double height,
  }) async {
    if (!_isInitialized) {
      throw Exception("GoogleMlTextRecognition not initialized.");
    }

    try {
      // バイトデータをデコード
      final decodedImage = img.decodeImage(image);
      if (decodedImage == null) {
        throw Exception("Failed to decode image data");
      }

      // BGRA8888フォーマットに変換
      final convertedBytes = img.encodeBmp(decodedImage);
      
      final inputImage = InputImage.fromBytes(
        bytes: Uint8List.fromList(convertedBytes),
        metadata: InputImageMetadata(
          size: Size(width, height),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.bgra8888,  // フォーマットを変更
          bytesPerRow: width.toInt(),     // BGRAは1ピクセル4バイト
        ),
      );

      final recognizedText = await _textRecognizer.processImage(inputImage);
      return recognizedText.text;
    } catch (e) {
      debugPrint('Error during text recognition: $e');
      rethrow;
    }
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
