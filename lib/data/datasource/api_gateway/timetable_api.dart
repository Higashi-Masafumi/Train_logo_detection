import 'dart:convert';

import 'package:http/http.dart' as http;
import '../timetable/odpt_timetable_model.dart';
import 'package:flutter/foundation.dart';

class TimetableApiService {
  static final TimetableApiService _instance = TimetableApiService._internal();

  TimetableApiService._internal();

  factory TimetableApiService() {
    return _instance;
  }

  // keyを変換する
  Map<String, dynamic> _convertStationTimetableKeys(
      Map<String, dynamic> dbMap) {
    debugPrint('Converting keys for: ${dbMap['odpt:stationTimetableObject']}');

    return {
      'id': dbMap['@id'],
      'type': dbMap['@type'],
      'date': dbMap['dc:date'],
      'context': dbMap['@context'],
      'issued': dbMap['dct:issued'],
      'sameAs': dbMap['owl:sameAs'],
      'railway': dbMap['odpt:railway'],
      'station': dbMap['odpt:station'],
      'calendar': dbMap['odpt:calendar'],
      'operatorId': dbMap['odpt:operator'],
      'railDirection': dbMap['odpt:railDirection'],
      'stationTimetableObjects': (dbMap['odpt:stationTimetableObject'] as List?)
              ?.map((obj) => {
                    'train': obj['odpt:train'],
                    'trainType': obj['odpt:trainType'],
                    'trainNumber': obj['odpt:trainNumber'],
                    'departureTime': obj['odpt:departureTime'],
                    'destinationStation': obj['odpt:destinationStation'],
                  })
              .toList() ??
          [],
    };
  }

  /// 駅時刻表を取得する
  /// stationOwlSameAsはodpt.StationのowlSameAs
  /// operatorはodpt.Operatorのid
  Future<List<StationTimetableDto>> getStationTimetable(
      String operator, String stationOwlSameAs) async {
    const consumerKey = String.fromEnvironment('ODPT_API_KEY');
    debugPrint("consumerKey: $consumerKey");
    final endpoint =
        'https://api.odpt.org/api/v4/odpt:StationTimetable?odpt:operator=odpt.Operator:$operator&acl:consumerKey=$consumerKey&odpt:station=odpt.Station:$stationOwlSameAs';
    debugPrint("Endpoint: $endpoint");

    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode != 200) {
      throw Exception('Failed to load timetable: ${response.statusCode}');
    }

    final responseBody = response.body;

    final dbMap = jsonDecode(responseBody);

    if (dbMap is List) {
      debugPrint('Response is a List of length: ${dbMap.length}');
      return dbMap.map((obj) {
        return StationTimetableDto.fromJson(_convertStationTimetableKeys(obj));
      }).toList();
    }

    throw Exception('Unexpected response format');
  }

  /// 駅時刻表を取得する
  /// stationOwlSameAsはodpt.StationのowlSameAs
  /// operatorはodpt.Operatorのid
  /// calendarはSaturdayHoliday or Weekday
  Future<List<StationTimetableDto>> getStationTimetableByCalendar(
      String stationOwlSameAs, String operator, String calendar) async {
    const consumerKey = String.fromEnvironment('ODPT_CONSUMER_KEY');
    final endpoint =
        'https://api.odpt.org/api/v4/odpt:StationTimetable?odpt:operator=odpt.Operator:$operator&acl:consumerKey=$consumerKey&odpt:station=odpt.Station:$stationOwlSameAs&odpt:calendar=odpt.Calendar:$calendar';
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode != 200) {
      debugPrint('Failed to load timetable: $response');
      throw Exception('Failed to load timetable: ${response.statusCode}');
    }

    final dbMap = jsonDecode(response.body);
    return (dbMap['odpt:stationTimetableObject'] as List?)
            ?.map((obj) =>
                StationTimetableDto.fromJson(_convertStationTimetableKeys(obj)))
            .toList() ??
        [];
  }
}
