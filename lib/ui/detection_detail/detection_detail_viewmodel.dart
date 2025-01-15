import 'package:flutter/material.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/providers/repositories.dart';
import 'package:train_logo_detection_app/ui/realtime_detection/realtime_detection_viewmodel.dart';

final trainRouteViewModelProvider =
    ChangeNotifierProvider((ref) => TrainRouteViewModel(ref));

class TrainRouteViewModel extends ChangeNotifier {
  TrainRouteViewModel(this.ref) {
    ref.listen<RealtimeDetectionViewmodel>(
      realtimeDetectionViewmodelProvider,
      (previous, next) {
        if (next.trainLogoDetectionResult != null) {
          debugPrint('TrainRouteViewModel: fetchTrainRouteInfo');
          fetchTrainRouteInfo(next.trainLogoDetectionResult!);
        } else {
          debugPrint('TrainRouteViewModel: clearTrainRouteInfo');
          clearTrainRouteInfo();
        }
      },
    );
  }

  final Ref ref;
  TrainRouteInfo? _trainRouteInfo;
  TrainRouteInfo? get trainRouteInfo => _trainRouteInfo;

  Future<void> fetchTrainRouteInfo(
      TrainLogoDetectionResult trainLogoDetectionResult) async {
    try {
      final useCase = ref.read(getTrainRouteInfoUseCaseProvider);
      debugPrint('Fetching train route info...'); // デバッグ用
      _trainRouteInfo = await useCase.execute(trainLogoDetectionResult);
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Error fetching train route info: $e'); // デバッグ用
      debugPrint('Stack trace: $stackTrace'); // デバッグ用
      throw Exception('Failed to fetch train route info: $e');
    }
  }

  void clearTrainRouteInfo() {
    _trainRouteInfo = null;
    notifyListeners();
  }
}
