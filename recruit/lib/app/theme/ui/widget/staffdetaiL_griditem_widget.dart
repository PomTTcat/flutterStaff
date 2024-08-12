import 'package:flutter/material.dart';
import 'package:recruit/app/data/model/staffgriditem_model.dart';

class StaffDetailGridItemWidget extends StatelessWidget {
  final StaffGridItemModel model;

  const StaffDetailGridItemWidget({
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
