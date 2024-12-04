import 'dart:io';
import 'package:path/path.dart';
import 'package:train_logo_detection_app/config/assets.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import './models.dart';

class TrainRouteDatabaseHelper {
  static const _databaseName = 'train_route_database.db';
  static const _databaseVersion = 1;

  static Database? _database;

  // シングルトンパターン
  TrainRouteDatabaseHelper._privateConstructor();
  static final TrainRouteDatabaseHelper instance =
      TrainRouteDatabaseHelper._privateConstructor();

  // データベースの取得
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // データベースの初期化
  Future<Database> _initDatabase(
      {String? assetPath = Assets.trainRouteData}) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    // データベースをassetsからコピー
    final exists = await databaseExists(path);
    if (!exists) {
      ByteData data = await rootBundle.load(assetPath!);
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path, version: _databaseVersion);
  }

  // データベースのクローズ
  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  // Line_idからLineオブジェクトを取得
  Future<Line?> getLine(int id) async {
    final db = await instance.database;
    final maps = await db.query('lines', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Line.fromMap(maps.first);
    }

    return null;
  }

  // 指定したline_idのStationリストを取得（idが小さい方から順に、つまり昇順）
  Future<List<Station>> getStations(int lineId) async {
    final db = await instance.database;
    final maps = await db.query('stations',
        where: 'line_id = ?', whereArgs: [lineId], orderBy: 'id ASC');

    return List.generate(maps.length, (i) {
      return Station.fromMap(maps[i]);
    });
  }

  // station_idとline_idから全ての接続路線を取得
  Future<List<Line>> getConnection(int stationId, int lineId) async {
    final db = await instance.database;
    final maps = await db.rawQuery('''
      SELECT lines.* FROM lines
      JOIN connections ON lines.id = connections.connected_line_id
      WHERE connections.station_id = ? AND connections.line_id = ?
    ''', [stationId, lineId]);

    return List.generate(maps.length, (i) {
      return Line.fromMap(maps[i]);
    });
  }

  // 全てのstationsを取得（ただし同じ駅名が複数ある場合は、一つの駅名のみを取得）
  Future<List<Station>> getAllStations() async {
    final db = await instance.database;
    final maps = await db.rawQuery('''
      SELECT DISTINCT stations.* FROM stations
    ''');

    return List.generate(maps.length, (i) {
      return Station.fromMap(maps[i]);
    });
  }

}
