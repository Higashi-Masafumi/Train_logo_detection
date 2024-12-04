// detection_search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import './detection_search_viewmodel.dart';
import 'package:train_logo_detection_app/ui/core/detection_box.dart';

class DetectionSearchScreen extends ConsumerStatefulWidget {
  const DetectionSearchScreen({super.key});

  @override
  ConsumerState<DetectionSearchScreen> createState() =>
      _DetectionSearchScreenState();
}

class _DetectionSearchScreenState extends ConsumerState<DetectionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final viewModel = ref.read(detectionSearchViewmodelProvider.notifier);
      await viewModel.initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(detectionSearchViewmodelProvider.notifier);
    return Scaffold(
      // 検索バー
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                viewModel.searchTrainRouteInfo(_searchController.text);
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          if (viewModel.searchResults.isNotEmpty)
            Container(
              color: Colors.white.withOpacity(0.5),
              child: ListView.builder(
                itemCount: viewModel.searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(viewModel.searchResults[index]),
                    onTap: () {
                      viewModel.selectedStation =
                          viewModel.searchResults[index];
                      _searchController.text = viewModel.searchResults[index];
                    },
                  );
                },
              ),
            ),
          // 検出結果の表示
          StreamBuilder<List<DetectedObject?>?>(
            stream: viewModel.detectedObjectStream.map((detectedObjects) =>
                detectedObjects?.whereType<DetectedObject>().toList()),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              final detections = snapshot.data!;
              return SizedBox.expand(
                child: CustomPaint(
                  painter: DetectionPainter(
                    detections.whereType<DetectedObject>().toList(),
                  ),
                ),
              );
            },
          ),
          // カメラーの撮影ボタン
          Positioned(
            bottom: 16,
            left: 16,
            child: ElevatedButton(
              child: const Icon(Icons.camera_alt),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
