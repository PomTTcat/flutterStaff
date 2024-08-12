import 'package:flutter/material.dart';

class StaffDetailTopImage extends StatelessWidget {
  final String imageUrl;

  const StaffDetailTopImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        double height = width / 2;
        return Container(
          width: width,
          height: height,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
