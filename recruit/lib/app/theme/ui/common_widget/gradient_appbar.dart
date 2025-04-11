import 'package:flutter/material.dart';

const double appBarCircular = 15.0;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const CustomAppBar({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    // デバイスのステータスバーの高さを取得する
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    // AppBar（ナビゲーションバー）のデフォルトの高さ
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
            painter: HollowPainter(appBarHeight: appBarHeight),
          ),
        ),
        appBar,
      ],
    );
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}

class HollowPainter extends CustomPainter {
  final double appBarHeight;

  HollowPainter({required this.appBarHeight});

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
          Color(0xFFFFA726),
          Color(0xFFFF7043),
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
