import 'package:train_logo_detection_app/domain/models/train_timetable/train_timetable.dart';

abstract class TrainTimetableRepository {
  /// 指定した駅の時刻表を取得
  Future<List<StationTimetable>> getStationTimetables(
    String stationId,
    String operatorId, 
  );

  /// 指定した駅の指定したカレンダー（平日/休日）の時刻表を取得
  Future<List<StationTimetable>> getStationTimetablesByCalendar(
    String stationId,
    String operatorId,
    String calendar, // SaturdayHoliday or Weekday
  );
}
