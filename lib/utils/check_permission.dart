import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermissions() async {
  List<Permission> permissions = [];

  var cameraStatus = await Permission.camera.status;
  debugPrint("Camera status: $cameraStatus");
  if (!cameraStatus.isGranted) permissions.add(Permission.camera);

  var locationStatus = await Permission.locationWhenInUse.status;
  debugPrint("Location status: $locationStatus");
  if (!locationStatus.isGranted) permissions.add(Permission.locationWhenInUse);

  if (permissions.isEmpty) return true;

  try {
    debugPrint("Requesting permissions: $permissions");
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    return statuses.values.every((status) => status.isGranted);
  } catch (e) {
    debugPrint("Error checking permissions: $e");
    return false;
  }
}
