import 'package:freezed_annotation/freezed_annotation.dart';

part 'odpt_timetable_model.freezed.dart';
part 'odpt_timetable_model.g.dart';


/// ODPTの駅時刻表全体を受け取るモデル (サービス層用DTO)
@freezed
class StationTimetableDto with _$StationTimetableDto {
  /// コンストラクタ
  factory StationTimetableDto({
    /// 例: "urn:ucode:_00001C00000000000001000003100E90"
    required String id,

    /// 例: "odpt:StationTimetable"
    required String type,

    /// 例: "2025-01-06T13:00:00+09:00"
    required DateTime date,

    /// 例: "http://vocab.odpt.org/context_odpt_StationTimetable.jsonld"
    required String context,

    /// 例: "2024-03-16"
    required String issued,

    /// 例: "odpt.StationTimetable:TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday"
    required String sameAs,

    /// 例: "odpt.Railway:TokyoMetro.Chiyoda"
    required String railway,

    /// 例: "odpt.Station:TokyoMetro.Chiyoda.Akasaka"
    required String station,

    /// 例: "odpt.Calendar:SaturdayHoliday" (平日 or 土休日など)
    required String calendar,

    /// 例: "odpt.Operator:TokyoMetro"
    required String operatorId,

    /// 例: "odpt.RailDirection:TokyoMetro.KitaAyase"
    required String railDirection,

    /// 個々の列車情報一覧
    required List<StationTimetableObjectDto> stationTimetableObjects,
  }) = _StationTimetableDto;

  /// JSON からパースするためのメソッド
  factory StationTimetableDto.fromJson(Map<String, dynamic> json) =>
      _$StationTimetableDtoFromJson(json);
}

/// ODPTの駅時刻表オブジェクト(列車ごとの情報)を受け取るモデル
@freezed
class StationTimetableObjectDto with _$StationTimetableObjectDto {
  factory StationTimetableObjectDto({
    /// 例: "odpt.Train:TokyoMetro.Chiyoda.B529S"
    required String train,

    /// 例: "odpt.TrainType:TokyoMetro.Local"
    required String trainType,

    /// 例: "B529S"
    required String trainNumber,

    /// 例: "05:10" (発車時刻)
    required String departureTime,

    /// 例: ["odpt.Station:JR-East.JobanLocal.Abiko"]
    required List<String> destinationStation,

    /// 例: 土休日など終電近くで "odpt:isLast": true が入る場合
    required bool? isLast,

    /// 例: `"TokyoMetro.Chiyoda.Akasaka.TokyoMetro.KitaAyase.SaturdayHoliday": true`
    /// のような追加キーにも対応したい場合は、下記のようにフィールドを追加で定義可能。
    /// フィールド名が複雑なので、注意が必要。
    /// 今回は例として optional に示します（必須でなければ省略可能）。
    required bool? isSaturdayHoliday,
  }) = _StationTimetableObjectDto;

  factory StationTimetableObjectDto.fromJson(Map<String, dynamic> json) =>
      _$StationTimetableObjectDtoFromJson(json);
}
