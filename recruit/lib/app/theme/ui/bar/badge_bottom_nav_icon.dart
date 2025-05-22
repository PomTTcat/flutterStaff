import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;

class BadgeBottomNavIcon extends ConsumerWidget {
  final Widget icon;
  final StateProvider<int> countProvider;

  const BadgeBottomNavIcon({
    super.key,
    required this.icon,
    required this.countProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);

    if (count == 0) {
      return icon;
    }

    /// カウントが99を超えた場合は「99+」と表示、それ以外は数字をそのまま表示
    final String badgeText = count > 99 ? '99+' : '$count';

    /// バッジ内の文字サイズをカウントの範囲に応じて調整
    double fontSize;
    if (count <= 10) {
      fontSize = 9.0; // 1〜10：文字サイズ 9.0
    } else if (count <= 99) {
      fontSize = 8.0; // 11〜99：文字サイズ 8.0
    } else {
      fontSize = 7.0; // 99+：文字サイズ 7.0
    }

    return badges.Badge(
      showBadge: true,
      position: badges.BadgePosition.topEnd(top: -2, end: -2),
      badgeStyle: const badges.BadgeStyle(
        padding: EdgeInsets.all(3),
        badgeColor: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        elevation: 0,
      ),
      badgeContent: Text(
        badgeText,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
      child: icon,
    );
  }
}
