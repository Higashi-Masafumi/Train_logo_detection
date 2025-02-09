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
import 'package:train_logo_detection_app/data/repositories/odpt_train_status_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/train_status_repository.dart';
import 'package:train_logo_detection_app/data/datasource/api_gateway/train_status.dart';
// データソース
final timetableApiServiceProvider = Provider((ref) => TimetableApiService());
final trainStatusApiServiceProvider = Provider((ref) => TrainStatusApiService());

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

final trainStatusRepositoryProvider = Provider<TrainStatusRepository>((ref) {
  final trainStatusApiService = ref.watch(trainStatusApiServiceProvider);
  return OdptTrainStatusRepository(trainStatusApiService);
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
  final trainStatusRepository = ref.watch(trainStatusRepositoryProvider);
  return GetTrainRouteInfoUseCase(trainRouteRepository, locationRepository, trainStatusRepository);
});

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final geolocatorService = GeolocatorService.instance;
  return GeolocatorLocationRepository(geolocatorService);
});
