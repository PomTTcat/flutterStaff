import 'package:flutter/material.dart';
import 'package:recruit/app/theme/ui/bar/yj_bottom_navigationbar.dart';
import 'package:recruit/app/theme/ui/widget/staffdetial_widget.dart';

class TabBaseItem {
  final int id;
  final String title;
  final IconData icon;
  final IconData selectIcon;
  final Widget page;

  const TabBaseItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.selectIcon,
    required this.page,
  });

  static TabBaseItem search = TabBaseItem(
    id: 0,
    title: '検索',
    icon: Icons.search_outlined,
    selectIcon: Icons.search,
    page: ItemListView(),
    // page: StaffDetailWidget(),
  );

  static TabBaseItem keep = TabBaseItem(
    id: 1,
    title: 'キープ',
    icon: Icons.bookmark_border,
    selectIcon: Icons.bookmark,
    page: StaffDetailWidget(),
  );

  static const TabBaseItem history = TabBaseItem(
    id: 2,
    title: '履歴',
    icon: Icons.history,
    selectIcon: Icons.history_toggle_off,
    page: PlaceholderPage(title: '履歴ページ'),
  );

  static const TabBaseItem applied = TabBaseItem(
    id: 3,
    title: '応募済み',
    icon: Icons.mail_outline,
    selectIcon: Icons.mark_email_read,
    page: PlaceholderPage(title: '応募済みページ'),
  );

  static const TabBaseItem spotoba = TabBaseItem(
    id: 4,
    title: 'スポバ',
    icon: Icons.recommend_outlined,
    selectIcon: Icons.recommend,
    page: PlaceholderPage(title: 'スポバページ'),
  );

  static List<TabBaseItem> get values => [
        search,
        keep,
        history,
        applied,
        spotoba,
      ];
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
