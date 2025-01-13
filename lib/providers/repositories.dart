import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/data/datasource/database/railway_database_service.dart';
import 'package:train_logo_detection_app/data/repositories/odpt_train_route_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/domain/usecase/get_train_route_info_usecase.dart';
import 'package:train_logo_detection_app/data/services/geolocator_service.dart';
import 'package:train_logo_detection_app/data/repositories/geolocator_location_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/location_repository.dart';

// リポジトリ
final trainRouteRepositoryProvider = Provider<TrainRouteRepository>((ref) {
  final databaseService = RailwayDatabaseService.instance;
  return OdptTrainRouteRepository(databaseService);
});

// ユースケース
final getTrainRouteInfoUseCaseProvider =
    Provider<GetTrainRouteInfoUseCase>((ref) {
  final trainRouteRepository = ref.watch(trainRouteRepositoryProvider);
  final locationRepository = ref.watch(locationRepositoryProvider);
  return GetTrainRouteInfoUseCase(trainRouteRepository, locationRepository);
});

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final geolocatorService = GeolocatorService.instance;
  return GeolocatorLocationRepository(geolocatorService);
});
