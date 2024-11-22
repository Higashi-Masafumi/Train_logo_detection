import 'dart:async'; // Timerを使うために追加
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:ultralytics_yolo/yolo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = UltralyticsYoloCameraController();
  Uint8List? _currentImage; // 最新の画像データ
  Timer? _timer; // 定期的に実行するタイマー

  @override
  void initState() {
    super.initState();
    controller.setStrokeWidth(0.0);

    // 定期的にcurrent_imageを取得するタイマーをセットアップ
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final image = await controller.getCameraImage();
      debugPrint("Image: $image");
      if (image != null) {
        setState(() {
          _currentImage = image;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // タイマーを停止
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<bool>(
          future: _checkPermissions(),
          builder: (context, snapshot) {
            final allPermissionsGranted = snapshot.data ?? false;

            return !allPermissionsGranted
                ? const Center(child: Text("Permissions not granted"))
                : FutureBuilder<ObjectDetector>(
                    future: _initObjectDetectorWithLocalModel(),
                    builder: (context, snapshot) {
                      final predictor = snapshot.data;
                      debugPrint("Predictor: $predictor");
                      if (snapshot.hasError) {
                        debugPrint(
                            "Error initializing ObjectDetector: ${snapshot.error}");
                        return Center(
                            child:
                                Text("Error loading model: ${snapshot.error}"));
                      }

                      return predictor == null
                          ? const Center(child: CircularProgressIndicator())
                          : Stack(
                              children: [
                                // カメラプレビュー
                                UltralyticsYoloCameraPreview(
                                  controller: controller,
                                  predictor: predictor,
                                  onCameraCreated: () {
                                    try {
                                      predictor.loadModel(useGpu: true);
                                      debugPrint("Model successfully loaded.");
                                    } catch (e) {
                                      debugPrint(
                                          "Error during model loading: $e");
                                    }
                                  },
                                ),
                                // FPS と推論時間の情報
                                StreamBuilder<double?>(
                                  stream: predictor.inferenceTime,
                                  builder: (context, snapshot) {
                                    final inferenceTime = snapshot.data;
                                    return StreamBuilder<double?>(
                                      stream: predictor.fpsRate,
                                      builder: (context, snapshot) {
                                        final fpsRate = snapshot.data;
                                        return Times(
                                          inferenceTime: inferenceTime,
                                          fpsRate: fpsRate,
                                        );
                                      },
                                    );
                                  },
                                ),
                                // 定期的に取得した画像を表示
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: _currentImage == null
                                        ? const Center(
                                            child: Text(
                                              "No Image",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        : Image.memory(
                                            _currentImage!,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ],
                            );
                    },
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.cameraswitch),
          onPressed: () {
            controller.toggleLensDirection();
          },
        ),
      ),
    );
  }

  Future<ObjectDetector> _initObjectDetectorWithLocalModel() async {
    try {
      final appSupportDir = await getApplicationSupportDirectory();
      debugPrint("Application Support Directory: ${appSupportDir.path}");

      final modelPath = await _copy('assets/imgsz_320_192.mlmodel');

      debugPrint("Model Path: $modelPath");

      final model = LocalYoloModel(
        id: '',
        task: Task.detect,
        format: Format.coreml,
        modelPath: modelPath,
      );

      debugPrint("ObjectDetector successfully initialized.");
      return ObjectDetector(model: model);
    } catch (e) {
      debugPrint("Error initializing ObjectDetector: $e");
      rethrow;
    }
  }

  Future<String> _copy(String assetPath) async {
    final appSupportDir = await getApplicationSupportDirectory();
    final path = '${appSupportDir.path}/$assetPath';
    debugPrint("Attempting to copy asset to path: $path");

    try {
      await io.Directory(dirname(path)).create(recursive: true);
      final file = io.File(path);

      if (!await file.exists()) {
        debugPrint("File does not exist. Copying from assets...");
        final byteData = await rootBundle.load(assetPath);
        await file.writeAsBytes(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
        debugPrint("File successfully copied to $path");
      } else {
        debugPrint("File already exists at $path");
      }

      return file.path;
    } catch (e) {
      debugPrint("Error copying asset: $e");
      rethrow;
    }
  }

  Future<bool> _checkPermissions() async {
    List<Permission> permissions = [];

    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) permissions.add(Permission.camera);

    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) permissions.add(Permission.storage);

    if (permissions.isEmpty) {
      return true;
    } else {
      try {
        Map<Permission, PermissionStatus> statuses =
            await permissions.request();
        return statuses[Permission.camera] == PermissionStatus.granted &&
            statuses[Permission.storage] == PermissionStatus.granted;
      } on Exception catch (e) {
        debugPrint("Error checking permissions: $e");
        return false;
      }
    }
  }
}

class Times extends StatelessWidget {
  const Times({
    super.key,
    required this.inferenceTime,
    required this.fpsRate,
  });

  final double? inferenceTime;
  final double? fpsRate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black54,
            ),
            child: Text(
              '${(inferenceTime ?? 0).toStringAsFixed(1)} ms  -  ${(fpsRate ?? 0).toStringAsFixed(1)} FPS',
              style: const TextStyle(color: Colors.white70),
            )),
      ),
    );
  }
}
