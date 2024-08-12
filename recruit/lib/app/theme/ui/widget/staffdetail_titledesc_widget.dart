import 'package:flutter/material.dart';

class StaffDetailTitleDescWidget extends StatelessWidget {
  final String title;
  final String description;

  const StaffDetailTitleDescWidget({
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
