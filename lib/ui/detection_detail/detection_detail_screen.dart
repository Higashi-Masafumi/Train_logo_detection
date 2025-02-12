import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/ui/detection_detail/detection_detail_viewmodel.dart';
import 'package:train_logo_detection_app/ui/core/train_logo.dart';
import 'package:train_logo_detection_app/ui/station_detail/station_detail_screen.dart';

class DetectionDetailScreen extends ConsumerStatefulWidget {
  const DetectionDetailScreen({super.key});

  @override
  ConsumerState<DetectionDetailScreen> createState() =>
      _DetectionDetailScreenState();
}

class _DetectionDetailScreenState extends ConsumerState<DetectionDetailScreen> {
  // 駅番号から路線記号を除いた数字部分のみを取得するヘルパーメソッド
  String _getStationNumberOnly(String stationCode, String lineCode) {
    // 正規表現を使用して数字部分を抽出
    final numberMatch = RegExp(r'\d+').firstMatch(stationCode);
    return numberMatch?.group(0) ?? '';
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // 路線アイコン
                    TrainLineLogo(
                      circleColor: trainColor,
                      text: trainRouteInfo.line.lineCode,
                      size: 60,
                    ),
                    const SizedBox(width: 16),
                    // 路線名
                    Expanded(
                      child: Column(
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
                    ),
                  ],
                ),
                // 運行情報
                if (trainRouteInfo.currentStatus.trainStatusText['ja'] != null) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      trainRouteInfo.currentStatus.trainStatusText['ja'] ?? '',
                      style: TextStyle(
                        color: trainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
                    circleColor: trainColor,
                    text: trainRouteInfo.line.lineCode,
                    subText: _getStationNumberOnly(
                        station.stationCode, trainRouteInfo.line.lineCode),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StationDetailScreen(
                          station: station,
                          line: trainRouteInfo.line,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
