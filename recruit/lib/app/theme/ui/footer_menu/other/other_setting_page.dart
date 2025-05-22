import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruit/app/theme/ui/bar/gradient_appbar.dart';

class OtherSettingPage extends ConsumerStatefulWidget {
  const OtherSettingPage({super.key});

  @override
  ConsumerState<OtherSettingPage> createState() => _OtherSettingPageState();
}

class _OtherSettingPageState extends ConsumerState<OtherSettingPage> {
  @override
  void initState() {
    super.initState();
    // 初期化処理
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        appBar: AppBar(
          title: const Text('その他の設定'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ここに設定項目を追加してください'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 何かのアクション
              },
              child: const Text('ボタン'),
            ),
          ],
        ),
      ),
    );
  }
}
