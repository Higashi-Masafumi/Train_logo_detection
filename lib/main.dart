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

class InitializationScreen extends ConsumerStatefulWidget {
  const InitializationScreen({super.key});

  @override
  ConsumerState<InitializationScreen> createState() =>
      _InitializationScreenState();
}

class _InitializationScreenState extends ConsumerState<InitializationScreen>
    with TickerProviderStateMixin {
  bool _isInitializing = true;
  String? _errorMessage;
  late int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitializing) {
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

    if (_errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _initialize,
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
      );
    }

    // 初期化完了後のメイン画面
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Logo Detection App'),
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.lightBlueAccent,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.camera_alt),
            label: 'リアルタイム検出',
          ),
          NavigationDestination(
            icon: Icon(Icons.train),
            label: '検出結果',
          ),
        ],
      ),
      body: const <Widget>[
        RealtimeDetectionScreen(),
        DetectionDetailScreen(),
      ][currentPageIndex],
    );
  }

  Future<void> _initialize() async {
    try {
      setState(() {
        _isInitializing = true;
        _errorMessage = null;
      });

      final hasPermissions = await checkPermissions();
      if (!hasPermissions) {
        setState(() {
          _isInitializing = false;
          _errorMessage = '必要な権限が許可されていません';
        });
        return;
      }

      setState(() {
        _isInitializing = false;
      });
    } catch (e) {
      setState(() {
        _isInitializing = false;
        _errorMessage = '初期化エラー: $e';
      });
    }
  }
}
