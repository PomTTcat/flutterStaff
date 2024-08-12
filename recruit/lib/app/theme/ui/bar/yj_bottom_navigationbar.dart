import 'package:flutter/material.dart';
import 'package:recruit/app/theme/ui/item/staff_item.dart';
import 'package:recruit/app/theme/ui/widget/staffdetial_widget.dart';

class YJBottomNavigationBar extends StatefulWidget {
  const YJBottomNavigationBar({super.key});

  @override
  State<YJBottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<YJBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    ItemListView(),
    StaffDetailWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<ListItem> items = [
    ListItem(type: 'header', title: 'Header 1'),
    ListItem(type: 'normal', title: 'Item 1', subtitle: 'Subtitle 1'),
    ListItem(type: 'normal', title: 'Item 2', subtitle: 'Subtitle 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('大阪府'),
      ),
      // body: (StaffDetailState()),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'お仕事一覧',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'マイページ',
          ),
        ],
        selectedItemColor: Colors.red, // 图标选中时的颜色
        unselectedItemColor: Colors.grey, // 未选中时的图标和文本颜色
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

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
