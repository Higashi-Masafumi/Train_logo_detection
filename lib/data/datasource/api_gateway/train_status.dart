import 'dart:convert';
import 'package:http/http.dart' as http;
import '../status/odpt_status_model.dart';
import 'package:flutter/foundation.dart';

class TrainStatusApiService {
  static final TrainStatusApiService _instance =
      TrainStatusApiService._internal();

  TrainStatusApiService._internal();

  factory TrainStatusApiService() {
    return _instance;
  }

  /// 運行情報を取得する
  /// operatorはTokyoMetroまたはToei
  Future<TrainInformationDto> getTrainLineInformation(
      String operator, String owlSameAs) async {
    const consumerKey = String.fromEnvironment('ODPT_API_KEY');
    debugPrint("ODPT_API_KEY: $consumerKey");
    final endpoint =
        'https://api.odpt.org/api/v4/odpt:TrainInformation?odpt:operator=odpt.Operator:$operator&odpt:railway=odpt.Railway:$owlSameAs&acl:consumerKey=$consumerKey';

    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode != 200) {
      debugPrint('Failed to load train information: ${response.body}');
      throw Exception(
          'Failed to load train information: ${response.statusCode}');
    }

    final responseBody = response.body;

    final List<dynamic> jsonList = jsonDecode(responseBody);

    if (jsonList.isEmpty) {
      throw Exception('No train information found');
    }

    final convertedJson = {
      'id': jsonList[0]['@id'],
      'type': jsonList[0]['@type'],
      'date': jsonList[0]['dc:date'],
      'context': jsonList[0]['@context'],
      'valid': jsonList[0]['dct:valid'],
      'sameAs': jsonList[0]['owl:sameAs'],
      'railway': jsonList[0]['odpt:railway'],
      'operator': jsonList[0]['odpt:operator'],
      'timeOfOrigin': jsonList[0]['odpt:timeOfOrigin'],
      'trainInformationText': jsonList[0]['odpt:trainInformationText'],
    };
    return TrainInformationDto.fromJson(convertedJson);
  }
}
