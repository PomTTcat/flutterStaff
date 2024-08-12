import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widget/textDes_widget.dart';
import '../button/countdown_button.dart';

//応募締切
// ignore: must_be_immutable
class StaffItem extends StatelessWidget {
  bool isfinish = false;
  final VoidCallback onTap;

  StaffItem({required this.isfinish, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(16),
      child: ClipRRect(
        // 添加 ClipRRect 来裁剪子部件的边角
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://cdn.pixabay.com/photo/2017/08/30/17/26/please-2697951_1280.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150, // 设置图片的高度
                ),
                isfinish
                    ? Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.all(0),
                          child: TriangleTextWidget(),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(15), // 设置水平内边距
                        child: CountdownButton(
                            endTime: DateTime.now().add(Duration(minutes: 20))),
                      ),
              ],
            ),
            MiddleRowWidget(
                text: "GO速給X多", onAddPressed: () {}, onRemovePressed: () {}),
            TextDesWidget(
              title: '[未経験者歓迎！]スタッフ募集（仮）',
              iconTextPairs: [
                [Icons.star, '10:00~11:00'],
                [Icons.home, '大阪市北区浪花町'],
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Spacer(),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '時給 ',
                          style: TextStyle(
                            fontSize: 20, // 较小的字体大小
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '1,000円',
                          style: TextStyle(
                            fontSize: 27, // 较大的字体大小
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleRowWidget extends StatelessWidget {
  final String text;
  final VoidCallback onAddPressed;
  final VoidCallback onRemovePressed;

  MiddleRowWidget({
    required this.text,
    required this.onAddPressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15), // 设置边距
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black), // 黑色边框
                borderRadius: BorderRadius.circular(6.0)),
            padding: EdgeInsets.only(left: 3, right: 3), // 文本的内边距
            child: Text(text),
          ),
          Spacer(), // 在文本和按钮之间添加空间
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onAddPressed,
                iconSize: 20,
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: onRemovePressed,
                iconSize: 20,
              ),
            ],
          ),
          // IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: onAddPressed,
          //   iconSize: 20,
          // ),
          // SizedBox(width: 4.0),
          // IconButton(
          //   icon: Icon(Icons.favorite_border),
          //   onPressed: onRemovePressed,
          //   iconSize: 20,
          // ),
        ],
      ),
    );
  }
}

class TriangleTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: CustomPaint(
        painter: RightAngleTrianglePainter(),
        child: Transform.rotate(
          origin: Offset(-25, -60),
          // angle: 0,
          angle: -0.785398, // 根据三角形的宽高比计算角度
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            child: Text(
              '応募締切',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class RightAngleTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0); // Top left corner of the square
    path.lineTo(size.width / 2, 0); // Middle of the top edge
    path.lineTo(0, size.height / 2); // Middle of the left edge
    path.close(); // Connect back to the start

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
