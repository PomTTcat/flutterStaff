import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recruit/app/theme/themes.dart';
import 'package:recruit/app/theme/ui/bar/footer_menu_base.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      title: F.title,
      debugShowCheckedModeBanner: false,
      home: _flavorBanner(child: const HomeBase(), show: kDebugMode),
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
