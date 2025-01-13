import 'package:train_logo_detection_app/domain/models/location/location.dart';

abstract class LocationRepository {
  Future<Location?> getCurrentLocation();
  Future<double?> getDistanceToStation(double stationLat, double stationLong);
}
