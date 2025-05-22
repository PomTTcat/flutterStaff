import 'package:flutter/material.dart';

const double appBarCircular = 20.0;

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const GradientAppBar({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    // デバイスのステータスバーの高さを取得する
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // AppBarのデフォルトの高さ
    double appBarHeight = appBar.preferredSize.height;

    // AppBarの高さ（appBarHeight）と角丸の高さ（appBarCircular）を合計して、CustomPainterで使用する高さを計算
    final double customPaintH = appBarHeight + appBarCircular;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: statusBarHeight,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(double.infinity, customPaintH),
            painter: HollowCircular(appBarHeight: appBarHeight),
          ),
        ),
        appBar,
      ],
    );
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}

class HollowCircular extends CustomPainter {
  final double appBarHeight;

  HollowCircular({required this.appBarHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(
          0, // X座標（左端）
          appBarHeight, // Y座標（上からの位置）
          size.width, // 横幅
          appBarCircular, // 高さ
        ),
        topLeft: const Radius.circular(appBarCircular),
        topRight: const Radius.circular(appBarCircular),
      ))
      ..fillType = PathFillType.evenOdd;

    Rect gradientRect = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint hollowPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF2193B0),
          Color(0xFF6DD5ED),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(gradientRect);
    canvas.drawPath(path, hollowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
