import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'package:train_logo_detection_app/config/assets.dart';
import 'package:train_logo_detection_app/data/datasource/line/odpt_line_model.dart';
import 'package:train_logo_detection_app/data/datasource/station/odpt_station_model.dart';
import 'package:train_logo_detection_app/data/datasource/connection/odpt_connection_model.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class RailwayDatabaseService {
  static final RailwayDatabaseService _instance =
      RailwayDatabaseService._internal();
  static Database? _database;

  // プライベートコンストラクタ
  RailwayDatabaseService._internal();

  // シングルトンインスタンスを取得
  factory RailwayDatabaseService() {
    return _instance;
  }

  // データベースインスタンスを取得（初回呼び出し時に初期化）
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'railway.db');

      debugPrint('Initializing database at path: $path');

      if (await databaseExists(path)) {
        debugPrint('Database already exists');
      } else {
        debugPrint('Creating new database from assets');
        await Directory(dirname(path)).create(recursive: true);
        ByteData data = await rootBundle.load(Assets.railwayData);
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);
      }

      final db = await openDatabase(path);
      debugPrint('Database initialized successfully');
      return db;
    } catch (e) {
      debugPrint('Database initialization error: $e');
      rethrow;
    }
  }

  Future<OdptLine?> getLine(String lineId) async {
    final db = await database;
    final maps = await db.query(
      'lines',
      where: 'id = ?',
      whereArgs: [lineId],
    );

    if (maps.isNotEmpty) {
      final dbMap = Map<String, dynamic>.from(maps.first);
      return OdptLine.fromJson(_convertLineKeys(dbMap));
    }
    return null;
  }

  Map<String, dynamic> _convertLineKeys(Map<String, dynamic> dbMap) {
    return {
      'id': dbMap['id'],
      'type': dbMap['type'],
      'title': dbMap['title'],
      'owlSameAs': dbMap['owl_same_as'],
      'color': dbMap['color'],
      'lineCode': dbMap['line_code'],
      'operator': dbMap['operator'],
      'lineTitle': json.decode(dbMap['line_title'] as String),
      'stationOrder': json.decode(dbMap['station_order'] as String),
      'ascendingDirection': dbMap['ascending_direction'],
      'descendingDirection': dbMap['descending_direction'],
    };
  }

  Map<String, dynamic> _convertStationKeys(Map<String, dynamic> dbMap) {

    final modelMap = {
      'id': dbMap['id'],
      'type': dbMap['type'],
      'latitude': dbMap['latitude'],
      'longitude': dbMap['longitude'],
      'title': dbMap['title'],
      'owlSameAs': dbMap['owl_same_as'],
      'line': dbMap['line'],
      'operator': dbMap['operator'],
      'stationCode': dbMap['station_code'],
      'stationTitle': json.decode(dbMap['station_title'] as String),
      'passengerSurvey': dbMap['passenger_survey'] != null
          ? json.decode(dbMap['passenger_survey'] as String)
          : null,
      'stationTimetable': dbMap['station_timetable'] != null
          ? json.decode(dbMap['station_timetable'] as String)
          : null,
      'connectingLines': dbMap['connecting_lines'] != null
          ? json.decode(dbMap['connecting_lines'] as String)
          : null,
      'connectingStations': dbMap['connecting_stations'] != null
          ? json.decode(dbMap['connecting_stations'] as String)
          : null,
    };

    return modelMap;
  }

  Future<OdptLine?> getLinebyTitle(String title) async {
    final db = await database;
    debugPrint('Searching for line with title: $title');

    final maps = await db.query(
      'lines',
      where: 'title = ?',
      whereArgs: [title],
    );

    if (maps.isNotEmpty) {
      final dbMap = Map<String, dynamic>.from(maps.first);
      final modelMap = _convertLineKeys(dbMap);
      return OdptLine.fromJson(modelMap);
    }
    return null;
  }

  Future<List<OdptStation>> getStationsByLine(String lineId) async {
    final db = await database;

    final maps = await db.query(
      'stations',
      where: 'id = ?',
      whereArgs: [lineId],
      orderBy: 'station_code',
    );

    return Future.wait(maps.map((map) async {
      final dbMap = Map<String, dynamic>.from(map);

      final modelMap = _convertStationKeys(dbMap);

      try {
        final station = OdptStation.fromJson(modelMap);
        return station;
      } catch (e) {
        debugPrint('Error converting station: $e');
        rethrow;
      }
    }));
  }

  Future<List<OdptLineConnection>> getLineConnections(String stationId) async {
    final db = await database;
    final maps = await db.query(
      'line_connections',
      where: 'station_id = ?',
      whereArgs: [stationId],
    );

    return maps.map((map) => OdptLineConnection.fromJson(map)).toList();
  }

  Future<List<OdptStationConnection>> getStationConnections(
      String stationId) async {
    final db = await database;
    final maps = await db.query(
      'station_connections',
      where: 'station_id = ?',
      whereArgs: [stationId],
    );

    return maps.map((map) => OdptStationConnection.fromJson(map)).toList();
  }

  Future<OdptStation?> getStationById(String stationId) async {
    final db = await database;
    final result = await db.query(
      'stations',
      where: 'id = ?',
      whereArgs: [stationId],
    );

    if (result.isNotEmpty) {
      final dbMap = Map<String, dynamic>.from(result.first);
      return OdptStation.fromJson(_convertStationKeys(dbMap));
    }
    return null;
  }

  Future<OdptLine?> getLineByOwlSameAs(String owlSameAs) async {
    final db = await database;
    final maps = await db.query(
      'lines',
      where: 'owl_same_as = ?',
      whereArgs: [owlSameAs],
    );

    if (maps.isNotEmpty) {
      final dbMap = Map<String, dynamic>.from(maps.first);
      return OdptLine.fromJson(_convertLineKeys(dbMap));
    }
    return null;
  }

  Future<OdptStation?> getStationByOwlSameAs(String owlSameAs) async {
    final db = await database;
    final result = await db.query(
      'stations',
      where: 'owl_same_as = ?',
      whereArgs: [owlSameAs],
    );

    if (result.isNotEmpty) {
      final dbMap = Map<String, dynamic>.from(result.first);
      return OdptStation.fromJson(_convertStationKeys(dbMap));
    }
    return null;
  }
}
