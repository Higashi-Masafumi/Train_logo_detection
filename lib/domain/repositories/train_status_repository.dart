import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';

abstract class TrainStatusRepository {
  /// 路線の運行情報を取得する
  Future<TrainStatus> getTrainLineStatus(TrainLine trainLine);
}