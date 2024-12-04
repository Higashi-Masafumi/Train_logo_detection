import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';

/// A painter used to draw detections on the canvas.
class DetectionPainter extends CustomPainter {
  /// The list of detected objects to be drawn.
  final List<DetectedObject> detections;

  /// List of colors to differentiate between detections.
  final List<Color>? colors;

  /// The stroke width for the bounding boxes.
  final double strokeWidth;

  DetectionPainter(
    this.detections, {
    this.colors,
    this.strokeWidth = 2.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final textStyle = ui.TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      background: Paint()..color = Colors.black.withOpacity(0.5),
    );

    final colorsList = colors ?? Colors.primaries;

    for (final detection in detections) {
      // Ensure bounding box values are valid.
      if (detection.boundingBox.left.isNaN ||
          detection.boundingBox.top.isNaN ||
          detection.boundingBox.width.isNaN ||
          detection.boundingBox.height.isNaN) continue;

      // Determine the color for this detection.
      final index = detection.index % colorsList.length;
      final color = colorsList[index];
      final opacity = (detection.confidence - 0.2) / (1.0 - 0.2) * 0.9;

      // Draw the bounding box.
      paint.color = color.withOpacity(opacity);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          detection.boundingBox,
          const Radius.circular(8),
        ),
        paint,
      );

      // Draw the label and confidence.
      final textSpan = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.left,
          fontSize: 14.0,
          textDirection: TextDirection.ltr,
        ),
      )
        ..pushStyle(textStyle)
        ..addText(
          '${detection.label} ${(detection.confidence * 100).toStringAsFixed(1)}%',
        );
      final paragraph = textSpan.build();
      paragraph
          .layout(ui.ParagraphConstraints(width: detection.boundingBox.width));

      // Draw the label at the top of the bounding box.
      canvas.drawParagraph(paragraph,
          Offset(detection.boundingBox.left, detection.boundingBox.top - 20));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
