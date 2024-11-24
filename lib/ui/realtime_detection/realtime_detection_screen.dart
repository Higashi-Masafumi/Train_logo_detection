import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import './realtime_detection_viewmodel.dart';
import 'package:train_logo_detection_app/ui/core/detection_dialog.dart';

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
        title: const Text('リアルタイム検出'),
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
            stream:
                viewModel.objectDetector?.detectionResultStream.map((list) {
              if (list == null) return null;
              return list.whereType<DetectedObject>().toList();
            }),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();

              final detections = snapshot.data!;
              return Stack(
                children: detections.map((detection) {
                  return DetectionBox(
                    key: 
                    detection: detection,
                    onTap: () => viewModel.verifyDetectedObject(detection),
                  );
                }).toList(),
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

// 検出された物体を囲むボックスを表示するウィジェット
class DetectionBox extends StatelessWidget {
  final DetectedObject detection;
  final VoidCallback onTap;
  final List<Color>? colors;
  final double strokeWidth;

  const DetectionBox({
    required Key key,
    required this.detection,
    required this.onTap,
    this.colors,
    this.strokeWidth = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = this.colors ?? Colors.primaries;
    final index = detection.index % colors.length;
    final color = colors[index];
    final opacity = (detection.confidence - 0.2) / (1.0 - 0.2) * 0.9;

    return Positioned(
      left: detection.boundingBox.left,
      top: detection.boundingBox.top,
      width: detection.boundingBox.width,
      height: detection.boundingBox.height,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            // 境界ボックス
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: color.withOpacity(opacity),
                  width: strokeWidth,
                ),
              ),
            ),
            // ラベルとconfidence
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(opacity),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  '${detection.label} ${(detection.confidence * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
