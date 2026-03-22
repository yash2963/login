import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerService {
  static final FilePickerService _instance = FilePickerService._internal();
  factory FilePickerService() => _instance;
  FilePickerService._internal();

  bool _isProcessRunning = false;

  Future<PlatformFile?> PickSingleFile({
    List<String>? allowedExtensions,
    FileType type = FileType.custom,
  }) async {
    if (_isProcessRunning) {
      debugPrint('FilePickerService: A process is already in  progress');
      return null;
    }
    _isProcessRunning = true;
    // final FilePicker picker = FilePicker.platform as FilePicker;

    // if (FilePicker.platform is! FilePickerIO) {
    // final picker = FilePickerIO();
    // }
    // if (Platform.isAndroid || Platform.isIOS) {
    //   FilePicker.platform;
    // }
    // PermissionStatus status;
    try {
      // if (Platform.isAndroid && (await _getAndroidVersion() >= 13)) {
      //   status = await Permission.photos.request();
      // } else {
      //   status = await Permission.storage.request();
      // }
      bool hasPermission = await _handlePermission();
      if (!hasPermission) {
        debugPrint('FilePickerSerivce: Permission denied by user');
        return null;
      }
      // if (status.isGranted)
      // {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["jpg", "img", "png", "pdf", "docs"],
        allowMultiple: false,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      }
      // }
      return null;
    } catch (e) {
      print("User cancelled the picker: $e");
      return null;
    } finally {
      _isProcessRunning = false;
    }
  }

  static Future<bool> _handlePermission() async {
    if (!Platform.isAndroid) return true;
    if (await Permission.storage.isGranted ||
        await Permission.photos.isGranted) {
      return true;
      // return int.parse(Platform.version.split(' ')[0].split('.')[0]);
    }
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      if (Platform.isAndroid) Permission.photos,
    ].request();
    return statuses.values.any((status) => status.isGranted);
  }
}
