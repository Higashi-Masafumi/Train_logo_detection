import 'package:flutter/material.dart';
import 'package:train_logo_detection_app/data/repositories/dev_train_route_repository.dart';
import 'package:train_logo_detection_app/domain/models/logo_detection/train_logo_detection.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/ui/realtime_detection/realtime_detection_viewmodel.dart';


final trainRouteViewModelProvider = ChangeNotifierProvider((ref) => TrainRouteViewModel(ref));


@riverpod 
class TrainRouteViewModel extends ChangeNotifier {
  TrainRouteViewModel(this.ref) {
    ref.listen<RealtimeDetectionViewmodel>(realtimeDetectionViewmodelProvider, (previous, next) {
      if (next.trainLogoDetectionResult != null) {
        debugPrint('TrainRouteViewModel: fetchTrainRouteInfo');
        fetchTrainRouteInfo(next.trainLogoDetectionResult!);
      } else {
        debugPrint('TrainRouteViewModel: clearTrainRouteInfo');
        clearTrainRouteInfo();
      }
    });
  }

  final Ref ref;
  final TrainRouteRepository _trainRouteRepository = DevTrainRouteRepository();

  TrainRouteInfo? _trainRouteInfo;
  TrainRouteInfo? get trainRouteInfo => _trainRouteInfo;

  Future<void> fetchTrainRouteInfo(TrainLogoDetectionResult trainLogoDetectionResult) async {
    try {
      _trainRouteInfo = await _trainRouteRepository.getTrainRouteInfo(trainLogoDetectionResult);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch train route info: $e');
    }
  }

  void clearTrainRouteInfo() {
    _trainRouteInfo = null;
    notifyListeners();
  }
}