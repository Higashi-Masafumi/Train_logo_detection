import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/ui/detection_detail.dart/detection_detail_view_model.dart';
import 'package:train_logo_detection_app/ui/core/train_logo.dart';

class DetectionDetailScreen extends ConsumerStatefulWidget {
  const DetectionDetailScreen({super.key});

  @override
  ConsumerState<DetectionDetailScreen> createState() =>
      _DetectionDetailScreenState();
}

class _DetectionDetailScreenState extends ConsumerState<DetectionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(trainRouteViewModelProvider);
    final trainRouteInfo = viewModel.trainRouteInfo;

    if (trainRouteInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // 路線カラーをHEXからColorに変換
    final trainColor =
        Color(int.parse(trainRouteInfo.line.color.replaceAll('#', '0xFF')));

    final currentStationCode = trainRouteInfo.currentStation?.stationCode;

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
                  circleColor: trainColor,
                  text: trainRouteInfo.line.lineCode,
                  size: 60,
                ),
                const SizedBox(width: 16),
                // 路線名
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainRouteInfo.line.lineTitle['ja'] ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      trainRouteInfo.line.lineTitle['en'] ?? '',
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
                final isCurrentStation =
                    (station.stationCode == currentStationCode);

                return ListTile(
                  // 最寄駅なら背景色を変更
                  tileColor:
                      isCurrentStation ? Colors.yellow.withOpacity(0.3) : null,
                  leading: TrainLineLogo(
                    // 最寄駅ならアイコンを少し強調しても良い
                    circleColor: isCurrentStation ? Colors.red : trainColor,
                    text: station.stationCode,
                    size: 40,
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(station.stationTitle['ja'] ?? ''),
                      ),
                      // 最寄駅なら駅名の後ろにアイコンをつける
                      if (isCurrentStation) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ],
                  ),
                  subtitle: Text(station.stationTitle['en'] ?? ''),
                  trailing: station.connectingLines != null &&
                          station.connectingLines!.isNotEmpty
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: station.connectingLines!.map((line) {
                            final lineColor = Color(
                              int.parse(line.color.replaceAll('#', '0xFF')),
                            );
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TrainLineLogo(
                                circleColor: lineColor,
                                text: line.lineCode,
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
