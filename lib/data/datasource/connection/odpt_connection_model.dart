import 'package:freezed_annotation/freezed_annotation.dart';

part 'odpt_connection_model.freezed.dart';
part 'odpt_connection_model.g.dart';

@freezed
class OdptLineConnection with _$OdptLineConnection {
  const factory OdptLineConnection({
    required String stationId,
    required String stationOwlSameAs,
    required String lineId,
    required String lineOwlSameAs,
  }) = _OdptLineConnection;

  factory OdptLineConnection.fromJson(Map<String, dynamic> json) =>
      _$OdptLineConnectionFromJson(json);
}

@freezed
class OdptStationConnection with _$OdptStationConnection {
  const factory OdptStationConnection({
    required String stationId,
    required String stationOwlSameAs,
    required String connectingStationId,
    required String connectingStationOwlSameAs,
  }) = _OdptStationConnection;

  factory OdptStationConnection.fromJson(Map<String, dynamic> json) =>
      _$OdptStationConnectionFromJson(json);
}
