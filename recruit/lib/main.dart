import 'package:flutter/material.dart';
import './app/theme/ui/button/countdown_button.dart';
import './app/theme/ui/item/staff_item.dart';
import './app/theme/ui/view/textDes_widget.dart';

void main() {
  runApp(BottomNavigationBarExampleApp());
}

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YJBottomNavigationBar(),
    );
  }
}

class YJBottomNavigationBar extends StatefulWidget {
  const YJBottomNavigationBar({super.key});

  @override
  State<YJBottomNavigationBar> createState() => _BottomNavigationBarState();
}

class ListItem {
  final String type;
  final String title;
  final String? subtitle; // 可以为空的字段

  ListItem({required this.type, required this.title, this.subtitle});
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

class _BottomNavigationBarState extends State<YJBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    ItemListView(),
    StaffDetailState(),
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
      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (context, index) {
      //     final item = items[index];

      //     void handleTap() {
      //       // 在这里处理点击事件
      //       print('Item $index 被点击');
      //     }

      //     if (item.type == 'header') {
      //       return StaffItem(isfinish: true, onTap: handleTap);
      //     } else if (item.type == 'normal') {
      //       return StaffItem(isfinish: false, onTap: handleTap);
      //     }
      //     return SizedBox.shrink(); // 如果有未定义的类型
      //   },
      // ),
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

//お仕事一覧

class StaffDetailState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProgressModel model = ProgressModel(
      title: "就業スタッフの評価",
      items: [
        ProgressItem(type: 5, value: 53),
        ProgressItem(type: 4, value: 11),
        ProgressItem(type: 3, value: 1),
        ProgressItem(type: 2, value: 0),
        ProgressItem(type: 1, value: 0),
      ],
      sum: 65,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 控件1：图片
              CustomImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/08/30/17/26/please-2697951_1280.jpg', // 示例图片链接
              ),
              Padding(
                padding: EdgeInsets.all(15), // 设置水平内边距
                child: CountdownButton(
                    endTime: DateTime.now().add(Duration(minutes: 20))),
              ),
              // 控件3：字符串和图标
              TextDesWidget(
                title: '[未経験者歓迎！]スタッフ募集（仮）',
                iconTextPairs: [
                  [Icons.star, '10:00~11:00（休憩なし）'],
                  [Icons.home, '大阪市北区浪花町'],
                  [Icons.settings, '時給1,000円'],
                ],
              ),
              FixedCustomDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Text(
                  '待遇',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MyGridView(),
              FixedCustomDivider(),
              // 控件4：两个字符串
              TitleDescription(
                title: '業務内容',
                description: '業務内容が入ります。\n'
                    'コンビニでの勤務スタッフです！\n'
                    '主にレジ業務をお願いします！\n'
                    '☆業務経験のある方は優遇します！\n'
                    '業務内容が入ります。',
              ),
              FixedCustomDivider(),
              TitleDescription(
                title: '注意事項',
                description: '注意事項が入ります。\n'
                    '丁寧な言葉づかいができる方\n'
                    '注意事項が入ります。',
              ),
              FixedCustomDivider(),
              TitleDescription(
                title: '備考',
                description: '備考欄に文章が入ります。\n'
                    '備考欄に文章が入ります。\n'
                    '備考欄に文章が入ります。',
              ),
              CustomButton(
                title: '労働条件通知書を確認する',
                icon: Icons.drive_file_move_outline,
                isHighlight: true,
                onPressed: () {},
              ),
              Center(
                child: CustomButton(
                  title: '  （添付書類）を確認する  ',
                  icon: Icons.drive_file_move_outline,
                  isHighlight: false,
                  onPressed: () {},
                ),
              ),
              Center(
                child: CustomButton(
                  title: '  （添付書類）を確認する  ',
                  icon: Icons.drive_file_move_outline,
                  isHighlight: false,
                  onPressed: () {},
                ),
              ),
              FixedCustomDivider(),
              CustomView(
                title: 'アクセス',
                description: '大阪府大阪市北区OOO',
                imageUrl:
                    'https://i0.wp.com/suku3c.com/wp-content/uploads/2020/07/Google-map.jpg?w=768&ssl=1',
                onButtonPressed: () {
                  // 在这里处理按钮点击事件
                  print('按钮被点击');
                },
              ),
              FixedCustomDivider(),
              EvaluationView(progressModel: model),
              FullCustomDivider(),
              CustomButtonRow(
                buttonText: '応募する',
                onMainButtonPressed: () {
                  // 主按钮点击事件
                  print('Main button pressed');
                },
                onFavoriteButtonPressed: () {
                  // 爱心按钮点击事件
                  print('Favorite button pressed');
                },
                onSettingsButtonPressed: () {
                  // 设置按钮点击事件
                  print('Settings button pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 控件1：自定义图片控件
class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        double height = width / 2;
        return Container(
          width: width,
          height: height,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class FixedCustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFededed), // 固定颜色
      thickness: 2.0, // 固定厚度
      indent: 16.0, // 固定左侧缩进
      endIndent: 16.0, // 固定右侧缩进
    );
  }
}

class FullCustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFededed), // 固定颜色
      thickness: 2.0, // 固定厚度
      indent: 0, // 固定左侧缩进
      endIndent: 0,
    );
  }
}

class TitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleDescription({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0, // 较大的字体
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0), // 添加一些间距
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0, // 较小的字体
            ),
          ),
        ],
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  // 创建一个模型数组
  final List<GridItemModel> items = [
    GridItemModel(icon: Icons.home, text: '交通費支給'),
    GridItemModel(icon: Icons.star, text: '高校生歓迎'),
    GridItemModel(icon: Icons.settings, text: '車通勤可'),
    GridItemModel(icon: Icons.info, text: '未経験者歓迎'),
    GridItemModel(icon: Icons.contact_mail, text: '制服あり'),
    GridItemModel(icon: Icons.help, text: 'バイク\n自転車通勤可'),
    GridItemModel(icon: Icons.camera, text: 'シニア歓迎'),
    GridItemModel(icon: Icons.map, text: 'ネイルOK'),
    GridItemModel(icon: Icons.alarm, text: '髪色自由'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        shrinkWrap: true, // 允许GridView根据其内容调整大小
        physics: NeverScrollableScrollPhysics(), // 禁止GridView自身滚动
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 每行4个元素
          childAspectRatio: 1 / 1, // 宽高比为1:0.8
          crossAxisSpacing: 8.0, // 列间距
          mainAxisSpacing: 8.0, // 行间距
        ),
        itemCount: items.length, // 根据数据项的数量生成相应的网格项
        itemBuilder: (context, index) {
          return GridItem(
            model: items[index],
          );
        },
      ),
    );
  }
}

// 定义模型类
class GridItemModel {
  final IconData icon;
  final String text;

  GridItemModel({required this.icon, required this.text});
}

class GridItem extends StatelessWidget {
  final GridItemModel model;

  const GridItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.lightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Icon(
              model.icon,
              size: 50,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Center(
              child: Text(
                model.text,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isHighlight;
  final VoidCallback onPressed;
  final double height;

  static const Color customRed = Color(0xFFFF6767);

  const CustomButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.isHighlight,
    required this.onPressed,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isHighlight ? customRed : Colors.white;
    Color textColor = isHighlight ? Colors.white : customRed;

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Container(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, // 背景颜色
            foregroundColor: textColor, // 文字和图标颜色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height / 2), // 圆角半径
            ),
            side: BorderSide(color: customRed, width: 2),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 内边距
          ),
          icon: Icon(
            icon, // 图标
            color: textColor, // 图标颜色
          ),
          label: Text(
            title, // 文字
            style: TextStyle(
              color: textColor, // 文字颜色
              fontSize: 14, // 文字大小
            ),
          ),
        ),
      ),
    );
  }
}

class CustomView extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onButtonPressed;

  const CustomView({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double width = constraints.maxWidth;
              double height = width / 2; // Maintain a 2:1 aspect ratio
              return Container(
                width: width,
                height: height,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: onButtonPressed,
            child: Text(
              '地図アプリで確認する',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  final double progress;

  const ProgressRow({
    required this.leftText,
    required this.rightText,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(leftText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(width: 10),
          Expanded(
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Color(0xFFFFC719),
              minHeight: 5,
            ),
          ),
          SizedBox(width: 10),
          Text(rightText),
        ],
      ),
    );
  }
}

/*
{
    "title": "Example Title",
    "items": [
        { "type": 5, "value": 53 },
        { "type": 4, "value": 11 },
        { "type": 3, "value": 1 },
        { "type": 2, "value": 0 },
        { "type": 1, "value": 0 }
    ],
    "sum": 49
}
 */
class EvaluationView extends StatelessWidget {
  final ProgressModel progressModel;

  EvaluationView({required this.progressModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            progressModel.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          for (var item in progressModel.items)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10), // 添加垂直方向的间距
              child: ProgressRow(
                leftText: ' ${item.type}',
                rightText: '${item.value}件',
                progress: item.value / progressModel.sum,
              ),
            ),
        ],
      ),
    );
  }
}

class ProgressModel {
  final String title;
  final List<ProgressItem> items;
  final int sum;

  ProgressModel({
    required this.title,
    required this.items,
    required this.sum,
  });
}

class ProgressItem {
  final int type;
  final int value;

  ProgressItem({
    required this.type,
    required this.value,
  });
}

class CustomButtonRow extends StatelessWidget {
  final String buttonText;
  final VoidCallback onMainButtonPressed;
  final VoidCallback onFavoriteButtonPressed;
  final VoidCallback onSettingsButtonPressed;

  const CustomButtonRow({
    Key? key,
    required this.buttonText,
    required this.onMainButtonPressed,
    required this.onFavoriteButtonPressed,
    required this.onSettingsButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75, // 设置总高度为 60
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double containerHeight = constraints.maxHeight;

          return Row(
            children: [
              // 左边按钮
              Expanded(
                flex: 6, // 占据60%的宽度
                child: ElevatedButton(
                  onPressed: onMainButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF48ABFF), // 设置背景色为 #48ABFF
                    padding: EdgeInsets.symmetric(
                      vertical: (containerHeight - 40) / 2, // 调整内边距以适应高度
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          containerHeight / 2), // 圆角为高度的一半
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 中心的文本
                      Center(
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              fontSize: 15, color: Colors.white), // 白色文字
                        ),
                      ),
                      // 右侧的箭头
                      Positioned(
                        right: 25,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 14,
                        ), // 白色箭头
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10), // 左右按钮之间的间距
              IconButton(
                onPressed: onSettingsButtonPressed,
                icon: Icon(Icons.settings),
                iconSize: 30,
              ),
              IconButton(
                onPressed: onFavoriteButtonPressed,
                icon: Icon(Icons.favorite_border),
                iconSize: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
