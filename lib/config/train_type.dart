import 'package:flutter/material.dart';

/// 列車種別の定義
enum TrainType {
  local('Local', '各駅停車', Colors.grey),
  express('Express', '急行', Colors.red),
  semiExpress('SemiExpress', '準急', Colors.lightGreen),
  rapid('Rapid', '快速', Colors.blue),
  commuteRapid('CommuteRapid', '通勤快速', Colors.purple),
  commuteExpress('CommuteExpress', '通勤急行', Colors.orange),
  rapidExpress('RapidExpress', '快速急行', Colors.indigo),
  fliner('F-Liner', 'Fライナー', Colors.green);

  final String apiValue;
  final String label;
  final MaterialColor baseColor;

  const TrainType(this.apiValue, this.label, this.baseColor);

  /// APIの値から列車種別を取得
  static TrainType fromApiValue(String value) {
    return TrainType.values.firstWhere(
      (type) => type.apiValue == value,
      orElse: () => TrainType.local,
    );
  }

  /// 色を取得（濃さ700）
  Color get color => baseColor[700] ?? baseColor;
}

/// 列車種別に関する拡張メソッド
extension TrainTypeX on String {
  (Color, String) getTrainTypeInfo() {
    final trainType = TrainType.fromApiValue(this);
    return (trainType.color, trainType.label);
  }
}
