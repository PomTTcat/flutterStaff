import 'package:flutter/material.dart';

class StaffDetailPrepareButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isHighlight;
  final VoidCallback onPressed;
  final double height;

  static const Color customRed = Color(0xFFFF6767);

  const StaffDetailPrepareButton({
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
