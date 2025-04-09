import 'package:flutter/material.dart';
import '../flavors.dart';

// 環境変数から HOST_SERVER_URL の値を取得する（--dart-define で渡す）
const String apiBaseUrl = String.fromEnvironment('HOST_SERVER_URL');

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      body: Center(child: Text('Hello ${F.title} \n  $apiBaseUrl')),
    );
  }
}
