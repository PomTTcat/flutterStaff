import 'package:flutter/material.dart';

class FixedDivider extends StatelessWidget {
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
