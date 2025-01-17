import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_logo_detection_app/data/datasource/database/railway_database_service.dart';
import 'package:train_logo_detection_app/data/repositories/odpt_train_route_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:train_logo_detection_app/domain/usecase/get_train_route_info_usecase.dart';
import 'package:train_logo_detection_app/data/services/geolocator_service.dart';
import 'package:train_logo_detection_app/data/repositories/geolocator_location_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/location_repository.dart';
import 'package:train_logo_detection_app/data/datasource/api_gateway/timetable_api.dart';
import 'package:train_logo_detection_app/data/repositories/odpt_train_timetable_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/train_timetable_repository.dart';
import 'package:train_logo_detection_app/domain/usecase/get_station_timetable.dart';
// データソース
final timetableApiServiceProvider = Provider((ref) => TimetableApiService());

// リポジトリ
final trainTimetableRepositoryProvider =
    Provider<TrainTimetableRepository>((ref) {
  final apiService = ref.watch(timetableApiServiceProvider);
  return TrainTimetableRepositoryImpl(apiService);
});

final trainRouteRepositoryProvider = Provider<TrainRouteRepository>((ref) {
  final databaseService = RailwayDatabaseService();
  return OdptTrainRouteRepository(databaseService);
});

// ユースケース
final getStationTimetableUseCaseProvider =
    Provider<GetStationTimetableUseCase>((ref) {
  final timetableRepo = ref.watch(trainTimetableRepositoryProvider);
  final routeRepo = ref.watch(trainRouteRepositoryProvider);
  return GetStationTimetableUseCase(timetableRepo, routeRepo);
});

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
