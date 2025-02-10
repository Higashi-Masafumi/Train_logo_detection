import 'package:train_logo_detection_app/data/datasource/api_gateway/train_status.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/repositories/train_status_repository.dart';

class OdptTrainStatusRepository implements TrainStatusRepository {

  final TrainStatusApiService _trainStatusApiService;

  OdptTrainStatusRepository(this._trainStatusApiService);

  @override
  Future<TrainStatus> getTrainLineStatus(TrainLine trainLine) async {
    final trainInformation = await _trainStatusApiService.getTrainLineInformation(trainLine.operatorId, trainLine.owlSameAs);
    return TrainStatus(
      id: trainInformation.id,
      type: trainInformation.type,
      valid: trainInformation.valid,
      owlSameAs: trainInformation.sameAs,
      railway: trainInformation.railway,
      operator: trainInformation.operator,
      timeOfOrigin: trainInformation.timeOfOrigin ?? DateTime.now(),
      trainStatusText: trainInformation.trainInformationText,
    );
  }
}
