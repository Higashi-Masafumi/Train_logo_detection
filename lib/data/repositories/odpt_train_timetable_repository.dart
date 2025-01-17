import 'package:train_logo_detection_app/data/datasource/api_gateway/timetable_api.dart';
import 'package:train_logo_detection_app/domain/models/train_timetable/train_timetable.dart';
import 'package:train_logo_detection_app/domain/repositories/train_timetable_repository.dart';

class TrainTimetableRepositoryImpl implements TrainTimetableRepository {
  final TimetableApiService _apiService;

  TrainTimetableRepositoryImpl(this._apiService);

  @override
  Future<List<StationTimetable>> getStationTimetables(
    String stationId,
    String operatorId,
  ) async {
    try {
      final dtos = await _apiService.getStationTimetable(
        operatorId,
        stationId,
      );

      return dtos
          .map((dto) => StationTimetable(
                id: dto.id,
                date: dto.date,
                railway: dto.railway,
                station: dto.station,
                railDirection: dto.railDirection,
                operatorId: dto.operatorId,
                calendar: dto.calendar,
                timetableObjects: dto.stationTimetableObjects
                    .map((obj) => StationTimetableObject(
                          train: obj.train,
                          trainType: obj.trainType,
                          trainNumber: obj.trainNumber,
                          departureTime: obj.departureTime,
                          destinationStation: obj.destinationStation,
                        ))
                    .toList(),
              ))
          .toList();
    } catch (e) {
      throw Exception('時刻表の取得に失敗しました: $e');
    }
  }

  @override
  Future<List<StationTimetable>> getStationTimetablesByCalendar(
    String stationId,
    String operatorId,
    String calendar,
  ) async {
    try {
      final dtos = await _apiService.getStationTimetableByCalendar(
        stationId,
        operatorId,
        calendar,
      );

      return dtos
          .map((dto) => StationTimetable(
                id: dto.id,
                date: dto.date,
                railway: dto.railway,
                station: dto.station,
                railDirection: dto.railDirection,
                operatorId: dto.operatorId,
                calendar: dto.calendar,
                timetableObjects: dto.stationTimetableObjects
                    .map((obj) => StationTimetableObject(
                          train: obj.train,
                          trainType: obj.trainType,
                          trainNumber: obj.trainNumber,
                          departureTime: obj.departureTime,
                          destinationStation: obj.destinationStation,
                        ))
                    .toList(),
              ))
          .toList();
    } catch (e) {
      throw Exception('時刻表の取得に失敗しました: $e');
    }
  }
}
