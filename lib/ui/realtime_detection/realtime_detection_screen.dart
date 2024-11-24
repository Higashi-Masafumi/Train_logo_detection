import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import './realtime_detection_viewmodel.dart';
import 'package:train_logo_detection_app/ui/core/detection_dialog.dart';
import 'dart:ui' as ui;

class RealtimeDetectionScreen extends ConsumerStatefulWidget {
  const RealtimeDetectionScreen({super.key});

  @override
  ConsumerState<RealtimeDetectionScreen> createState() =>
      _RealtimeDetectionScreenState();
}

class _RealtimeDetectionScreenState
    extends ConsumerState<RealtimeDetectionScreen> {
  @override
  void initState() {
    super.initState();
    // ViewModelの初期化
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(realtimeDetectionViewmodelProvider).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(realtimeDetectionViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('リアルタイムメトロ検出'),
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            // モデルの再読み込み
            onPressed: () {
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // カメラプレビューと物体検出
          UltralyticsYoloCameraPreview(
            predictor: viewModel.predictor,
            controller: viewModel.ultralyticsYoloCameraController,
            onCameraCreated: () async {
              await viewModel.startCamera();
            },
          ),

          // 検出結果の表示
          StreamBuilder<List<DetectedObject>?>(
            stream: viewModel.objectDetector?.detectionResultStream.map((list) {
              if (list == null) return null;
              return list.whereType<DetectedObject>().toList();
            }),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();

              final detections = snapshot.data!;
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapUp: (TapUpDetails details) {
                  // detectionsのboundingBoxとタップ位置の比較
                  debugPrint('detections: $detections');
                  debugPrint('details: ${details.localPosition}');
                  try {
                    final detection = detections.firstWhere((detection) {
                      return detection.boundingBox
                          .contains(details.localPosition);
                    });
                    viewModel.verifyDetectedObject(detection);
                  } catch (e) {
                    debugPrint('No detection found at the tap location');
                  }
                },
                child: SizedBox.expand(
                  child: CustomPaint(
                    painter: DetectionPainter(
                      detections,
                    ),
                  ),
                ),
              );
            },
          ),

          // 処理中のインジケーター
          if (viewModel.isDetecting)
            const Center(
              child: CircularProgressIndicator(),
            ),

          // 検出結果の詳細表示
          if (viewModel.trainLogoDetectionResult != null)
            DetectionResultDialog(
              result: viewModel.trainLogoDetectionResult!,
              onViewRouteInfo: () async {
                // 路線情報画面へ遷移
                await Navigator.of(context).pushNamed('/train_route_info');
                if (mounted) {
                  // 検出結果をクリア
                  viewModel.clearTrainLogoDetectionResult();
                }
              },
              onDismiss: () {
                // 検出結果をクリア
                viewModel.clearTrainLogoDetectionResult();
              },
            ),
        ],
      ),
    );
  }
}

// // 検出された物体を囲むボックスを表示するウィジェット
// class DetectionBox extends StatelessWidget {
//   final DetectedObject detection;
//   final VoidCallback onTap;
//   final List<Color>? colors;
//   final double strokeWidth;

//   const DetectionBox({
//     super.key,
//     required this.detection,
//     required this.onTap,
//     this.colors,
//     this.strokeWidth = 2.5,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colors = this.colors ?? Colors.primaries;
//     final index = detection.index % colors.length;
//     final color = colors[index];
//     final opacity = (detection.confidence - 0.2) / (1.0 - 0.2) * 0.9;

//     return Positioned(
//       left: detection.boundingBox.left,
//       top: detection.boundingBox.top,
//       width: detection.boundingBox.width,
//       height: detection.boundingBox.height,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Stack(
//           children: [
//             // 境界ボックス
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: color.withOpacity(opacity),
//                   width: strokeWidth,
//                 ),
//               ),
//             ),
//             // ラベルとconfidence
//             Positioned(
//               left: 0,
//               top: 0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(opacity),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     bottomRight: Radius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   '${detection.label} ${(detection.confidence * 100).toStringAsFixed(1)}%',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
