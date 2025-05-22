import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruit/app/provider/all_in_one_provider.dart';
import 'package:recruit/app/theme/ui/bar/badge_bottom_nav_icon.dart';
import 'package:recruit/app/theme/ui/bar/tab_base_item.dart';
import 'package:recruit/app/theme/ui/item/staff_item.dart';
import 'package:recruit/app/utils/click_debouncer.dart';

class ItemListView extends StatelessWidget {
  // final List<ListItem> items;

  final List<ListItem> items = [
    ListItem(type: 'header', title: 'Header 1'),
    ListItem(type: 'normal', title: 'Item 1', subtitle: 'Subtitle 1'),
    ListItem(type: 'normal', title: 'Item 2', subtitle: 'Subtitle 2'),
    ListItem(type: 'header', title: 'Header 2'),
    ListItem(type: 'normal', title: 'Item 3', subtitle: 'Subtitle 3'),
  ];

  ItemListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        void handleTap() {
          // 在这里处理点击事件
          print('Item $index 被点击');
        }

        if (item.type == 'header') {
          return StaffItem(isfinish: true, onTap: handleTap);
        } else if (item.type == 'normal') {
          return StaffItem(isfinish: false, onTap: handleTap);
        }
        return SizedBox.shrink(); // 如果有未定义的类型
      },
    );
  }
}

class ListItem {
  final String type;
  final String title;
  final String? subtitle; // 可以为空的字段

  ListItem({required this.type, required this.title, this.subtitle});
}

final navigatorKeys = <TabBaseItem, GlobalKey<NavigatorState>>{
  for (var item in TabBaseItem.values) item: GlobalKey<NavigatorState>(),
};

class HomeBase extends ConsumerStatefulWidget {
  const HomeBase({super.key});

  @override
  ConsumerState<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends ConsumerState<HomeBase> {
  late TabBaseItem currentTab;
  late Set<TabBaseItem> loadedPages;

  @override
  void initState() {
    super.initState();

    // 初期タブ設定
    currentTab = navigatorKeys.keys.first;
    loadedPages = {currentTab};
  }

  /// 指定されたインデックスに対応するタブを選択し、
  /// Navigator の context を取得する非同期メソッド
  Future<BuildContext> selectTab(int index) async {
    // インデックスから該当のタブを取得
    final selectedTab = navigatorKeys.keys.toList()[index];
    final navigatorKey = navigatorKeys[selectedTab];

    const maxWaitTime = 1000; // 最大待機時間（ミリ秒）
    int elapsedTime = 0; // 経過時間のカウンタ

    setState(() {
      // ページが未ロードであれば、ロード済みリストに追加
      if (!loadedPages.contains(selectedTab)) {
        loadedPages.add(selectedTab);
      }

      // Navigatorスタックを初期画面まで戻す（ポップ）
      navigatorKey?.currentState?.popUntil((route) => route.isFirst);

      // 現在のタブ状態を更新
      currentTab = selectedTab;
    });

    // `navigatorKey.currentContext` が null の場合はまだ context が準備できていないので、
    // 最大 3 秒間まで待機（50ms ごとにリトライ）
    //
    // 理由：
    // `Navigator` の build が非同期的に完了するため、
    // `setState` の直後に `navigatorKey.currentContext` にアクセスしても null の場合がある。
    // そのため、context が取得できるまでポーリングする必要がある。
    while (navigatorKey?.currentContext == null) {
      if (elapsedTime >= maxWaitTime) return context; // タイムアウト時は現在の context を返す
      await Future.delayed(const Duration(milliseconds: 50));
      elapsedTime += 50;
    }

    // context の取得に成功した場合は返す
    return navigatorKey!.currentContext!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigatorKeys.keys.toList().indexOf(currentTab),
        children: navigatorKeys.keys.map((tabItem) {
          if (!loadedPages.contains(tabItem)) return const SizedBox.shrink();
          return Navigator(
            key: navigatorKeys[tabItem],
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => tabItem.page,
            ),
          );
        }).toList(),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigatorKeys.keys.toList().indexOf(currentTab),
        items: navigatorKeys.keys.toList().asMap().entries.map((entry) {
          final index = entry.key;
          final tabItem = entry.value;

          final iconWidget = Icon(
            currentTab == tabItem ? tabItem.selectIcon : tabItem.icon,
            size: 24,
          );

          return BottomNavigationBarItem(
            icon: index == 1
                ? BadgeBottomNavIcon(
                    icon: iconWidget,
                    countProvider: keepCountProvider,
                  )
                : iconWidget,
            label: tabItem.title,
          );
        }).toList(),
        onTap: (index) {
          final selectedTab = navigatorKeys.keys.toList()[index];

          if (!loadedPages.contains(selectedTab)) {
            setState(() {
              loadedPages.add(selectedTab);
            });
          }

          if (currentTab == selectedTab) {
            if (index != 0) {
              if (ClickDebouncer.canRefresh(selectedTab.title)) {
                // フッターメニューの選択状態を更新し、ListViewを最上部にスクロールさせるトリガーにする
                ref.read(footerMenuClickProvider.notifier).state = selectedTab;
              }
            }
          } else {
            setState(() {
              currentTab = selectedTab;
            });
          }
        },
      ),
    );
  }
}
