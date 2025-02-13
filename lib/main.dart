import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/ui/realtime_detection/realtime_detection_screen.dart';
import 'package:train_logo_detection_app/ui/detection_detail/detection_detail_screen.dart';
import 'package:train_logo_detection_app/data/services/yolo_model.dart';
import 'package:train_logo_detection_app/data/services/yolo_camera.dart';
import 'package:train_logo_detection_app/data/services/google_ml_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:train_logo_detection_app/config/train_logo.dart';
import 'package:train_logo_detection_app/ui/core/train_logo.dart';
import 'package:train_logo_detection_app/utils/check_permission.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter Engineの初期化
  await UltralyticsYoloModelService().initialize(); // YOLOモデルの初期化
  await UltralyticsYoloModelService().initializeObjectDetector(); // YOLOモデルの初期化
  YoloCameraService().initialize(); // カメラの初期化
  GoogleMlTextRecognition().initialize(); // Google ML Kitの初期化
  await checkPermissions();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路線ロゴ検出アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const InitializationScreen(),
      routes: {
        '/realtime_detection': (context) => const RealtimeDetectionScreen(),
        '/train_route_info': (context) => const DetectionDetailScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class InitializationScreen extends StatefulWidget {
  const InitializationScreen({super.key});

  @override
  State<InitializationScreen> createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isInitializing = true;
  Map<Permission, bool> _permissionStatus = {
    Permission.camera: false,
    Permission.location: false,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _checkPermissions();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkPermissions() async {
    setState(() => _isInitializing = true);

    try {
      // 各権限の状態を確認
      final cameraStatus = await Permission.camera.status;
      final locationStatus = await Permission.location.status;

      if (mounted) {
        setState(() {
          _permissionStatus = {
            Permission.camera: cameraStatus.isGranted,
            Permission.location: locationStatus.isGranted,
          };
          _isInitializing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isInitializing = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('権限の確認中にエラーが発生しました: $e')),
        );
      }
    }
  }

  Future<void> _navigateToDetectionScreen() async {
    // カメラ権限のみ必須とする
    if (!_permissionStatus[Permission.camera]!) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('必要な権限が不足しています'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('以下の権限が必要です：'),
                SizedBox(height: 8),
                Text('・カメラ(Camera Usage)'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('キャンセル'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToSettings();
                },
                child: const Text('設定画面へ'),
              ),
            ],
          ),
        );
      }
      return;
    }

    // 全ての権限が許可されている場合は検出画面へ
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/realtime_detection');
    }
  }

  Future<void> _navigateToSettings() async {
    await openAppSettings();
    // 設定画面から戻ってきたら権限を再チェック
    if (mounted) {
      _checkPermissions();
    }
  }

  // ロゴを円形に配置するウィジェット
  Widget _buildCircularLogos() {
    const double radius = 140;
    final int count = TrainLineLabel.values.length;

    return Center(
      child: SizedBox(
        height: radius * 2,
        width: radius * 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Text(
              '検出可能な\n路線ロゴ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            ...List.generate(count, (index) {
              final double angle = (2 * pi * index) / count;
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(
                        radius * cos(angle + _controller.value * 2 * pi),
                        radius * sin(angle + _controller.value * 2 * pi),
                      )
                      ..rotateZ(angle + _controller.value * 2 * pi),
                    child: child,
                  );
                },
                child: TrainLineLogo(
                  circleColor: TrainLineLabelMapper.getLineColor(
                    TrainLineLabel.values[index],
                  ),
                  text: TrainLineLabelMapper.getLogoText(
                    TrainLineLabel.values[index],
                  ),
                  size: 60,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isInitializing
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('アプリを初期化中...'),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // ヘッダー部分
                    const Text(
                      'メトロファインダー',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // 円形に配置されたロゴ
                    _buildCircularLogos(),
                    const Spacer(),
                    // 権限状態の表示
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'このアプリで必要な権限',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ..._permissionStatus.entries.map(
                              (entry) => ListTile(
                                leading: Icon(
                                  entry.value
                                      ? Icons.check_circle
                                      : Icons.error_outline,
                                  color: entry.key == Permission.camera
                                      ? (entry.value
                                          ? Colors.green
                                          : Colors.red)
                                      : (entry.value
                                          ? Colors.green
                                          : Colors.orange),
                                ),
                                title: Text(
                                  switch (entry.key) {
                                    Permission.camera =>
                                      'カメラ(Camera Usage Permission)',
                                    Permission.location =>
                                      '位置情報(Location Usage Permission) - オプション',
                                    _ => 'その他',
                                  },
                                ),
                                subtitle: entry.key == Permission.location &&
                                        !entry.value
                                    ? const Text('位置情報を許可すると、最寄駅を検出できます',
                                        style: TextStyle(fontSize: 12))
                                    : null,
                                dense: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ボタン
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _navigateToSettings,
                          icon: const Icon(Icons.settings), // 歯車アイコン
                          label: const Text('設定画面へ'),
                        ),
                        ElevatedButton.icon(
                          onPressed: _navigateToDetectionScreen,
                          icon: const Icon(Icons.camera_alt), // カメラアイコン
                          label: const Text('検出画面へ'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
