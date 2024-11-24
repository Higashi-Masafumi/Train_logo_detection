import 'package:flutter/material.dart';

class Line {
  final int? id;
  final String name;
  final String colorCode;

  Line({
    this.id,
    required this.name,
    required this.colorCode,
  });

  // データベースから取得したMapをLineオブジェクトに変換
  factory Line.fromMap(Map<String, dynamic> map) {
    return Line(
      id: map['id'],
      name: map['name'],
      colorCode: map['color'],
    );
  }

  // LineオブジェクトをMapに変換 (データベースに挿入・更新用)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': colorCode,
    };
  }

  // FlutterのColor型に変換
  Color get color {
    // #RRGGBB形式をColorに変換
    final hexColor = colorCode.replaceAll("#", "");
    return Color(int.parse("FF$hexColor", radix: 16)); // ARGBで透明度FF (不透明)
  }
}


class Station {
  final int? id;
  final int lineId;
  final String name;
  final String stationNumber;
  final String? iconUrl;

  Station({
    this.id,
    required this.lineId,
    required this.name,
    required this.stationNumber,
    this.iconUrl,
  });

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      id: map['id'],
      lineId: map['line_id'],
      name: map['name'],
      stationNumber: map['station_number'],
      iconUrl: map['icon_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'line_id': lineId,
      'name': name,
      'station_number': stationNumber,
      'icon_url': iconUrl,
    };
  }
}


class Connection {
  final int? id;
  final int lineId;
  final int stationId;
  final String connectedLine;
  final String? iconUrl;

  Connection({
    this.id,
    required this.lineId,
    required this.stationId,
    required this.connectedLine,
    this.iconUrl,
  });

  factory Connection.fromMap(Map<String, dynamic> map) {
    return Connection(
      id: map['id'],
      lineId: map['line_id'],
      stationId: map['station_id'],
      connectedLine: map['connected_line'],
      iconUrl: map['icon_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'line_id': lineId,
      'station_id': stationId,
      'connected_line': connectedLine,
      'icon_url': iconUrl,
    };
  }
}
