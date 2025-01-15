import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/ui/core/train_logo.dart';
import 'package:train_logo_detection_app/ui/station_detail/station_detail_viewmodel.dart';

class StationDetailScreen extends ConsumerStatefulWidget {
  final Station station;
  final TrainLine line;

  const StationDetailScreen({
    super.key,
    required this.station,
    required this.line,
  });

  @override
  ConsumerState<StationDetailScreen> createState() =>
      _StationDetailScreenState();
}

class _StationDetailScreenState extends ConsumerState<StationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.station.title),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 駅情報ヘッダー
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 駅名と駅番号
                  Row(
                    children: [
                      TrainLineLogo(
                        circleColor: Color(
                          int.parse(widget.line.color.replaceAll('#', '0xFF')),
                        ),
                        text: widget.station.stationCode,
                        size: 60,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.station.stationTitle['ja'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  widget.station.stationTitle['en'] ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                                if (widget.station.stationTitle['ko'] !=
                                    null) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 1,
                                    height: 16,
                                    color: Colors.grey[300],
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    textAlign: TextAlign.left,
                                    widget.station.stationTitle['ko'] ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 位置情報
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        ListTile(
                          leading: const Icon(Icons.map_outlined, size: 28),
                          title: const Text('地図で見る'),
                          subtitle: Text(
                              '${widget.station.stationTitle['ja']}の場所を確認'),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          onTap: () => ref
                              .read(stationDetailViewModelProvider(
                                  (widget.station, widget.line)).notifier)
                              .openMap(),
                        ),
                        // エラー表示
                        ref
                                .watch(stationDetailViewModelProvider(
                                    (widget.station, widget.line)))
                                .whenOrNull(
                                  error: (error, _) => Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      'エラー: $error',
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ) ??
                            const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 乗換路線情報
            if (widget.station.connectingLines?.isNotEmpty ?? false) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '乗換路線',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.station.connectingLines!.length,
                itemBuilder: (context, index) {
                  final line = widget.station.connectingLines![index];
                  return ListTile(
                    leading: TrainLineLogo(
                      circleColor: Color(
                        int.parse(line.color.replaceAll('#', '0xFF')),
                      ),
                      text: line.lineCode,
                      size: 30,
                    ),
                    title: Text(line.title),
                    subtitle: Text(line.lineTitle['en'] ?? ''),
                  );
                },
              ),
            ],

            // // 時刻表情報があれば表示
            // if (widget.station.stationTimetable?.isNotEmpty ?? false) ...[
            //   const Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Text(
            //       '時刻表情報',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     child: Text(widget.station.stationTimetable!.join('\n')),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}
