import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/ui/realtime_detection/realtime_detection_screen.dart';
import 'package:train_logo_detection_app/ui/detection_detail.dart/detection_detail_screen.dart';
import 'package:train_logo_detection_app/utils/check_permission.dart';
import 'package:train_logo_detection_app/data/services/yolo_model.dart';
import 'package:train_logo_detection_app/data/services/yolo_camera.dart';
import 'package:train_logo_detection_app/data/services/google_ml_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter Engineの初期化
  await UltralyticsYoloModelService().initialize(); // YOLOモデルの初期化
  await UltralyticsYoloModelService().initializeObjectDetector(); // YOLOモデルの初期化
  YoloCameraService().initialize(); // カメラの初期化
  GoogleMlTextRecognition().initialize(); // Google ML Kitの初期化
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
    );
  }
}

class InitializationScreen extends StatefulWidget {
  const InitializationScreen({super.key});

  @override
  State<InitializationScreen> createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen> {
  bool _isInitializing = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // パーミッションのチェック
      final hasPermissions = await checkPermissions();
      if (!hasPermissions) {
        if (mounted) {
          setState(() {
            _isInitializing = false;
            _errorMessage = '必要な権限が許可されていません';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('必要な権限が許可されていません')),
          );
        }
        return;
      }

      if (mounted) {
        // 初期化が完了したら検出画面に遷移
        Navigator.pushReplacementNamed(context, '/realtime_detection');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isInitializing = false;
          _errorMessage = '初期化エラー: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('初期化エラー: $e')),
        );
      }
    }
  }

  void _navigateToDetectionScreen() {
    Navigator.pushReplacementNamed(context, '/realtime_detection');
  }

  Future<void> _navigateToSettings() async {
    // permission_handlerで端末設定画面へ
    await openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isInitializing
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  const Text('アプリを初期化中...'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _navigateToDetectionScreen,
                    child: const Text('検出画面に移動'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _errorMessage ?? '初期化が完了しませんでした。',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _navigateToSettings,
                    child: const Text('設定画面に移動'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _navigateToDetectionScreen,
                    child: const Text('検出画面に移動'),
                  ),
                ],
              ),
      ),
    );
  }
}
