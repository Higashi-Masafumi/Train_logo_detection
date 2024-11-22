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
}
