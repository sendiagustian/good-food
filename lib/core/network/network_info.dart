import 'dart:io';

import 'package:flutter/material.dart';

class NetworkInfo {
  Future<bool> get isConnected => checkConnection();

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
  }
}
