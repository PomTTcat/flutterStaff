import 'package:flutter/material.dart';

// 控件3：自定义字符串和图标控件
class TextDesWidget extends StatelessWidget {
  final String title;
  final List<List<dynamic>> iconTextPairs;

  const TextDesWidget({
    required this.title,
    required this.iconTextPairs,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
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
          ...iconTextPairs.map((pair) {
            return Row(
              children: [
                Icon(pair[0] as IconData, size: 16),
                SizedBox(width: 8),
                Text(pair[1] as String, style: TextStyle(fontSize: 16)),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
