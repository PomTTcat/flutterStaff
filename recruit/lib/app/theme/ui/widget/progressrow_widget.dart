import 'package:flutter/material.dart';

class ProgressRowWidget extends StatelessWidget {
  final String leftText;
  final String rightText;
  final double progress;

  const ProgressRowWidget({
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
