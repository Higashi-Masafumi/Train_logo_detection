import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/ui/detection_detail.dart/detection_detail_view_model.dart';
import 'package:train_logo_detection_app/ui/core/train_logo.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:train_logo_detection_app/ui/realtime_detection/realtime_detection_viewmodel.dart';


class DetectionDetailScreen extends ConsumerStatefulWidget {
  const DetectionDetailScreen({super.key});

  @override
  ConsumerState<DetectionDetailScreen> createState() => _DetectionDetailScreenState();
}

class _DetectionDetailScreenState extends ConsumerState<DetectionDetailScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(trainRouteViewModelProvider).fetchTrainRouteInfo(
        ref.read(realtimeDetectionViewmodelProvider).trainLogoDetectionResult!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(trainRouteViewModelProvider);
    final trainRouteInfo = viewModel.trainRouteInfo;
    final trainColor = trainRouteInfo?.line.color;

    if (trainRouteInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('路線情報'),
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          // 路線情報ヘッダー
          Container(
            padding: const EdgeInsets.all(16),
            color: trainColor,
            child: Row(
              children: [
                // 路線アイコン
                TrainLineLogo(
                  circleColor: trainColor ?? Colors.black,
                  text: TrainLineLabelMapper.getLogoText(trainRouteInfo.line.label),
                  size: 60,
                ),
                const SizedBox(width: 16),
                // 路線名
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TrainLineLabelMapper.getLineNameJapanese(trainRouteInfo.line.label),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      TrainLineLabelMapper.getLineNameEnglish(trainRouteInfo.line.label),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 駅リスト
          Expanded(
            child: ListView.builder(
              itemCount: trainRouteInfo.stations.length,
              itemBuilder: (context, index) {
                final station = trainRouteInfo.stations[index];
                return ListTile(
                  leading: TrainLineLogo(
                    circleColor: trainColor ?? Colors.black,
                    text: station.stationNumber,
                    size: 40,
                  ),
                  title: Text(station.name),
                  trailing: station.connectedLines != null && station.connectedLines!.isNotEmpty
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: station.connectedLines!.map((line) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TrainLineLogo(
                                circleColor: line.color,
                                text: TrainLineLabelMapper.getLogoText(line.label),
                                size: 24,
                              ),
                            );
                          }).toList(),
                        )
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}