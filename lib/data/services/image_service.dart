import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'dart:ui';

class ImageService {
  // 画像から指定された範囲を切り取る
  Uint8List cropImage(Uint8List imageBinary, Rect boundingBox) {
    final image = img.decodeImage(imageBinary);
    if (image == null) {
      throw Exception('Failed to decode image');
    }

    final x = boundingBox.left.toInt();
    final y = boundingBox.top.toInt();
    final width = boundingBox.width.toInt();
    final height = boundingBox.height.toInt();

    final croppedImage = img.copyCrop(image, x: x, y: y, width: width, height: height);
    
    return Uint8List.fromList(img.encodeJpg(croppedImage));
  }

  // デバッグ用のビジュアライゼーション付きクロップ
  Uint8List cropImageWithDebug(Uint8List imageBinary, Rect boundingBox) {
    final image = img.decodeImage(imageBinary);
    if (image == null) {
      throw Exception('Failed to decode image');
    }

    // スケール係数の計算
    final scaleX = image.width / boundingBox.width;
    final scaleY = image.height / boundingBox.height;

    // 座標の変換
    final x = (boundingBox.left * scaleX).toInt().clamp(0, image.width);
    final y = (boundingBox.top * scaleY).toInt().clamp(0, image.height);
    final width = (boundingBox.width * scaleX).toInt().clamp(0, image.width - x);
    final height = (boundingBox.height * scaleY).toInt().clamp(0, image.height - y);

    // クロップ処理
    final croppedImage = img.copyCrop(
      image,
      x: x,
      y: y,
      width: width,
      height: height,
    );

    return Uint8List.fromList(img.encodeJpg(croppedImage));
  }
}
