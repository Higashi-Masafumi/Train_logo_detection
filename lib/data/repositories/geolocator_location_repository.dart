import 'package:geolocator/geolocator.dart';
import 'package:train_logo_detection_app/data/services/geolocator_service.dart';
import 'package:train_logo_detection_app/domain/repositories/location_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:train_logo_detection_app/domain/models/location/location.dart';

class GeolocatorLocationRepository implements LocationRepository {
  final GeolocatorService _geolocatorService;

  GeolocatorLocationRepository(this._geolocatorService);

  @override
  Future<Location?> getCurrentLocation() async {
    try {
      final position = await _geolocatorService.getCurrentLocation();
      if (position == null) return null;

      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        altitude: position.altitude,
        speed: position.speed,
        heading: position.heading,
        timestamp: position.timestamp,
      );
    } catch (e) {
      debugPrint('Error in getCurrentLocation: $e');
      return null;
    }
  }

  @override
  Future<double?> getDistanceToStation(
      double stationLat, double stationLong) async {
    try {
      final location = await getCurrentLocation();
      if (location == null) return null;

      final distanceInMeters = Geolocator.distanceBetween(
        location.latitude,
        location.longitude,
        stationLat,
        stationLong,
      );

      return distanceInMeters;
    } catch (e) {
      debugPrint('Error calculating distance: $e');
      return null;
    }
  }
}
