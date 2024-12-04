import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import './realtime_detection_viewmodel.dart';
import 'package:train_logo_detection_app/ui/core/detection_dialog.dart';
import 'package:train_logo_detection_app/ui/core/detection_box.dart';

class RealtimeDetectionScreen extends ConsumerStatefulWidget {
  const RealtimeDetectionScreen({super.key});

  @override
  ConsumerState<RealtimeDetectionScreen> createState() =>
      _RealtimeDetectionScreenState();
}

class _RealtimeDetectionScreenState
    extends ConsumerState<RealtimeDetectionScreen> {
  late final TextEditingController _searchController;
  late final List<Station> stations;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final viewModel = ref.read(realtimeDetectionViewmodelProvider.notifier);
      await viewModel.initialize();
    });
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(realtimeDetectionViewmodelProvider);
    final searchStations =
        ref.watch(realtimeDetectionViewmodelProvider).searchStationList;

    return Scaffold(
      appBar: AppBar(
          title: const Text("リアルタイム検出"),
          backgroundColor: Colors.lightBlueAccent,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchAnchor(builder: (context, controller) {
                    return SearchBar(
                      controller: controller,
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onTap: () {
                        controller.openView();
                        viewModel.setSearching(true);
                      },
                      onChanged: (value) {
                        // 検索結果を更新: stationsからvalueに一致する駅名を検索
                        viewModel.filterStationList(value);
                      },
                      leading: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          viewModel.setSearching(true);
                        },
                      ),
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            controller.clear();
                            viewModel.clearSearchStation();
                            viewModel.setSearching(false);
                          },
                        ),
                      ],
                    );
                  }, suggestionsBuilder: (context, controller) {
                    return List<ListTile>.generate(
                      searchStations.length,
                      (index) {
                        return ListTile(
                          title: Text(searchStations[index].name),
                          onTap: () {
                            // 駅名を検索バーにセット
                            controller.text = searchStations[index].name;
                            // 検索対象の駅をセット
                            viewModel.setSearchStation(searchStations[index]);
                            // 路線情報を検索
                            viewModel.searchTrainRouteInfo();
                          },
                        );
                      },
                    );
                  })))),
      body: Stack(
        children: [
          // カメラプレビューと物体検出
          UltralyticsYoloCameraPreview(
            predictor: viewModel.predictor,
            controller: viewModel.ultralyticsYoloCameraController,
            onCameraCreated: () async {
              viewModel.ultralyticsYoloCameraController.startCamera();
            },
          ),

          // 検出結果の表示
          StreamBuilder<List<DetectedObject>?>(
            stream: viewModel.detectedObjectStream.map((detectedObjects) =>
                detectedObjects?.whereType<DetectedObject>().toList()),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();

              final detections = viewModel.isSearching
                  ? viewModel.detections ?? []
                  : snapshot.data!;
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
