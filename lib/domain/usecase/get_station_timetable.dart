import 'package:train_logo_detection_app/domain/models/train_timetable/train_timetable.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/repositories/train_timetable_repository.dart';
import 'package:train_logo_detection_app/domain/repositories/train_route_repository.dart';
import 'package:flutter/foundation.dart';

class GetStationTimetableUseCase {
  final TrainTimetableRepository _trainTimetableRepository;
  final TrainRouteRepository _trainRouteRepository;

  GetStationTimetableUseCase(
      this._trainTimetableRepository, this._trainRouteRepository);

  Future<Map<Station, StationTimetable>> execute(Station station) async {
    /// 指定した駅の時刻表を取得する
    /// 1. 駅IDと運行会社IDを取得
    final stationOwlSameAs = station.owlSameAs;
    final operatorId = station.operatorId;
    // 2. 時刻表を取得
    final stationTimetables = await _trainTimetableRepository
        .getStationTimetables(stationOwlSameAs, operatorId);
    // 3. 現在の曜日を取得する
    // 平日ならWeekday, 土日祝ならSaturdayHoliday
    final currentDate = DateTime.now();
    final calendar = currentDate.weekday == 6 || currentDate.weekday == 7
        ? 'odpt.Calendar:SaturdayHoliday'
        : 'odpt.Calendar:Weekday';
    // 4. 曜日に応じた時刻表を取得する
    final timetables = stationTimetables
        .where((timetable) => timetable.calendar == calendar)
        .toList();

    // 5. stationTimetableObjectはdepartureTimeでソートされているので、
    // 現在時刻から直近の3つの時刻表のみに絞り込む
    final currentTime = DateTime.now();
    final filteredTimetables = <StationTimetable>[];
    for (var timetable in timetables) {
      final timetableObjects = timetable.timetableObjects;
      final filteredTimetableObjects = timetableObjects
          .where((timetableObject) {
            final departureTime = DateTime(
              currentTime.year,
              currentTime.month,
              currentTime.day,
              int.parse(timetableObject.departureTime.split(':')[0]),
              int.parse(timetableObject.departureTime.split(':')[1]),
            );
            return departureTime.isAfter(currentTime);
          })
          .take(3)
          .toList();
      debugPrint('filteredTimetableObjects: $filteredTimetableObjects');
      // Note: freezedモデルは不変なので、新しいインスタンスを作成する必要があります
      filteredTimetables
          .add(timetable.copyWith(timetableObjects: filteredTimetableObjects));
      debugPrint('timetable: $timetable');
    }

    final stationTimetableMap = <Station, StationTimetable>{};

    // 6. 各時刻表の進行方向の駅を取得する
    if (operatorId == 'TokyoMetro') {
      for (var timetable in filteredTimetables) {
        final line = station.line; // ex: Chiyoda
        final directionStationId =
            timetable.railDirection.split(".").last; // ex: KitaAyase
        final operator = station.operatorId;
        final directionStationOwlSameAs = "$operator.$line.$directionStationId";
        debugPrint('directionStationOwlSameAs: $directionStationOwlSameAs');
        final destinationStation =
            await _trainRouteRepository.getStaion(directionStationOwlSameAs);
        debugPrint('destinationStation: $destinationStation');
        stationTimetableMap[destinationStation] = timetable;
      }
    }
    else if (operatorId == 'Toei') {
      for (var timetable in filteredTimetables) {
        final timetableObjects = timetable.timetableObjects;
        final directionStation = timetableObjects.first.destinationStation;
        debugPrint('directionStation: $directionStation');
        final directionStationOwlSameAs = directionStation.first.split(':').last;
        final destinationStation = await _trainRouteRepository.getStaion(directionStationOwlSameAs);
        debugPrint('destinationStation: $destinationStation');
        stationTimetableMap[destinationStation] = timetable;
      }
    }
    debugPrint('stationTimetableMap: $stationTimetableMap');
    return stationTimetableMap;
  }
}
