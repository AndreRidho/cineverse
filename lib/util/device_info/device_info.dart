import 'package:flutter/services.dart';

class DeviceInfoService {
  static const MethodChannel _channel =
      MethodChannel('com.cineverse.device_info');

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      print('debug deviceinfo');
      final Map result = await _channel.invokeMethod('getDeviceInfo');
      print('debug deviceinfo result $result');
      return Map<String, dynamic>.from(result);
    } catch (e) {
      return {
        'model': 'Unavailable',
        'osVersion': 'Unavailable',
        'storage': 'Unavailable',
        'battery': 'Unavailable',
      };
    }
  }
}
