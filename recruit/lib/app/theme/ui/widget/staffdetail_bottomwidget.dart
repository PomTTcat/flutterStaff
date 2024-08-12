import 'package:flutter/material.dart';

class StaffDetailBottomWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onMainButtonPressed;
  final VoidCallback onFavoriteButtonPressed;
  final VoidCallback onSettingsButtonPressed;

  const StaffDetailBottomWidget({
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
