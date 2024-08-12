import 'package:flutter/material.dart';

class StafffDetailMapWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onButtonPressed;

  const StafffDetailMapWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onButtonPressed,
  }) : super(key: key);

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
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double width = constraints.maxWidth;
              double height = width / 2; // Maintain a 2:1 aspect ratio
              return Container(
                width: width,
                height: height,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: onButtonPressed,
            child: Text(
              '地図アプリで確認する',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
