import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// デバイスのUUIDを管理するマネージャークラス
class DeviceUUIDManager {
  String? _cachedDeviceId;

  /// 初期化処理（非同期でUUIDを取得してキャッシュ）
  Future<void> initialize() async {
    if (_cachedDeviceId != null) return;

    if (Platform.isAndroid) {
      _cachedDeviceId = await FlutterUdid.udid;
    } else if (Platform.isIOS) {
      final info = await DeviceInfoPlugin().iosInfo;
      _cachedDeviceId = info.identifierForVendor;
    } else {
      _cachedDeviceId = '';
    }
  }

  /// キャッシュ済みのUUIDを取得（未初期化の場合は例外）
  String getUuid() {
    if (_cachedDeviceId == null) {
      throw StateError('DeviceUUIDManager has not been initialized.');
    }
    return _cachedDeviceId!;
  }
}

/// DeviceUUIDManager のシングルトンプロバイダー（ステートレス）
final deviceUUIDManagerProvider = Provider<DeviceUUIDManager>((ref) {
  return DeviceUUIDManager();
});
