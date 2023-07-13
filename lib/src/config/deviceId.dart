import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceId {
  static final storage = FlutterSecureStorage();

  static Future<void> saveDeviceId(String deviceId) async {
    await storage.write(key: 'deviceId', value: deviceId);
  }
}
