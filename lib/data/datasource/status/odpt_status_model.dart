import 'package:freezed_annotation/freezed_annotation.dart';

part 'odpt_status_model.freezed.dart';
part 'odpt_status_model.g.dart';

/// ODPTの運行情報を受け取るモデル (サービス層用DTO)
@freezed
class TrainInformationDto with _$TrainInformationDto {
  /// コンストラクタ
  factory TrainInformationDto({
    /// 例: "urn:uuid:6f1b7cf1-eaa5-4063-af68-7007dd6586e2"
    required String id,

    /// 例: "odpt:TrainInformation"
    required String type,

    /// 例: "2025-02-09T00:16:00+09:00"
    required DateTime date,

    /// 例: "http://vocab.odpt.org/context_odpt_TrainInformation.jsonld"
    required String context,

    /// 例: "2025-02-09T00:21:00+09:00"
    required DateTime valid,

    /// 例: "odpt.TrainInformation:TokyoMetro.Ginza"
    required String sameAs,

    /// 例: "odpt.Railway:TokyoMetro.Ginza"
    required String railway,

    /// 例: "odpt.Operator:TokyoMetro"
    required String operator,

    /// 例: "2025-01-20T10:50:00+09:00"
    DateTime? timeOfOrigin,

    /// 例: {"ja": "現在、平常どおり運転しています。"}
    required Map<String, String> trainInformationText,
  }) = _TrainInformationDto;

  /// JSON からパースするためのメソッド
  factory TrainInformationDto.fromJson(Map<String, dynamic> json) =>
      _$TrainInformationDtoFromJson(json);
}
