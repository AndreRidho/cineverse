import 'package:flutter/services.dart';

class DeviceInfoService {
  static const MethodChannel _channel =
      MethodChannel('com.cineverse.device_info');

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final Map result = await _channel.invokeMethod('getDeviceInfo');
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
