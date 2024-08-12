import 'package:flutter/material.dart';

import '../../../../app/data/model/progrees_model.dart';
import './progressrow_widget.dart';

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
class StaffDetailEvaluationWidget extends StatelessWidget {
  final ProgressModel progressModel;

  StaffDetailEvaluationWidget({required this.progressModel});

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
              child: ProgressRowWidget(
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
