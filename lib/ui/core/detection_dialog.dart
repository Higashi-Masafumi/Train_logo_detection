import 'package:flutter/material.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:train_logo_detection_app/ui/core/train_logo.dart';

class DetectionResultDialog extends StatelessWidget {
  final TrainLogoDetectionResult result;
  final VoidCallback onViewRouteInfo;
  final VoidCallback onDismiss;

  const DetectionResultDialog({
    super.key,
    required this.result,
    required this.onViewRouteInfo,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '検出結果',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (result.croppedimage != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 検出画像
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      result.croppedimage!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // 路線記号アイコン
                  if (result.detectedLine != null)
                    TrainLineLogo(
                      circleColor: TrainLineLabelMapper.getLineColor(
                          result.detectedLine!),
                      text: TrainLineLabelMapper.getLogoText(
                          result.detectedLine!),
                      size: 60,
                    ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            if (result.detectedLine != null)
              Text(
                '対応路線: ${TrainLineLabelMapper.getLineNameJapanese(result.detectedLine!)}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onViewRouteInfo,
                  child: const Text('路線情報を見る'),
                ),
                OutlinedButton(
                  onPressed: onDismiss,
                  child: const Text('閉じる'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
