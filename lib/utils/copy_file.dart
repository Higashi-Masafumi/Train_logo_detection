import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

Future<String> copy(String assetPath) async {
  final appSupportDir = await getApplicationSupportDirectory();
  final path = '${appSupportDir.path}/$assetPath';
  debugPrint("Attempting to copy asset to path: $path");

  try {
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);

    if (!await file.exists()) {
      debugPrint("File does not exist. Copying from assets...");
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      debugPrint("File successfully copied to $path");
    } else {
      debugPrint("File already exists at $path");
    }

    return file.path;
  } catch (e) {
    debugPrint("Error copying asset: $e");
    rethrow;
  }
}