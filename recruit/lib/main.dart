import 'package:flutter/material.dart';
import 'UI/jobDetail/button/countdown_button.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('示例页面')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 控件1：图片
              CustomImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/08/30/17/26/please-2697951_1280.jpg', // 示例图片链接
              ),
              CountdownButton(endTime: DateTime.now().add(Duration(hours: 1))),
              // 控件2：按钮
              // Padding(
              //   padding: EdgeInsets.only(left: 10),
              //   child: CountdownButton(
              //       endTime: DateTime.now().add(Duration(hours: 1))),
              // ),
              // 控件3：字符串和图标
              CustomTextWithIcon(
                mainText: '第一行的字符串',
                icon: Icons.info,
                secondaryText: '小图标旁边的字符串',
              ),

              // 控件4：两个字符串
              CustomTitleSubtitle(
                title: '标题',
                subtitle: '下面的句子',
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

// 控件3：自定义字符串和图标控件
class CustomTextWithIcon extends StatelessWidget {
  final String mainText;
  final IconData icon;
  final String secondaryText;

  const CustomTextWithIcon({
    required this.mainText,
    required this.icon,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mainText, style: TextStyle(fontSize: 18)),
          Row(
            children: [
              Icon(icon, size: 16),
              SizedBox(width: 8),
              Text(secondaryText, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}

// 控件4：自定义标题和副标题控件
class CustomTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTitleSubtitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
