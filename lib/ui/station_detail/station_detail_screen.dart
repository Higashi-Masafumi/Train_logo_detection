import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/train_timetable/train_timetable.dart';
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
  bool _isLoadingTimetable = false;
  bool _isFailedTimetable = false;
  Map<Station, StationTimetable>? _timetables;

  // 種別ごとの色を定義
  final _trainTypeColors = {
    'Local': Colors.grey[600],
    'Express': Colors.red[700],
    'SemiExpress': Colors.lightGreen[700],
    'Rapid': Colors.blue[700],
    'CommuteRapid': Colors.purple[700],
    'CommuteExpress': Colors.orange[700],
  };

  // 種別によって色とラベルを返すヘルパーメソッドを追加
  (Color, String) _getTrainTypeInfo(String trainTypeShort) {
    final color = _trainTypeColors[trainTypeShort] ?? Colors.grey[600]!;
    final label = switch (trainTypeShort) {
      'Local' => '各駅停車',
      'Express' => '急行',
      'SemiExpress' => '準急',
      'Rapid' => '快速',
      'CommuteRapid' => '通勤快速',
      'CommuteExpress' => '通勤急行',
      _ => '不明',
    };
    return (color, label);
  }

  // 駅番号から路線記号を除いた数字部分のみを取得するヘルパーメソッド
  String _getStationNumberOnly(String stationCode, String lineCode) {
    // 正規表現を使用して数字部分を抽出
    final numberMatch = RegExp(r'\d+').firstMatch(stationCode);
    return numberMatch?.group(0) ?? '';
  }

  @override
  void initState() {
    super.initState();
    _fetchTimetables();
  }

  /// ViewModel から時刻表を取得して、ローカルステートに反映
  Future<void> _fetchTimetables() async {
    setState(() {
      _isLoadingTimetable = true; // ロード開始
      _isFailedTimetable = false; // 前回の失敗フラグをクリア
    });

    try {
      final viewModel = ref.read(
        stationDetailViewModelProvider((widget.station, widget.line)).notifier,
      );
      final fetchedTimetables = await viewModel.fetchStationTimetable();
      setState(() {
        _timetables = fetchedTimetables;
        _isLoadingTimetable = false; // ロード完了
      });
    } catch (e) {
      // ログ出力
      debugPrint('Error fetching timetables: $e');
      setState(() {
        _isLoadingTimetable = false;
        _isFailedTimetable = true; // 取得失敗
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 位置情報エラー等（openMap周り）に関しては既存の実装にお任せ
    final stationDetailState = ref.watch(
      stationDetailViewModelProvider((widget.station, widget.line)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.station.title),
            const Icon(Icons.train_outlined, color: Colors.white),
            const SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- 駅情報ヘッダー部分 ----
            _buildStationHeader(context, stationDetailState),

            // ---- 乗換路線情報 ----
            if (widget.station.connectingLines?.isNotEmpty ?? false)
              _buildConnectingLines(),

            // ---- 時刻表情報 ----
            _buildTimetableSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStationHeader(
      BuildContext context, AsyncValue<void> detailState) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 駅名と駅番号
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrainLineLogo(
                circleColor: Color(
                  int.parse(widget.line.color.replaceAll('#', '0xFF')),
                ),
                text: widget.line.lineCode,
                subText: _getStationNumberOnly(
                    widget.station.stationCode, widget.line.lineCode),
                size: 60,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.station.stationTitle['ja'] ?? '',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      children: [
                        Text(
                          widget.station.stationTitle['en'] ?? '',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        if (widget.station.stationTitle['ko'] != null) ...[
                          Container(
                            width: 1,
                            height: 16,
                            color: Colors.grey[300],
                          ),
                          Text(
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
          _buildMapListTile(detailState),
        ],
      ),
    );
  }

  /// 乗換路線情報
  Widget _buildConnectingLines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }

  /// 時刻表情報のセクション
  Widget _buildTimetableSection() {
    // 1. ローディング中
    if (_isLoadingTimetable) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    // 2. 取得失敗
    if (_isFailedTimetable) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          '時刻表を取得できませんでした。',
        ),
      );
    }
    // 3. まだ fetch処理が終わっていない (または null)
    if (_timetables == null) {
      return const SizedBox.shrink();
    }
    // 4. データは取得できたが中身が空
    if (_timetables!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('時刻表情報がありません'),
      );
    }

    // 5. 正常に取得できた場合の表示
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            '時刻表情報',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ..._timetables!.entries.map(
          (entry) {
            final station = entry.key;
            final timetable = entry.value;
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 方面名などの見出し
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_forward),
                        const SizedBox(width: 8),
                        // 駅のアイコンを追加
                        TrainLineLogo(
                          circleColor: Color(
                            int.parse(
                                widget.line.color.replaceAll('#', '0xFF')),
                          ),
                          text: widget.line.lineCode,
                          subText: _getStationNumberOnly(
                              station.stationCode, widget.line.lineCode),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${station.stationTitle['ja']}方面',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // timetableObjects のリスト表示
                  if (timetable.timetableObjects.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('対象の電車はありません'),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: timetable.timetableObjects.length,
                      itemBuilder: (context, index) {
                        final trainObj = timetable.timetableObjects[index];
                        // 種別を末尾の"Local"等で判断
                        final trainTypeShort = trainObj.trainType
                            .split('.')
                            .last; // "Local"とか"Express"等

                        final (color, label) =
                            _getTrainTypeInfo(trainTypeShort);

                        return ListTile(
                          leading: Icon(Icons.train, color: color),
                          title: Text('発車時刻: ${trainObj.departureTime}'),
                          subtitle: Text(label, style: TextStyle(color: color)),
                          trailing: Text(
                            // 目的駅が複数の場合は最初だけ表示など
                            trainObj.destinationStation.isNotEmpty
                                ? trainObj.destinationStation.first
                                    .split('.')
                                    .last
                                : '',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    ),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  /// 「地図で見る」ListTile
  Widget _buildMapListTile(AsyncValue<void> detailState) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.map_outlined, size: 28),
          title: const Text('地図で見る'),
          subtitle: Text('${widget.station.stationTitle['ja']}の場所を確認'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '地図アプリを選択',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...MapApp.values.map(
                      (app) => ListTile(
                        leading: switch (app) {
                          MapApp.google => const Icon(
                              Icons.g_mobiledata_rounded,
                              size: 28,
                            ),
                          MapApp.apple => const Icon(Icons.apple),
                          MapApp.web => const Icon(Icons.public),
                        },
                        title: Text(app.label),
                        onTap: () {
                          Navigator.pop(context);
                          ref
                              .read(stationDetailViewModelProvider(
                                (widget.station, widget.line),
                              ).notifier)
                              .openMap(mapApp: app);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        // ↓ 位置情報エラー時の SnackBar 表示を行う処理（既存の実装）
        detailState.whenOrNull(
              error: (error, _) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.toString()),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: '閉じる',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                });
                return const SizedBox.shrink();
              },
            ) ??
            const SizedBox.shrink(),
      ],
    );
  }
}
