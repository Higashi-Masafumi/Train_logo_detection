import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/ui/realtime_detection/realtime_detection_screen.dart';
import 'package:train_logo_detection_app/ui/detection_detail.dart/detection_detail_screen.dart';
import 'package:train_logo_detection_app/utils/check_permission.dart';
import 'package:train_logo_detection_app/data/services/yolo_model.dart';
import 'package:train_logo_detection_app/data/services/yolo_camera.dart';
import 'package:train_logo_detection_app/data/services/google_ml_text_recognition.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('初期化エラー: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('アプリを初期化中...'),
          ],
        ),
      ),
    );
  }
}
