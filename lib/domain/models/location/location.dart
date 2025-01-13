import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    required double accuracy,
    required double altitude,
    required double speed,
    required double heading,
    required DateTime timestamp,
  }) = _Location;
}
