import 'package:freezed_annotation/freezed_annotation.dart';

part 'train_timetable.freezed.dart';

@freezed
class StationTimetable with _$StationTimetable {
  const factory StationTimetable({
    required String id,
    required DateTime date,
    required String railway,
    required String station,
    required String railDirection,
    required String operatorId,
    required String calendar,
    required List<StationTimetableObject> timetableObjects,
  }) = _StationTimetable;

}

@freezed
class StationTimetableObject with _$StationTimetableObject {
  const factory StationTimetableObject({
    required String train,
    required String trainType,
    required String trainNumber,
    required String departureTime,
    required List<String> destinationStation,
  }) = _StationTimetableObject;
  
}
