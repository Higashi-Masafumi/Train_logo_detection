import 'package:freezed_annotation/freezed_annotation.dart';

part 'odpt_line_model.freezed.dart';
part 'odpt_line_model.g.dart';

@freezed
class StationOrder with _$StationOrder {
  const factory StationOrder({
    required int index,
    required String station,
    required Map<String, String> title,
  }) = _StationOrder;

  factory StationOrder.fromJson(Map<String, dynamic> json) =>
      _$StationOrderFromJson(json);
}

@freezed
class OdptLine with _$OdptLine {
  const factory OdptLine({
    required String id,
    required String type,
    required String title,
    required String owlSameAs,
    required String color,
    required String lineCode,
    required String operator,
    required Map<String, String> lineTitle,
    required List<StationOrder> stationOrder,
    required String ascendingDirection,
    required String descendingDirection,
  }) = _OdptLine;

  factory OdptLine.fromJson(Map<String, dynamic> json) =>
      _$OdptLineFromJson(json);
}
