import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class GeolocatorService {
  static final GeolocatorService instance = GeolocatorService._internal();
  GeolocatorService._internal();

  Future<Position?> getCurrentLocation() async {
    try {
      // 位置情報の取得
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0,
        ),
      );
      debugPrint('Current location: ${position.toString()}');
      return position;
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }
}
