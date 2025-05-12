import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruit/services/device_uuid_manager.dart';

import 'app.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  /// Flutterバインディングの初期化を行う
  WidgetsFlutterBinding.ensureInitialized();

  /// UUID を初期化
  final uuid = await initializeUUIDAndGet();
  debugPrint(uuid);

  runApp(const App());
}

/// UUID を初期化
Future<String> initializeUUIDAndGet() async {
  final container = ProviderContainer();

  // DeviceUUIDManager を取得し、初期化処理を行う
  final uuidManager = container.read(deviceUUIDManagerProvider);
  await uuidManager.initialize();

  // 初期化後の UUID を返却
  return uuidManager.getUuid();
}
